import 'package:axiom_admin/model/property_model.dart';

abstract class PglistEvent {}

class PgFetchProperties extends PglistEvent {}

class PgApproveProperty extends PglistEvent {
  final Property property;
  PgApproveProperty(this.property);
}

class PgRejectProperty extends PglistEvent {
  final Property property;
  PgRejectProperty(this.property);
}
class PgPropertyDelete extends PglistEvent{
  final Property property;
  PgPropertyDelete(this.property);
}
