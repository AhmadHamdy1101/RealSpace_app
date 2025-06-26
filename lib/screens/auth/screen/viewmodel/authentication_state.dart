part of 'authentication_cubit.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}
final class SignInLoading extends AuthenticationState {}
final class SignInScucess extends AuthenticationState {}
final class SignInFailure extends AuthenticationState {}

final class SignUpLoading extends AuthenticationState {}
final class SignUpScucess extends AuthenticationState {}
final class SignUpFailure extends AuthenticationState {}

final class SignOutLoading extends AuthenticationState {}
final class SignOutScucess extends AuthenticationState {}
final class SignOutFailure extends AuthenticationState {}
