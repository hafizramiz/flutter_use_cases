import 'dart:convert';
import 'package:flutter_use_case/use_cases/securit-example/page_direction_codes.dart';

/// Init response Model https://docs.google.com/document/d/1DyYZGYsIzhGpybsuvgv_fs_EWtqW_3IsSq1dIov40xQ/edit?hl=tr&tab=t.0

/// 🌐 API veya uygulama içi genel yanıt modelidir.
/// Başarılı veya hatalı tüm isteklerin ortak yapısını temsil eder.
class InitResponseModel {
  /// HTTP veya uygulama içi işlem sonucu durum kodu (Örn: 200, 404, 500).
  final int statusCode;

  /// Yanıt tipini belirtir (genellikle "TResponse" olarak gelir).
  final String type;

  /// İşlem veya hata mesajını içerir.
  final String message;

  /// Bu yanıtın hangi isteğe ait olduğunu belirten kod.
  final int methodId;

  /// Yönlendirme kodu (örn: login, home, password reset).
  final int pageDirectionCode;

  /// Oturum kimliği.
  final String sessionId;
  /// The id token returned by the authorization server.
  final String? idToken;

  /// Oturumun en son aktif olduğu zaman (opsiyonel).
  final DateTime? lastActivedTime;

  /// Yanıtla birlikte dönen ana veri yükü.
  final Map<String, dynamic>? data;

  static const String _typeKey = '__type';

  const InitResponseModel({
    this.statusCode = 200,
    required this.type,
    required this.message,
    required this.methodId,
    required this.pageDirectionCode,
    required this.sessionId,
    this.lastActivedTime,
    this.data,
    required this.idToken
  });

  /// 🏭 Fabrika metodu: JSON verisini modele dönüştürür.
  factory InitResponseModel.fromJson(Map<String, dynamic> json) {
    return InitResponseModel(
      idToken: json['idToken'] as String? ?? '',
      statusCode: json['statusCode'] as int? ?? 200,
      type: json[_typeKey] as String? ?? 'TResponse',
      message: json['message'] as String? ?? 'Bilinmeyen hata.',
      methodId: json['methodId'] as int? ?? json['method id'] as int? ?? -1,
      pageDirectionCode:
          json['pageDirection'] as int? ??
          json['Page direction'] as int? ??
          PageDirectionCodes.none,
      sessionId:
          json['sessionId'] as String? ?? json['Session id'] as String? ?? '',
      lastActivedTime: json['lastActivedTime'] != null
          ? DateTime.tryParse(json['lastActivedTime'])
          : null,
      data: json['data'] != null
          ? Map<String, dynamic>.from(json['data'])
          : null,
    );
  }

  /// 🔁 Modeli JSON formatına dönüştürür.
  Map<String, dynamic> toJson() => {
    'statusCode': statusCode,
    _typeKey: type,
    'message': message,
    'methodId': methodId,
    'pageDirection': pageDirectionCode,
    'sessionId': sessionId,
    if (lastActivedTime != null)
      'lastActivedTime': lastActivedTime!.toIso8601String(),
    if (data != null) 'data': data,
  };

  /// 🎯 Yönlendirme kodunu açıklayıcı bir metne çevirir.
  String get directionName {
    switch (pageDirectionCode) {
      case PageDirectionCodes.login:
        return 'Giriş Sayfası';
      case PageDirectionCodes.home:
        return 'Ana Sayfa';
      case PageDirectionCodes.passwordReset:
        return 'Parola Sıfırlama';
      default:
        return 'Bilinmeyen Sayfa';
    }
  }

  @override
  String toString() =>
      '''
InitResponseModel(
  statusCode: $statusCode,
  type: $type,
  message: $message,
  methodId: $methodId,
  pageDirectionCode: $pageDirectionCode ($directionName),
  sessionId: $sessionId,
  lastActivedTime: ${lastActivedTime?.toIso8601String() ?? 'null'},
  data: ${data != null ? jsonEncode(data) : 'null'}
)
''';
}

/// 🧭 Örnek kullanım:
///
/// ```dart
/// void main() {
///   const String jsonString = '''
///   {
///     "__type": "TResponse",
///     "message": "Oturum süresi doldu.",
///     "methodId": 10,
///     "pageDirection": 99,
///     "sessionId": "98f.../..."
///   }
///   ''';
///
///   final Map<String, dynamic> jsonMap = json.decode(jsonString);
///   final response = InitResponseModel.fromJson(jsonMap);
///
///   print('--- Gelen Yanıt ---');
///   print(response);
///
///   // Kod tabanlı yönlendirme:
///   switch (response.pageDirectionCode) {
///     case PageDirectionCodes.login:
///       print('🚨 Kullanıcı Giriş Sayfasına yönlendiriliyor.');
///       break;
///     case PageDirectionCodes.home:
///       print('✅ Kullanıcı Ana Sayfaya yönlendiriliyor.');
///       break;
///     default:
///       print('⚙️ Yönlendirme yok veya bilinmiyor.');
///   }
/// }
/// ```
