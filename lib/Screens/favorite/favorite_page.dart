import 'package:flutter/material.dart';
import 'package:following_the_prophet/Screens/eventViewPage.dart';
import 'package:following_the_prophet/helper/database.dart';
import 'package:following_the_prophet/models/User.dart';
import 'package:following_the_prophet/models/contentModel.dart';

class FavoritePage extends StatefulWidget {
  final UserModel user;

  const FavoritePage({Key key, @required this.user}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  Database _db = Database();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: NavigationMenu(), //to add nav menu here in this page
      appBar: AppBar(
        title: Text('FavoritePage'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * (0.75),
        child: widget.user.favorite[0] == ''
            ? Container(
                child: Center(
                  child: Text("No Favorites"),
                ),
              )
            : /*child:*/ ListView.builder(
                itemCount: widget.user.favorite.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          getDataAndRoute(widget.user.favorite[index]);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * (0.90),
                          decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            leading: Text("${index + 1}"),
                            title: Text(widget.user.favorite[index]),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }

  getDataAndRoute(String event) async {
    var docs = await _db.dataByTitle(event);
    ContentModel data = ContentModel(
      title: docs[0].data()['title'],
      subtitle: docs[0].data()['subtitle'],
      year: docs[0].data()['year'],
      details: docs[0].data()['details'],
      youtubeLink: docs[0].data()['youtubeLink'],
      image: docs[0].data()['images'],
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EventViewScreen(
          data: data,
        ),
      ),
    );
  }
}
