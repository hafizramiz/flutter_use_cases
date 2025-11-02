import 'package:flutter/material.dart';

/// Provider ile  bir agaca entegre ettigimiz zaman
/// onun degismesini haber vermiyor
/// ChangeNotifierProvider kullanmaliyiz bunun icin
/// 


class ProviderExample extends StatefulWidget {
  const ProviderExample({super.key});

  @override
  State<ProviderExample> createState() => _ProviderExampleState();
}

class _ProviderExampleState extends State<ProviderExample> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
