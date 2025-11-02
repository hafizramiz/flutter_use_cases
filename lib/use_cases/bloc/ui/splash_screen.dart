import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  // Animasyon için Controller tanımlıyoruz.
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // 1. Animasyon Kontrolcüsü (Controller) kurulumu
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100), // 1 saniyelik animasyon süresi
    );

    // 2. Animasyonun Değer Aralığı (Tween) ve Tipi
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutCubic, // Yumuşak bir yaylanma efekti için
      ),
    );

    // 3. Animasyonu tekrar tekrar oynatma (Logo'nun nabız atması gibi)
    _animationController.repeat(reverse: true);

    // Giriş kontrolünü başlat
    checkLoginStatus();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // Giriş durumunu kontrol eden ve yönlendirme yapan asenkron fonksiyon
  checkLoginStatus() async {
    // Splash screen için belirlenen bekleme süresi (Animasyonlar bitene kadar)
    await Future.delayed(const Duration(seconds: 1));

    // Burası, kullanıcının gerçek giriş durumunu kontrol edeceğiniz yerdir.
    // Örn: SharedPreferences, Firebase veya başka bir depolama servisi
    bool isLoggedIn = false; // Şu an için false olarak ayarlandı

    if (isLoggedIn) {
      // Ana sayfaya yönlendir
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // Giriş (Login) sayfasına yönlendir
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Arka plan için gradient (geçişli) renk uygulaması
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF8E2DE2), // Koyu Mor
              Color(0xFF4A00E0), // Parlak Mavi/Mor
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        // Ekranın ortasına yerleştirme
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Animasyonlu Logo Alanı
              ScaleTransition(
                scale: _scaleAnimation, // Ölçeklendirme animasyonunu uygula
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.diamond, // Güzel bir simge seçimi (Uygulama Logonuz Olacak)
                    size: 80,
                    color: Color(0xFF4A00E0),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Uygulama Adı Metni
              const Text(
                'Uygulama Adı',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 10),
              // Slogan veya Açıklama
              const Text(
                'Hayallerinizdeki Uygulama',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 60),
              // Yüklenme Göstergesi (Loading Indicator)
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                strokeWidth: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
