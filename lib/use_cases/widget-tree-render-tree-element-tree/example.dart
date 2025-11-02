import 'package:flutter/material.dart';

///Even if there is another method that could be overridden (createElement),
///the latter is almost never overridden. The only one that needs to be overridden is build.
//
// The lifecycle of such Stateless widget is straightforward:
//
// initialization
// rendering via build()

// didChangeDependencies() metotu icinde expensive islemler yapabilirsin
// Build metotu icinde expensive islemler yapmamaliyiz. Bundan kacinmaliyiz.
class WidgetA extends StatefulWidget {
  WidgetA({super.key}) {
    print("Widget A Constructor");
  }

  @override
  State<WidgetA> createState() => _WidgetAState();
}

class _WidgetAState extends State<WidgetA> {
  _WidgetAState() {
    print("Widget A State Constructor");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {

          print("-=========Set state called==========");
        });
      }),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.red,
        child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Widget A"),
            WidgetB(),
          ],
        )),
      ),
    );
  }
}



/// WidgetB clasinin bir tane degiskeni var State isimli degisken
/// abstract class StatefulWidget extends Widget {
//   /// Initializes [key] for subclasses.
//   const StatefulWidget({super.key});
// 
//   /// Creates a [StatefulElement] to manage this widget's location in the tree.
//   ///
//   /// It is uncommon for subclasses to override this method.
//   @override
//   StatefulElement createElement() => StatefulElement(this);
/// 
///   /// The framework can call this method multiple times over the lifetime of
//   /// a [StatefulWidget]. For example, if the widget is inserted into the tree
//   /// in multiple locations, the framework will create a separate [State] object
//   /// for each location. Similarly, if the widget is removed from the tree and
//   /// later inserted into the tree again, the framework will call [createState]
//   /// again to create a fresh [State] object, simplifying the lifecycle of
//   /// [State] objects.
//   @protected
//   @factory
//   State createState();
/// 
/// 
/// Create element ve create state diye metotlari var. 
/// Stateful iki metotu var
/// 1. createElement
/// 2. createState
/// CreateState metotu baska bir state objesi olusturmak
/// icin kullaniliyor.
/// Her ikisi de cagirdigi sinifi set state'de tekrar yikip yeniden yapmiyor.

class WidgetB extends StatefulWidget {
  WidgetB({super.key}) {
    print("Widget B Constructor");
  }



  /// Setstate yaptigimiz zaman state constructorlari yeniden tetiklenmiyor
  /// .WidgetB stateful widgetlarin constructorlari yeniden tetikleniyor.
  /// Burda bir tane metotunu override ediyoruz createState
  @override
  State<WidgetB> createState() => _WidgetBState();
  
  @override
  StatefulElement createElement() {
    print("Widget B Create Element method ");
    // TODO: implement createElement
    return super.createElement();
  }

  /// createState ve createElement methodlari
/// Stateful widgetlarda override edilen metotlardir.
/// Bunlar bir kere oluşturulur. Setstate ile tetiklenmezler.
/// Yani yeniden state'i yikip yeniden olusturma yoktur.

}

/// Burasi artik state Sinifidir.Bu sinifin bir kac metot ve parametreleri var.
/// Parametleri
/// 1. _debuglifecylce
///
///  /// The current stage in the lifecycle for this state object.
//   ///
//   /// This field is used by the framework when asserts are enabled to verify
//   /// that [State] objects move through their lifecycle in an orderly fashion.
//   _StateLifecycle _debugLifecycleState = _StateLifecycle.created;
///
///
///
///












class _WidgetBState extends State<WidgetB> {
  _WidgetBState() {
    print("Widget B State Constructor");
  }




  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      height: 400,
      width: 400,
      child: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Widget B"),
          WidgetC(),
        ],
      )),
    );
  }
}

class WidgetC extends StatefulWidget {
  WidgetC({super.key}) {
    ;
    print("Widget C Constructor");
  }

  @override
  State<WidgetC> createState() => _WidgetCState();
}

class _WidgetCState extends State<WidgetC> {
  _WidgetCState() {
    print("Widget C State Constructor");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      color: Colors.green,
      child: Center(child: Column(
        children: [
          const Text("Widget C"),
          WidgetD(),
        ],
      )),
    );
  }
}



class WidgetD extends StatefulWidget {
   WidgetD({super.key}){
    print("Widget D Constructor");
  }

  @override
  State<WidgetD> createState() => _WidgetDState();
}

class _WidgetDState extends State<WidgetD> {


  // _StateLifecycle tipinde boyle bir parametresi var ama bunu abstract class'ta
  /// underscore ile yazmis ki ulasamak mumkun olmasin
  ///  _StateLifecycle _debugLifecycleState = _StateLifecycle.created;

  /// Init state metotu icinde girer girmez context mounted olmuyor.
  /// Yani monte edilmis olmuyor. Bu yuzden init state icinde context'e
  /// eristigimiz zaman hata alabiliriz bazen.
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }



  _WidgetDState(){
    print("Widget D State Constructor");
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.blue,
      child: const Center(child: Text("Widget D")),

    );
  }
}

/// Widget diyerek erisim yapabilmemizin sebebi. Bur getter olmasidir.
/// @optionalTypeArgs
// abstract class State<T extends StatefulWidget> with Diagnosticable {
//   /// The current configuration.
//   ///
//   /// A [State] object's configuration is the corresponding [StatefulWidget]
//   /// instance. This property is initialized by the framework before calling
//   /// [initState]. If the parent updates this location in the tree to a new
//   /// widget with the same [runtimeType] and [Widget.key] as the current
//   /// configuration, the framework will update this property to refer to the new
//   /// widget and then call [didUpdateWidget], passing the old configuration as
//   /// an argument.
//   T get widget => _widget!;
//   T? _widget;




/// Boyle bir enum'var
/// Tracks the lifecycle of [State] objects when asserts are enabled.
enum _StateLifecycle {
  /// The [State] object has been created. [State.initState] is called at this
  /// time.
  created,

  /// The [State.initState] method has been called but the [State] object is
  /// not yet ready to build. [State.didChangeDependencies] is called at this time.
  initialized,

  /// The [State] object is ready to build and [State.dispose] has not yet been
  /// called.
  ready,

  /// The [State.dispose] method has been called and the [State] object is
  /// no longer able to build.
  defunct,
}




// Dishank Jindal If you just need theme or media query values in build(),
// don’t move them to didChangeDependencies() just use Theme.of(context) directly.
// You only need didChangeDependencies() if you cache or compute something expensive based on those values.