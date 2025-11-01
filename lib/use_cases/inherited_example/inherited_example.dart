import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

// ... (InheritedExample, _InheritedExampleState ve FrogColor sınıfları buraya yapıştırılmalıdır)

/// Result:
// Success: DidChangeDependencies, icinde cagirma islemi
// Error: didUpdateWidget icinde cagirma islemi
// Error and Success : Build metotu icinde, Burda build de iki defa calisiyor.
//  LateInitializationError: Field 'themeData' has already been initialized.



class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  State<ParentWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  Color _currentColor = Colors.green;

  void _changeColor() {
    setState(() {
      _currentColor = _currentColor == Colors.green ? Colors.blue : Colors.green;
      print('--- FrogColor rengi değiştirildi: $_currentColor ---');
    });
  }

  @override
  Widget build(BuildContext context) {
    return FrogColor(
      color: _currentColor, // Bu veri değişecek
      child: Scaffold(
        appBar: AppBar(title: const Text('InheritedWidget Testi')),
        body: const Center(
          child: InheritedExample(), // Child Widget'ımız
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _changeColor, // Rengi değiştiren buton
          child: const Icon(Icons.palette),
        ),
      ),
    );
  }
}





class InheritedExample extends StatefulWidget {
  const InheritedExample({super.key});

  @override
  State<InheritedExample> createState() => _InheritedExampleState();
}

class _InheritedExampleState extends State<InheritedExample> {
  _InheritedExampleState(){
    print("_InheritedExampleState constructor called");
  }

  // Örnek olarak FrogColor'dan okunan veriyi tutmak için bir değişken
  Color? _inheritedColor;

  late final MediaQueryData mediaQuery;
    ThemeData? themeData;

  @override
  void initState() {
    // Burada InheritedWidget'a bağlanmak güvenli DEĞİLDİR
    // ancak sadece bağımlılık oluşturmak için kullanılabilir
    // ve genellikle didChangeDependencies'de yapılmalıdır.
    super.initState();
  }


  @override
  void didChangeDependencies() {
    // themeData= Theme.of(context);
     // mediaQuery = MediaQuery.of(context);

    print("🐸 DID CHANGE DEPENDENCIES CALLED 🐸");

    // // 1. FrogColor'a Bağımlılık Oluşturma:
    // // Bu çağrı, FrogColor'ın verisi değiştiğinde bu widget'ın yeniden inşa edilmesini (ve bu metodun tekrar çalışmasını) sağlar.
    // final frogColorWidget = FrogColor.of(context);
    //
    // // 2. Veriyi alma ve durumu kaydetme:
    // _inheritedColor = frogColorWidget.color;

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  
  
  @override
  void didUpdateWidget(covariant InheritedExample oldWidget) {
   // mediaQuery = MediaQuery.of(context);

    // mediaQuery = MediaQuery.of(context);
    // themeData= Theme.of(context);
    print("Did update widget called");

    // 1. FrogColor'a Bağımlılık Oluşturma:
    // Bu çağrı, FrogColor'ın verisi değiştiğinde bu widget'ın yeniden inşa edilmesini (ve bu metodun tekrar çalışmasını) sağlar.
    final frogColorWidget = FrogColor.of(context);

    // 2. Veriyi alma ve durumu kaydetme:
    _inheritedColor = frogColorWidget.color;
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }



  @override
  Widget build(BuildContext context) {
    /// Burda build de iki defa calisiyor.
    /// LateInitializationError: Field 'themeData' has already been initialized.
    /// Hatasi veriyor.
    themeData= Theme.of(context);
    // mediaQuery = MediaQuery.of(context);
    print("BUILD CALLED (Color: $_inheritedColor)");

    // Not: FloatingActionButton'daki setState() çağrısı artık
    // didChangeDependencies'i tetiklemez, sadece build'i tetikler.
    return Scaffold(
      body: Container(
        // FrogColor'dan gelen renge göre boyayalım
        color: themeData?.colorScheme.primary,
        // _inheritedColor,
        width: 200,
        // mediaQuery.size.width/2,
        height: 200,
        child: Center(
          child: Text(

            'Rengi Değiştirmek İçin FAB\'a Basın',
            style: TextStyle(color: _inheritedColor == Colors.blue ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}






class FrogColor extends InheritedWidget {
  const FrogColor({
    super.key,
    required this.color,
    required super.child,
  });

  final Color color;

  static FrogColor? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FrogColor>();
  }

  static FrogColor of(BuildContext context) {
    final FrogColor? result = maybeOf(context);
    assert(result != null, 'No FrogColor found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(FrogColor oldWidget) => color != oldWidget.color;
}




