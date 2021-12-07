import 'package:flutter/material.dart';
import 'package:following_the_prophet/Screens/eventViewPage.dart';
import 'package:following_the_prophet/helper/database.dart';
import 'package:following_the_prophet/models/contentModel.dart';

class Hijrath extends StatefulWidget {
  @override
  _HijrathState createState() => _HijrathState();
}

class _HijrathState extends State<Hijrath> {
  List<ContentModel> yearData = [];
  Database _database = Database();

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Hijrat'),
          backgroundColor: Colors.green,
        ),
        body: yearData.length == 0
            ? Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Column(
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * (0.75),
                    child: yearData == null
                        ? Container(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : /*child:*/ ListView.builder(
                            itemCount: yearData.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => EventViewScreen(
                                            data: yearData[index],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          (0.90),
                                      decoration: BoxDecoration(
                                          color: Colors.brown,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: ListTile(
                                        leading: Text("${index + 1}"),
                                        title: Text(yearData[index].title),
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
                ],
              ),
      ),
    );
  }

  _getData() async {
    var firebaseDocs = await _database.dataBySubtitle("Hijrat");
    firebaseDocs.forEach((element) {
      try {
        yearData.add(new ContentModel(
          title: element.data()['title'],
          subtitle: element.data()['subtitle'],
          year: element.data()['year'],
          details: element.data()['details'],
          youtubeLink: element.data()['youtubeLink'],
          image: element.data()['images'],
        ));
      } catch (e) {
        print(e);
      }
    });
    setState(() {});
  }
}
