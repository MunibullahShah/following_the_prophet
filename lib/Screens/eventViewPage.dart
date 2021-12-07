import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:following_the_prophet/helper/database.dart';
import 'package:following_the_prophet/models/contentModel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class EventViewScreen extends StatefulWidget {
  final ContentModel data;
  const EventViewScreen({Key key, this.data}) : super(key: key);

  @override
  _EventViewScreenState createState() => _EventViewScreenState();
}

class _EventViewScreenState extends State<EventViewScreen> {
  Database db = Database();

  var favButtonColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text(widget.data.title)),
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Details:",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * (0.70),
                child: ListView(
                  children: [Text(widget.data.details)],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _openYoutube();
                    },
                    child: Icon(
                      FontAwesomeIcons.youtube,
                      size: 40,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _favMethod();
                    },
                    icon: Icon(
                      Icons.favorite,
                      size: 30.0,
                      color: favButtonColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openYoutube() async {
    var url = "${widget.data.youtubeLink}";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Fluttertoast.showToast(msg: "Could not launch $url");
      throw 'Could not launch $url';
    }
  }

  _favMethod() async {}
}
