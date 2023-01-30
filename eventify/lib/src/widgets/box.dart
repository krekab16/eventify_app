import 'package:flutter/material.dart';
import 'package:eventify/src/ui/event.dart';

import '../utils/styles.dart';

class Box extends StatelessWidget {
  final String id;

  //final List<String> events;
  final String title;
  final String date;
  final String city;
  final String eventImage;

  const Box(@required this.id, @required this.title, @required this.date,
      @required this.city, @required this.eventImage);

  void selectEvent(BuildContext ctx) {
    Navigator.pushNamed(ctx, '/evens-box', arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectEvent(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 4,
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                  child: Image.asset(
                    eventImage,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
