import 'package:axiom_admin/model/property_model.dart';

abstract class PropertyEvent {}

class FetchProperties extends PropertyEvent {}

class ApproveProperty extends PropertyEvent {
  final Property property;
  ApproveProperty(this.property);
}

class RejectProperty extends PropertyEvent {
  final Property property;
  RejectProperty(this.property);
}
class DeleteProperty extends PropertyEvent{
  final Property property;
  DeleteProperty(this.property);
}
