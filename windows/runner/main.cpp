#include <flutter/dart_project.h>
#include <flutter/flutter_view_controller.h>
#include <windows.h>

#include "flutter_window.h"
#include "utils.h"

#include <string>
#include <memory>

#ifndef WDA_EXCLUDEFROMCAPTURE
#define WDA_EXCLUDEFROMCAPTURE 0x00000011
#endif


bool isRemoteSession() {
  return GetSystemMetrics(SM_REMOTESESSION) != 0;
}

int APIENTRY wWinMain(_In_ HINSTANCE instance, _In_opt_ HINSTANCE prev,
                      _In_ wchar_t *command_line, _In_ int show_command) {
  if (!::AttachConsole(ATTACH_PARENT_PROCESS) && ::IsDebuggerPresent()) {
    CreateAndAttachConsole();
  }

  ::CoInitializeEx(nullptr, COINIT_APARTMENTTHREADED);

  flutter::DartProject project(L"data");
  std::vector<std::string> command_line_arguments = GetCommandLineArguments();
  project.set_dart_entrypoint_arguments(std::move(command_line_arguments));

  FlutterWindow window(project);
  Win32Window::Point origin(10, 10);
  Win32Window::Size size(1280, 720);
  if (!window.Create(L"Easy Ta3lim", origin, size)) {
    return EXIT_FAILURE;
  }


  HWND hwnd = window.GetHandle();

  // ✅ منع تسجيل الشاشة
  if (!SetWindowDisplayAffinity(hwnd, WDA_EXCLUDEFROMCAPTURE)) {
    // fallback للأنظمة الأقدم
    SetWindowDisplayAffinity(hwnd, WDA_MONITOR);
  }

  // ✅ لو في جلسة Remote
  if (isRemoteSession()) {
    MessageBox(hwnd,
               L"التطبيق لا يعمل أثناء جلسة Remote Desktop أو مشاركة شاشة.\nمن فضلك افتح التطبيق محلياً.",
               L"تحذير أمني",
               MB_ICONWARNING | MB_OK);
    return EXIT_FAILURE; // اقفل التطبيق
  }

  window.SetQuitOnClose(true);

  ::MSG msg;
  while (::GetMessage(&msg, nullptr, 0, 0)) {
    ::TranslateMessage(&msg);
    ::DispatchMessage(&msg);
  }

  ::CoUninitialize();
  return EXIT_SUCCESS;
}
