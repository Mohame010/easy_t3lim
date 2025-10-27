import 'dart:io';

Future<bool> isRunningAsAdmin() async {
  if (Platform.isWindows) {
    final result = await Process.run('net', ['session']);
    return result.exitCode == 0;
  } else if (Platform.isLinux || Platform.isMacOS) {
    final result = await Process.run('id', ['-u']);
    final uid = result.stdout.toString().trim();
    return uid == '0'; // UID 0 is the root user
  }
  return false;
}
