import 'package:eventify/src/core/event_data.dart';
import 'package:eventify/src/widgets/drawer_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../utils/image_strings.dart';
import '../utils/styles.dart';
import '../widgets/box.dart';
import '../utils/colors.dart';
import '../utils/text_strings.dart';
import 'package:intl/intl.dart';

Future<void> main() async {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  var currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.lightBlueColor,
        title: Text(
          eventHome,
          style: Styles.textStyles,
        ),
      ),
      body: Container(
          padding: const EdgeInsets.all(30.0),
          child: (
              ListView(
            children: [
              TextField(
                onChanged: (value) {},
                controller: editingController,
                decoration: const InputDecoration(
                    labelText: "Keresés...",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)))),
              ),
              SizedBox(
                height: 584,
                child: ListView(
                  children: EVENTS
                      .map(
                        (eventData) => Box(
                            eventData.id,
                            eventData.title,
                            eventData.city,
                            eventData.date,
                            eventData.eventImage),
                      )
                      .toList(),
                ),
              )
            ],
          ))),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: MyColors.lightBlueColor,
              ),
              child: Text(
                DateFormat("yyyy-MM-dd").format(DateTime.now()),
                style: Styles.eventTitleStyles,
              ),
            ),
            const DrawerList("Események", Icon(Icons.home)),
            const DrawerList("Kedvencek", Icon(Icons.favorite)),
            const DrawerList("Eseményeim", Icon(Icons.event_rounded)),
            const DrawerList("Profil", Icon(Icons.account_circle)),
            const SizedBox(
              height: 350.0,
            ),
            const DrawerList("Kijelentkezés", Icon(Icons.logout)),
          ],
        ),
      ),
    );
  }
}
