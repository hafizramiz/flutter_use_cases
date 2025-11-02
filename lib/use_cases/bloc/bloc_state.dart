import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class LoginState extends Equatable{
  @override
  List<Object?> get props => [];
}

/// State'lerin bur sekilde yazmak cok daha kullanisli oluyor.
/// Kontrolunu de is keywordu ile yapiyoruz.
/// Bunu yapinca bir de performans bakimindan ilave bir ilave islem de yapmamiz lazim
///
///Bunun icin Eqautable eklememiz lazim. Objelerin berabetligini analamimza yarar
///Iki defa error giderse yeniden build etmez


class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {}
class LoginFailure extends LoginState {
  final String errorMessage;
  LoginFailure(this.errorMessage);
  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
}


