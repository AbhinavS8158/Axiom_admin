import 'package:axiom_admin/model/property_model.dart';

abstract class PglistState {}

class PgPropertyInitial extends PglistState {}

class PgPropertyLoading extends PglistState {}

class PgPropertyLoaded extends PglistState {
  final List<Property> properties;
  PgPropertyLoaded(this.properties);
}

class PgPropertyError extends PglistState {
  final String message;
    PgPropertyError(this.message);
}

class PgPropertyActionSuccess extends PglistState {
  final String message;
  PgPropertyActionSuccess(this.message);
}
