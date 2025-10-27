import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class OverlayEntryBlackScreen extends StatelessWidget {
  const OverlayEntryBlackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () {
              windowManager.destroy();
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          '🚫 التسجيل غير مسموح به!',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
