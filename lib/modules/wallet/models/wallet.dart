import 'package:equatable/equatable.dart';
import 'package:salon_booking_app/modules/wallet/models/transections.dart';
import 'package:salon_booking_app/modules/wallet/constants/transections.dart';

class Wallet extends Equatable {
  final double money;
  final Map<String, Transection> transections;
  final bool isLoading;
  final String selectedPaymentMethod;

  factory Wallet.initial() {
    return Wallet(
      money: 2705.0,
      transections: transectionMap,
      isLoading: true,
      selectedPaymentMethod: 'credit',
    );
  }

  Wallet({
    this.money,
    this.transections,
    this.isLoading,
    this.selectedPaymentMethod,
  });

  Wallet copyWith({
    bool isLoading,
    double money,
    Map<String, Transection> transections,
    String selectedPaymentMethod,
  }) {
    return Wallet(
      isLoading: isLoading ?? this.isLoading,
      money: money ?? this.money,
      transections: transections ?? this.transections,
      selectedPaymentMethod: selectedPaymentMethod ?? this.selectedPaymentMethod,
    );
  }

  @override
  List<Object> get props => [
        money,
        transections,
        selectedPaymentMethod
      ];
}
