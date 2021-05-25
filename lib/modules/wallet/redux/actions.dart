import 'package:salon_booking_app/modules/wallet/models/transections.dart';

class AddATransection {
  final Transection transection;

  AddATransection(this.transection);
}

class RemoveATransection {
  final String transectionID;

  RemoveATransection(this.transectionID);
}

class SetIsLoading {
  final bool isLoading;

  SetIsLoading(this.isLoading);
}

class SetSelectedPaymentMethod {
  final String selectedPaymentMethod;
  
  SetSelectedPaymentMethod(this.selectedPaymentMethod);
}
