import 'package:axiom_admin/model/property_model.dart';

abstract class PropertyState {}

class PropertyInitial extends PropertyState {}

class PropertyLoading extends PropertyState {}

class PropertyLoaded extends PropertyState {
  final List<Property> properties;
  PropertyLoaded(this.properties);
}

class PropertyError extends PropertyState {
  final String message;
  PropertyError(this.message);
}

class PropertyActionSuccess extends PropertyState {
  final String message;
  PropertyActionSuccess(this.message);
}
