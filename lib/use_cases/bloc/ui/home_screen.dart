import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // HomeScreen'i LoginScreen ile uyumlu, gradient bir arka plan ile sarıyoruz.
    return Scaffold(
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Başlık
                const Text(
                  "Hoş Geldiniz!",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 10),
                // Alt Başlık
                const Text(
                  "Ana Sayfanız Burası",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 50),
                // Ana Ekran Simgesi
                const Icon(
                  Icons.favorite_border,
                  size: 100,
                  color: Colors.white,
                ),
                const SizedBox(height: 50),
                
                // Çıkış Butonu (Opsiyonel)
                ElevatedButton.icon(
                  onPressed: () {
                    // Genellikle burada oturum kapatma (logout) mantığı uygulanır
                    // ve kullanıcı /login sayfasına geri yönlendirilir.
                    Navigator.pushReplacementNamed(context, '/login_request_model');
                  },
                  icon: const Icon(Icons.logout, color: Color(0xFF4A00E0)),
                  label: const Text(
                    "ÇIKIŞ YAP",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4A00E0),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
