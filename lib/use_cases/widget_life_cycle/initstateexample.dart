import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Async islemler initState icerisinde yapilamaz.
/// Bunun yerine didChangeDependencies icerisinde yapilabilir.
/// Ama build hemen arkasindan calisir.
/// Builde yetismez ise hata aliriz.
/// Context ne zaman hazir olur?
/// Initstate'e girer girmez context erisilebilir degildir.
/// Mounted oldmasi icin initTsate initiazlie islemi bitmis olmasi gerekir.
/// Context mounted-yani monte edilmis

class ExampleIntiState extends StatefulWidget {
  const ExampleIntiState({super.key});

  @override
  State<ExampleIntiState> createState() => _ExampleIntiStateState();
}

class _ExampleIntiStateState extends State<ExampleIntiState> {

  late final SharedPreferences preferences;


  /// INitSatate async yapilabilir
  /// Ama bu dogru degildir.
  @override
  void initState() {
     //Future.delayed(Duration(seconds: 3));

    /// Burda await yazamayiz. InitState senkron calisir.
    /// Bunun yerine bunu DidChangeDependencies icerisinde yapabiliriz.
    // preferences=await SharedPreferences.getInstance();
    // TODO: implement initState
    super.initState();
  }


  @override
  void didChangeDependencies() async{
    preferences=await SharedPreferences.getInstance();

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }



  @override
  Widget build(BuildContext context) {

    return const Center(
      child: Text("Example Init State"),
    );
  }
}
