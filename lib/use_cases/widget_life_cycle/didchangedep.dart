import 'package:flutter/material.dart';


/// DidChangeDependencies  ilk acilista bir defa calisir.
/// Build ilk acilista iki defa calisir.
/// SetState ile guncelleme yaparsak 
/// build bir defa calisir. 
/// DidChangeDependencies  calismaz.
/// State Sinifinin Constructor'i calismaz. State Immutabel'dir.
/// StatefulWidget Sinifinin Constructor'i her seferinde calisir. En ustte ise
/// calismaz. Bir altinda olaninki calisitir, Cunku build yeniden calistigi icin altindakileri
/// de calistirir.
/// Ama altindaki State sinifinin constructor'i calismaz. Cunku State imutabel'dir.
///



class DidChangeDepExample extends StatefulWidget {
   DidChangeDepExample({super.key}){
    print("DidChangeDepExample Constructor");
  }

  @override
  State<DidChangeDepExample> createState() => _DidChangeDepExampleState();
}

class _DidChangeDepExampleState extends State<DidChangeDepExample> {


  _DidChangeDepExampleState(){
    print("DidChangeDepExample State Constructor");
  }

  /// INitialize islemi init state icinde yapilir.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

int? counter;

  /// Expensive islemler burada yapilir. AMa hemen erkasindan build calisir.
  /// Builde yetismez ise hata aliriz.
  @override
  void didChangeDependencies() async{

    await Future.delayed(const Duration(seconds: 10));
    counter=42;

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }


/// Build iki defa calisiyor. Ilk yuklendiginde
  /// Daha sonra setstate ile state yenilemesi yaparsak
  /// build bir defa calisacak.
  @override
  Widget build(BuildContext context) {


    print("DidChangeDepExample build");
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          print("-=========Set state called==========");
        });
      }),
      body: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text("Did Change Dep Example"),
            ),
      
            Center(
              child: Text("Counter: ${counter!}"),
            ),
          ],
        ),
      ),
    );
  }
}
