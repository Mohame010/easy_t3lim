#include "keyboard_blocker.h"

#include <windows.h>
#include <memory>
#include <atomic>

#include <flutter/method_channel.h>
#include <flutter/standard_method_codec.h>

namespace {
  HHOOK g_hook = nullptr;
  std::atomic<bool> g_active{false};

  // اختصارات نغلق عندها التطبيق (تقدر تعدّلها)
  bool IsExitComboPressed(const KBDLLHOOKSTRUCT* kb) {
    // Alt + F4
    if ((GetAsyncKeyState(VK_MENU) & 0x8000) && kb->vkCode == VK_F4) return true;
    // Alt + Tab
    if ((GetAsyncKeyState(VK_MENU) & 0x8000) && kb->vkCode == VK_TAB) return true;
    // مفتاح Windows
    if (kb->vkCode == VK_LWIN || kb->vkCode == VK_RWIN) return true;
    return false;
  }

  LRESULT CALLBACK LowLevelKeyboardProc(int nCode, WPARAM wParam, LPARAM lParam) {
    if (nCode == HC_ACTION && (wParam == WM_KEYDOWN || wParam == WM_SYSKEYDOWN)) {
      const auto* kb = reinterpret_cast<KBDLLHOOKSTRUCT*>(lParam);
      if (g_active.load() && IsExitComboPressed(kb)) {
        // خروج فوري. بديل أنظف: PostQuitMessage(0) لكن قد يكون على ثريد مختلف.
        ExitProcess(0);
      }
    }
    return CallNextHookEx(g_hook, nCode, wParam, lParam);
  }

  void StartHook() {
    if (!g_hook) {
      g_hook = SetWindowsHookExW(WH_KEYBOARD_LL, LowLevelKeyboardProc, GetModuleHandleW(nullptr), 0);
      g_active.store(true);
    } else {
      g_active.store(true);
    }
  }

  void StopHook() {
    g_active.store(false);
    if (g_hook) {
      UnhookWindowsHookEx(g_hook);
      g_hook = nullptr;
    }
  }
}

// نعرّف القناة هنا (بدون registrar)
static std::unique_ptr<flutter::MethodChannel<flutter::EncodableValue>> g_channel;

void KB_Init(flutter::BinaryMessenger* messenger) {
  g_channel = std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
    messenger,
    "keyboard_blocker",
    &flutter::StandardMethodCodec::GetInstance()
  );

  g_channel->SetMethodCallHandler([](const auto& call,
                                     std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result) {
    const auto& method = call.method_name();
    if (method == "startBlocker") {
      StartHook();
      result->Success(flutter::EncodableValue(true));
    } else if (method == "stopBlocker") {
      StopHook();
      result->Success(flutter::EncodableValue(true));
    } else {
      result->NotImplemented();
    }
  });
}

void KB_Shutdown() {
  StopHook();
  g_channel.reset();
}
