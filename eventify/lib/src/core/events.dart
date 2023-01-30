import 'package:flutter/material.dart';

/*class Events {
  final String id;
  final List<String> categories;
  final String title;
  final String eventImage;
  final String city;
  final int participants;
  final String description;
  final DateTime date;

  Events({
    required this.id,
    required this.categories,
    required this.title,
    required this.eventImage,
    required this.city,
    required this.participants,
    required this.description,
    required this.date
  });*/

class Events {
  final String id;

  final String title;
  final String eventImage;
  final String city;
  final String date;

  const Events({
    required this.id,

    required this.title,
    required this.eventImage,
    required this.city,
    required this.date
  });
}
