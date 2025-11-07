import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// BLoc Bussiness Logic Component
/// Sonradan basveren processleri handle etmek icin burdaki yontemler
/// farklidir.
/// Sonradan bas veren surecten kasit login_request_model dugmesina basildi ama sonus
/// state belirlenmedi daha. belirlendigi anda UI guncellenecek ve Navigation yapilacak
/// BlocComsumer var mesela
/// Listener ve
/// builder parametresi var
class BlocExample extends StatefulWidget {
  const BlocExample({super.key});

  @override
  State<BlocExample> createState() => _BlocExampleState();
}

class _BlocExampleState extends State<BlocExample> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      /// Mevcut builder kodlari burda yer alir.
      builder: (BuildContext context, state) {
        return const Center(child: Text("Bloc Example"));
      },

      /// Listener da sonradan basveren durumlar icin
      listener: (BuildContext context, state) {},
    );
  }
}
