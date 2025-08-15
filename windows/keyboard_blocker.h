#pragma once
#include <flutter/binary_messenger.h>

// تهيئة قناة الميثود شانيل + تركيب/فك الـ hook
void KB_Init(flutter::BinaryMessenger* messenger);
void KB_Shutdown();