import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Bazen provide ettigimiz'e hemen erismemiz gerekebilir.
/// Bu durumda context yenileyen bir sey yoksa Builder kullanila bilir
///


class BuilderExample extends StatefulWidget {
  const BuilderExample({super.key});

  @override
  State<BuilderExample> createState() => _BuilderExampleState();
}

class _BuilderExampleState extends State<BuilderExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<Counter>(
        create: (BuildContext context) {
          return Counter();
        },


        /// Burda Consumer context'i yeniledigi icin provide edilen seye hemen erismek mumun oluyor.
        /// Ama context yenilenmedigi surece provide edip hemen arkasindan
        /// erismek mumkun olmuyor.
        /// Bunun icin Builder kullanarak context'i yenilememiz gerekiyor
        child: Consumer<Counter>(builder: (BuildContext context, counter, __){
          return Center(child: Text("Value: ${counter.value}"));
        }),
      ),
    );
  }
}

class Counter with ChangeNotifier {
  int value = 0;

  void increment() {
    value++;
    notifyListeners();
  }
}
