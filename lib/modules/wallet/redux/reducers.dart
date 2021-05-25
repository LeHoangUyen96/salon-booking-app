import 'package:salon_booking_app/modules/wallet/models/transections.dart';
import 'package:salon_booking_app/modules/wallet/models/wallet.dart';
import 'package:redux/redux.dart';
import 'package:salon_booking_app/modules/wallet/redux/actions.dart';

final Reducer<Wallet> walletReducer =
    combineReducers(<Wallet Function(Wallet, dynamic)>[
  TypedReducer<Wallet, SetIsLoading>(setIsLoading),
  TypedReducer<Wallet, AddATransection>(addATransection),
  TypedReducer<Wallet, SetSelectedPaymentMethod>(setSelectedPaymentMethod),
]);

Wallet setIsLoading(Wallet state, SetIsLoading action) {
  return state.copyWith(
    isLoading: action.isLoading,
  );
}


Wallet setSelectedPaymentMethod(Wallet state, SetSelectedPaymentMethod action) {
  return state.copyWith(
    selectedPaymentMethod: action.selectedPaymentMethod,
  );
}

Wallet addATransection(Wallet state, AddATransection action) {
  final bool isPayOnCredit = (action.transection.selectedPaymentMethod == 'credit');
  final double newMoney =
      isPayOnCredit ? (state.money - action.transection.cost) : state.money;
  final Map<String, Transection> newTransections = {...state.transections};
  newTransections[action.transection.transectionID] = action.transection;
  return state.copyWith(
    money: newMoney,
    transections: newTransections,
  );
}
