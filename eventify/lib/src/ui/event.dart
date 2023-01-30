import 'package:flutter/material.dart';

import '../widgets/box.dart';
import '../utils/colors.dart';
import '../utils/text_strings.dart';
import 'package:intl/intl.dart';

class EventScreen extends StatelessWidget {
  //final String eventId;
  //final String eventTitle;

  //EventScreen(@required this.eventId, @required this.eventTitle);

  @override
  Widget build(BuildContext context) {
    final routerArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final eventTitle = routerArgs['title'];
    final eventId = routerArgs['id'];

    return Scaffold(
      appBar: AppBar(
        title: Text(eventTitle!),
      ),
    );
  }
}
