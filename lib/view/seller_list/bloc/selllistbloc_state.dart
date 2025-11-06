import 'package:axiom_admin/model/property_model.dart';

abstract class SelllistblocState {}

class SellPropertyInitial extends SelllistblocState {}

class SellPropertyLoading extends SelllistblocState {}

class SellPropertyLoaded extends SelllistblocState {
  final List<Property> properties;
  SellPropertyLoaded(this.properties);
}

class SellPropertyError extends SelllistblocState {
  final String message;
  SellPropertyError(this.message);
}

class SellPropertyActionSuccess extends SelllistblocState {
  final String message;
  SellPropertyActionSuccess(this.message);
}
