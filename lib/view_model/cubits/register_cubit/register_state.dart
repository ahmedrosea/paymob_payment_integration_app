part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterAuthSuccessed extends RegisterState {}

class RegisterAuthFailed extends RegisterState {}

class RegisterOrderSuccessed extends RegisterState {}

class RegisterOrderFailed extends RegisterState {}

class PaymentTokenSuccessed extends RegisterState {}

class PaymentTokenFailed extends RegisterState {}

class KioskRefCodeSuccessed extends RegisterState {}

class KioskRefCodeFailed extends RegisterState {}

class LoadingOn extends RegisterState {}

class LoadingOff extends RegisterState {}
