import 'package:axiom_admin/model/property_model.dart';

abstract class SelllistblocEvent {}

class SellFetchProperties extends SelllistblocEvent {}

class SellApproveProperty extends SelllistblocEvent {
  final Property property;
  SellApproveProperty(this.property);
}

class SellRejectProperty extends SelllistblocEvent {
  final Property property;
  SellRejectProperty(this.property);
}
class SellPropertyDelete extends SelllistblocEvent{
  final Property property;
  SellPropertyDelete(this.property);
}