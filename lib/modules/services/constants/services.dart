import 'package:flutter/material.dart';
import 'package:salon_booking_app/modules/dashboard/constants/services.dart';
import 'package:salon_booking_app/modules/services/models/appointment.dart';

final List<Service> services = [
  Service(
    category: haircut,
    from: TimeOfDay(hour: 10, minute: 0),
    to: TimeOfDay(hour: 19, minute: 0),
    image: 'assets/images/hair/drying.jpg',
    location: '45th New Srry Center, NewYork, US',
    rating: 4.5,
    name: 'Rverkine Salon & Styles',
    price: 15.0,
  ),
  Service(
    category: haircut,
    from: TimeOfDay(hour: 10, minute: 0),
    to: TimeOfDay(hour: 19, minute: 0),
    image: 'assets/images/hair/drying.jpg',
    location: '45th New Srry Center, NewYork, US',
    rating: 4.5,
    name: 'Rverkine Salon & Styles',
    price: 22.0,
  ),
  Service(
    category: haircut,
    from: TimeOfDay(hour: 10, minute: 0),
    to: TimeOfDay(hour: 19, minute: 0),
    image: 'assets/images/hair/shaving.jpg',
    location: '45th New Srry Center, NewYork, US',
    rating: 4.5,
    name: 'Rverkine Salon & Styles',
    price: 18.0,
  ),
  Service(
    category: haircut,
    from: TimeOfDay(hour: 10, minute: 0),
    to: TimeOfDay(hour: 19, minute: 0),
    image: 'assets/images/hair/shampoo.jpg',
    location: '45th New Srry Center, NewYork, US',
    rating: 4.5,
    name: 'Rverkine Salon & Styles',
    price: 17.0,
  ),
];

final Map<String, Service> servicesConstant = {
  'SV001': Service(
    category: haircut,
    from: TimeOfDay(hour: 10, minute: 0),
    to: TimeOfDay(hour: 19, minute: 0),
    image: 'assets/images/hair/drying.jpg',
    location: '45th New Srry Center, NewYork, US',
    rating: 4.5,
    name: 'Rverkine Salon & Styles',
    price: 15.0,
    id: 'SV001',
  ),
  'SV002': Service(
    category: haircut,
    from: TimeOfDay(hour: 10, minute: 0),
    to: TimeOfDay(hour: 19, minute: 0),
    image: 'assets/images/hair/drying.jpg',
    location: '45th New Srry Center, NewYork, US',
    rating: 4.5,
    name: 'Rverkine Salon & Styles',
    price: 22.0,
    id: 'SV002',
  ),
  'SV003': Service(
    category: haircut,
    from: TimeOfDay(hour: 10, minute: 0),
    to: TimeOfDay(hour: 19, minute: 0),
    image: 'assets/images/hair/shaving.jpg',
    location: '45th New Srry Center, NewYork, US',
    rating: 4.5,
    name: 'Rverkine Salon & Styles',
    price: 18.0,
    id: 'SV003',
  ),
  'SV004': Service(
    category: haircut,
    from: TimeOfDay(hour: 10, minute: 0),
    to: TimeOfDay(hour: 19, minute: 0),
    image: 'assets/images/hair/shampoo.jpg',
    location: '45th New Srry Center, NewYork, US',
    rating: 4.5,
    name: 'Rverkine Salon & Styles',
    price: 17.0,
    id: 'SV004',
  ),
  'SV005': Service(
    category: haircut,
    from: TimeOfDay(hour: 10, minute: 0),
    to: TimeOfDay(hour: 19, minute: 0),
    image: 'assets/images/hair/drying.jpg',
    location: '45th New Srry Center, NewYork, US',
    rating: 4.5,
    name: 'Rverkine Salon & Styles',
    price: 15.0,
    id: 'SV005',
  ),
  'SV006': Service(
    category: haircut,
    from: TimeOfDay(hour: 10, minute: 0),
    to: TimeOfDay(hour: 19, minute: 0),
    image: 'assets/images/hair/drying.jpg',
    location: '45th New Srry Center, NewYork, US',
    rating: 4.5,
    name: 'Rverkine Salon & Styles',
    price: 22.0,
    id: 'SV006',
  ),
  'SV007': Service(
    category: haircut,
    from: TimeOfDay(hour: 10, minute: 0),
    to: TimeOfDay(hour: 19, minute: 0),
    image: 'assets/images/hair/shaving.jpg',
    location: '45th New Srry Center, NewYork, US',
    rating: 4.5,
    name: 'Rverkine Salon & Styles',
    price: 18.0,
    id: 'SV007',
  ),
  'SV008': Service(
    category: haircut,
    from: TimeOfDay(hour: 10, minute: 0),
    to: TimeOfDay(hour: 19, minute: 0),
    image: 'assets/images/hair/shampoo.jpg',
    location: '45th New Srry Center, NewYork, US',
    rating: 4.5,
    name: 'Rverkine Salon & Styles',
    price: 17.0,
    id: 'SV008',
  ),
};
