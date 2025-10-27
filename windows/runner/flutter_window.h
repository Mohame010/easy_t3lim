#ifndef RUNNER_FLUTTER_WINDOW_H_
#define RUNNER_FLUTTER_WINDOW_H_

#include <flutter/dart_project.h>
#include <flutter/flutter_view_controller.h>

#include "win32_window.h"

class FlutterWindow : public Win32Window {
 public:
  explicit FlutterWindow(const flutter::DartProject& project);
  virtual ~FlutterWindow();

  // منع النسخ
  FlutterWindow(const FlutterWindow&) = delete;
  FlutterWindow& operator=(const FlutterWindow&) = delete;

  bool OnCreate() override;
  void OnDestroy() override;
  LRESULT MessageHandler(HWND window, UINT const message,
                         WPARAM const wparam,
                         LPARAM const lparam) noexcept override;

  // 🔹 دوال جديدة
  flutter::FlutterEngine* GetFlutterEngine();

 private:
  flutter::DartProject project_;
  std::unique_ptr<flutter::FlutterViewController> flutter_controller_;
};

#endif  // RUNNER_FLUTTER_WINDOW_H_
