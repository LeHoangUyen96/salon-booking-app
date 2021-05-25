class Transection {
  final String transectionID;
  final double cost;
  final String name;
  final String serviceImage;
  final String serviceName;
  final DateTime dateTime;
  final String selectedPaymentMethod;

  Transection({
    this.transectionID,
    this.cost,
    this.name,
    this.serviceImage,
    this.serviceName,
    this.dateTime,
    this.selectedPaymentMethod,
  });
}
