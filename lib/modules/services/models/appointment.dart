import 'package:flutter/material.dart';
import 'package:salon_booking_app/modules/dashboard/models/categories.dart';

class Service {
  final String id;
  final String name;
  final TimeOfDay from;
  final TimeOfDay to;
  final Category category;
  final String image;
  final double rating;
  final double price;
  final String location;

  Service({
    this.id,
    this.name,
    this.from,
    this.to,
    this.category,
    this.image,
    this.rating,
    this.price,
    this.location,
  });
}
