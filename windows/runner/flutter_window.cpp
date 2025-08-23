#include "flutter_window.h"
#include <optional>
#include "flutter/generated_plugin_registrant.h"

#include <flutter/method_channel.h>
#include <flutter/standard_method_codec.h>
#include <TlHelp32.h>
#include <string>
#include <memory>

#include "../keyboard_blocker.h"  // ← زي ما عندك

// ============ Close Apps =================
void CloseAllOtherApps() {
    HANDLE hSnap = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
    PROCESSENTRY32 pe32;
    pe32.dwSize = sizeof(PROCESSENTRY32);

    if (Process32First(hSnap, &pe32)) {
        do {
            std::wstring exeName = pe32.szExeFile;

            // إغلاق AnyDesk لو شغال
            if (_wcsicmp(exeName.c_str(), L"AnyDesk.exe") == 0) {
                HANDLE hProcess = OpenProcess(PROCESS_TERMINATE, FALSE, pe32.th32ProcessID);
                if (hProcess != NULL) {
                    TerminateProcess(hProcess, 0);
                    CloseHandle(hProcess);
                }
            }

            // إغلاق باقي البرامج (مع استثناءاتك)
            if (exeName != L"desktop_app.exe" && exeName != L"explorer.exe") {
                HANDLE hProcess = OpenProcess(PROCESS_TERMINATE, FALSE, pe32.th32ProcessID);
                if (hProcess != NULL) {
                    TerminateProcess(hProcess, 0);
                    CloseHandle(hProcess);
                }
            }

        } while (Process32Next(hSnap, &pe32));
    }
    CloseHandle(hSnap);
}

// =========================================

FlutterWindow::FlutterWindow(const flutter::DartProject& project)
    : project_(project) {}

FlutterWindow::~FlutterWindow() {}

bool FlutterWindow::OnCreate() {
  if (!Win32Window::OnCreate()) {
    return false;
  }

  RECT frame = GetClientArea();
  flutter_controller_ = std::make_unique<flutter::FlutterViewController>(
      frame.right - frame.left, frame.bottom - frame.top, project_);
  if (!flutter_controller_->engine() || !flutter_controller_->view()) {
    return false;
  }

  // سجل البلَج إنز
  RegisterPlugins(flutter_controller_->engine());

  // اربط نافذة Flutter
  SetChildContent(flutter_controller_->view()->GetNativeWindow());

  // ← هنا messenger أصبح متاح
  KB_Init(flutter_controller_->engine()->messenger());  // موجود عندك أصلاً

  // 🔹 MethodChannel جديد للتحكم في إغلاق البرامج / التحقق من الأدمن
  auto channel = std::make_shared<flutter::MethodChannel<flutter::EncodableValue>>(
      flutter_controller_->engine()->messenger(),
      "app_control_channel",
      &flutter::StandardMethodCodec::GetInstance());

  channel->SetMethodCallHandler(
      [](const flutter::MethodCall<flutter::EncodableValue>& call,
         std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result) {
        if (call.method_name() == "closeOtherApps") {
            CloseAllOtherApps();
            result->Success(flutter::EncodableValue("done"));
        } else {
            result->NotImplemented();
        }
      });

  flutter_controller_->engine()->SetNextFrameCallback([&]() { this->Show(); });
  flutter_controller_->ForceRedraw();
  return true;
}

void FlutterWindow::OnDestroy() {
  // فك القناة والـ hook
  KB_Shutdown();   // زي ما عندك قبل كده

  if (flutter_controller_) {
    flutter_controller_ = nullptr;
  }
  Win32Window::OnDestroy();
}

LRESULT
FlutterWindow::MessageHandler(HWND hwnd, UINT const message, WPARAM const wparam, LPARAM const lparam) noexcept {
  if (flutter_controller_) {
    std::optional<LRESULT> result =
        flutter_controller_->HandleTopLevelWindowProc(hwnd, message, wparam, lparam);
    if (result) {
      return *result;
    }
  }

  switch (message) {
    case WM_FONTCHANGE:
      flutter_controller_->engine()->ReloadSystemFonts();
      break;
  }
  return Win32Window::MessageHandler(hwnd, message, wparam, lparam);
}
