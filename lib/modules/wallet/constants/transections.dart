import 'package:salon_booking_app/modules/wallet/models/transections.dart';

final Map<String, Transection> transectionMap = {
  'TR001': Transection(
    transectionID: 'TR001',
    cost: 15.0,
    dateTime: DateTime(2020, 11, 15),
    name: 'Kervin Salon & Styles',
    serviceImage: 'assets/images/hair/cutting.jpg',
    serviceName: 'Cutting',
  ),
  'TR002': Transection(
    transectionID: 'TR002',
    cost: 18.0,
    dateTime: DateTime(2020, 12, 9),
    name: 'Kervin Salon & Styles',
    serviceImage: 'assets/images/hair/cutting.jpg',
    serviceName: 'Cutting',
  ),
  'TR003': Transection(
    transectionID: 'TR003',
    cost: 19.0,
    dateTime: DateTime(2021, 1, 1),
    name: 'Kervin Salon & Styles',
    serviceImage: 'assets/images/hair/dyeing.jpg',
    serviceName: 'Dyeing',
  ),
  'TR004': Transection(
    transectionID: 'TR004',
    cost: 36.0,
    dateTime: DateTime(2021, 1, 15),
    name: 'Kervin Salon & Styles',
    serviceImage: 'assets/images/hair/cutting.jpg',
    serviceName: 'Haircut & Beards',
  ),
};
