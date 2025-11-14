import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// Projenizdeki yolları güncelleyin
import 'package:flutter_use_case/use_cases/bloc/bloc_state.dart'; 
import 'package:flutter_use_case/use_cases/bloc/view_model/LoginViewModel.dart';

import '../../inherited_example/app_theme/app-theme-scope.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Kullanıcı adı ve şifre alanları için Controller'lar
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    
    // LoginViewModel'den gelen durum değişikliklerini dinle
    context.read<LoginViewModel>().addListener(_handleLoginStateChange);
  }

  // Giriş durumu değişimlerini yöneten yardımcı fonksiyon
  void _handleLoginStateChange() {
    final state = context.read<LoginViewModel>().state;

    // Giriş başarılıysa ana sayfaya yönlendir
    if (state is LoginSuccess) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  void dispose() {
  
    super.dispose();
  }

  // Giriş butonuna basıldığında tetiklenecek fonksiyon
  void _performLogin() async {
    // ViewModel'in login_request_model fonksiyonunu çağır
    await context
        .read<LoginViewModel>()
        .login(_usernameController.text, _passwordController.text);
    
    // Yönlendirme işlemi zaten listener içinde yapılacak.
  }

  @override
  Widget build(BuildContext context) {
    // Widget'ın durumunu dinle
    final state = context.watch<LoginViewModel>().state;
    final isLoading = state is LoginLoading;
    final isError = state is LoginFailure;
    final error = isError ? (state as LoginFailure).errorMessage : null;

    return Scaffold(
      backgroundColor: AppThemeScope.of(context).theme.colors.primary,
      // Scaffold'a SafeArea ekleyerek içeriği güvenli alanda tutuyoruz.
      body: SafeArea(
        // Arka plan gradient'i
        child: Container(
          // decoration: const BoxDecoration(
          //   gradient: LinearGradient(
          //     colors: [
          //       Color(0xFF8E2DE2), // Koyu Mor
          //       Color(0xFF4A00E0), // Parlak Mavi/Mor
          //     ],
          //     begin: Alignment.topLeft,
          //     end: Alignment.bottomRight,
          //   ),
          // ),
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32.0),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      // Uygulama Başlığı/Logosu
                      const Text(
                        'Giriş Yap',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4A00E0),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Kullanıcı Adı Alanı
                      _buildTextField(
                        controller: _usernameController,
                        label: 'Kullanıcı Adı',
                        icon: Icons.person,
                        enabled: !isLoading,
                      ),
                      const SizedBox(height: 20),

                      // Şifre Alanı
                      _buildTextField(
                        controller: _passwordController,
                        label: 'Şifre',
                        icon: Icons.lock,
                        isPassword: true,
                        enabled: !isLoading,
                      ),
                      const SizedBox(height: 30),

                      // Hata Mesajı
                      if (isError)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: Text(
                            error!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                      // Giriş Butonu / Yüklenme Göstergesi
                      ElevatedButton(
                        onPressed: isLoading ? null : _performLogin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4A00E0),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 5,
                        ),
                        child: isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 3,
                                ),
                              )
                            : const Text(
                                "GİRİŞ",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Özel Text Alanı Widget'ı
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool isPassword = false,
    required bool enabled,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      enabled: enabled,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: const Color(0xFF4A00E0)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[100],
        contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
      ),
    );
  }
}
