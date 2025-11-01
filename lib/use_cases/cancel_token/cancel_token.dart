import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class CancelTokenExample extends StatefulWidget {
  const CancelTokenExample({super.key});
  @override
  State<CancelTokenExample> createState() => _CancelTokenExampleState();
}

class _CancelTokenExampleState extends State<CancelTokenExample> {
  // 1. CancelToken'ı oluşturun.
  final CancelToken _cancelToken = CancelToken();
  final Dio _dio = Dio();
  String _userData = "Veriler yükleniyor...";

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  // 3. İsteği başlatan State nesnesi ağaçtan söküldüğünde (dispose edildiğinde)...
  @override
  void dispose() {
    // Tüm bekleyen istekleri iptal et!
    _cancelToken.cancel("Kullanıcı sayfadan ayrıldı.");
    super.dispose();
  }

  // 2. _fetchUserData metodu: İsteğe CancelToken'ı dahil edin.
  Future<void> _fetchUserData() async {
    try {
      final response = await _dio.get(
        'https://jsonplaceholder.typicode.com/posts/1', // Gerçek bir API adresi
        cancelToken: _cancelToken, // Token'ı buraya veriyoruz.
      );

      // İstek başarılı oldu, setState ile veriyi güncelle.
      // Not: Bu noktada if (mounted) kontrolü teknik olarak hala gerekmez,
      // çünkü eğer dispose olsaydı, zaten CancelToken hata fırlatıp catch bloğuna düşerdi.
      // Ancak güvenlik katmanı olarak tutulabilir.
      if (mounted) {
        setState(() {
          _userData = response.data['title'] ?? 'Veri çekildi.';
        });
      }

    } on DioException catch (e) {
      // 4. İptal durumunu yakalama:
      if (CancelToken.isCancel(e)) {
        // Bu bir iptal hatasıdır. Normal bir hata olarak ele alınmaz.
        print("İstek iptal edildi. Sebep: ${e.message}");
        // setState çağırmaya gerek yok, çünkü sayfa zaten dispose oluyor.
        return;
      }

      // Diğer ağ hatalarını (404, 500 vb.) burada yönetin
      if (mounted) {
        setState(() {
          _userData = "Hata: Sunucuya ulaşılamadı.";
        });
      }

    } catch (e) {
      // Genel hatalar
      print("Beklenmedik bir hata oluştu: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil Sayfası')),
      body: Center(
        child: Text(
          _userData,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}