import 'package:axiom_admin/model/settings_model.dart';

abstract class PolicyState {}

class PolicyLoading extends PolicyState {}

class PolicyLoaded extends PolicyState {
  final SettingsModel policy;

  PolicyLoaded(this.policy);
}

class PolicyError extends PolicyState {
  final String message;

  PolicyError(this.message);
}
