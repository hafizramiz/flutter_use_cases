/// 🚦 Uygulama içindeki sayfa yönlendirmeleri için kullanılan sabit kodları tanımlayan
/// abstract sınıf.
///
/// Tüm kodlar, sınıfın adıyla doğrudan erişilebilen static const int
/// değişkenler olarak tanımlanmıştır.
abstract class PageDirectionCodes {
  // Bu sınıf abstract olduğu için instance (örnek) oluşturulamaz.
  const PageDirectionCodes._();

  // --- Genel ve Varsayılan Kodlar (0 - 9) ---

  /// Yönlendirme yok, mevcut sayfada kal (Genellikle başarılı/beklenmeyen durum).
  static const int none = 0;

  // --- Başarılı İşlem Sonrası Yönlendirmeler (10 - 49) ---

  /// Başarılı giriş veya işlem sonrası ana sayfaya yönlendirme.
  static const int home = 10;

  /// Profil düzenleme sayfasına yönlendirme (Örn. İlk giriş sonrası).
  static const int editProfile = 11;

  // --- Hata/Ek İşlem Gerektiren Yönlendirmeler (50 - 99) ---

  /// Kullanıcının parola sıfırlama sayfasına yönlendirilmesi gerekiyor.
  static const int passwordReset = 50;

  /// Kullanıcının cihaz doğrulaması (OTP, vs.) yapması gerekiyor.
  static const int deviceVerification = 51;

  /// Uygulama bakımdaysa gösterilecek sayfa.
  static const int maintenance = 98;

  /// Giriş sayfasına geri dön (Örn: Session timeout veya hatalı giriş).
  static const int login = 99;
}