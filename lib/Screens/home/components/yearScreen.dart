import 'package:flutter/material.dart';
import 'package:following_the_prophet/Screens/eventViewPage.dart';
import 'package:following_the_prophet/helper/database.dart';
import 'package:following_the_prophet/models/contentModel.dart';

class YearPage extends StatefulWidget {
  final int age;

  const YearPage({Key key, this.age}) : super(key: key);

  @override
  State<YearPage> createState() => _YearPageState();
}

class _YearPageState extends State<YearPage> {
  List<ContentModel> yearData = [];
  Database _database = Database();

  @override
  void initState() {
    _getData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Year History',
            style: TextStyle(fontSize: 20, color: Color(0xFFFD9727)),
          ),
        ),
      ),
      body: yearData.length == 0
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 28,
                      width: 160,
                      child: Center(
                        child: Text("ProphetHood: ${widget.age - 41}"),
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFD9D9D9),
                      ),
                    ),
                    Container(
                      height: 28,
                      width: 160,
                      child: Center(
                        child: Text("age: ${widget.age}"),
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF9BBB94),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 28,
                      width: 160,
                      child: Center(
                        child: Text("Hijri: ${widget.age - 51}"),
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFCDE300),
                      ),
                    ),
                    Container(
                      height: 28,
                      width: 160,
                      child: Center(
                        child: Text("Julian: ${widget.age - 569}"),
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFFD9727),
                      ),
                    ),
                  ],
                ),
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
    );
  }

  _getData() async {
    var firebaseDocs = await _database.dataByYear(widget.age);
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
