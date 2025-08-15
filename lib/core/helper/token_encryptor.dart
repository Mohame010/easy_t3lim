import 'package:encrypt/encrypt.dart' as encrypt;


class TokenEncryptor {
  static final _key = encrypt.Key.fromUtf8('my32lengthsupersecretnooneknows1'); // لازم 32 حرف
 
 static String encryptToken(String token) {
  final iv = encrypt.IV.fromSecureRandom(16);
  final encrypter = encrypt.Encrypter(encrypt.AES(_key));
  final encrypted = encrypter.encrypt(token, iv: iv);
  return '${encrypted.base64}|${iv.base64}'; 
}

static String decryptToken(String encryptedWithIv) {
  final parts = encryptedWithIv.split('|');
  if (parts.length != 2) throw ArgumentError('Invalid encrypted format');

  final encryptedToken = parts[0];
  final iv = encrypt.IV.fromBase64(parts[1]);

  final encrypter = encrypt.Encrypter(encrypt.AES(_key));
  final decrypted = encrypter.decrypt64(encryptedToken, iv: iv);
  return decrypted;
}


}
