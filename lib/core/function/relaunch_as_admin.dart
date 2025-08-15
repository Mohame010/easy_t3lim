import 'dart:io';

Future<bool> relaunchAsAdmin() async {
  if (Platform.isWindows) {
    final script =
        '''
Start-Process "${Platform.resolvedExecutable}" `
  -ArgumentList "'${Platform.script.toFilePath()}'" `
  -Verb RunAs
  ''';
    await Process.run('powershell', ['-Command', script]);
    exit(0); 
  } else if (Platform.isLinux || Platform.isMacOS) {
    final script =
     'exec sudo "${Platform.resolvedExecutable}" "${Platform.script.toFilePath()}"';
    await Process.run('bash', ['-c', script]);
    exit(0); 
    // يقفل التطبيق الأصلي
  }
  return false;
}
