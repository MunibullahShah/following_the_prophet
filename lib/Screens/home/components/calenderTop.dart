import 'package:flutter/material.dart';

import 'package:following_the_prophet/Screens/home/components/calenderButton.dart';
import 'package:following_the_prophet/Screens/home/components/yearScreen.dart';

class CalenderTop extends StatefulWidget {
  @override
  _CalenderTopState createState() => _CalenderTopState();
}

class _CalenderTopState extends State<CalenderTop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Color(0xFF606060),
      margin: EdgeInsets.fromLTRB(25, 10, 25, 15),
      //padding: EdgeInsets.only(left: ),
      height: MediaQuery.of(context).size.height * (0.5),
      width: MediaQuery.of(context).size.width * (0.90),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CalenderTopColor(
                text: 'Prophethood',
                color: Color(0xFFD9D9D9),
              ),
              CalenderTopColor(
                text: 'Hijri',
                color: Color(0xFFCDE300),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CalenderTopColor(
                text: 'Age',
                color: Color(0xFF9BBB94),
              ),
              CalenderTopColor(
                text: 'Julian',
                color: Color(0xFFFD9727),
              )
            ],
          ),
          // SizedBox(height: 10.0),
          Container(
            height: MediaQuery.of(context).size.height * (0.40),
            alignment: Alignment.center,
            child: GridView.count(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              crossAxisCount: 3,
              children: List.generate(63, (index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return YearPage(
                            age: index + 1,
                          );
                        },
                      ),
                    );
                  },
                  child: YearWise(
                    prophetHood: '${index - 40}',
                    age: '${index + 1}',
                    hijri: '${index + 52}',
                    juilan: '${index + 570}',
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class CalenderTopColor extends StatelessWidget {
  const CalenderTopColor({
    this.color,
    this.text,
  });
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white60,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 5),
            color: color,
            height: 15,
            width: 50,
          )
        ],
      ),
    );
  }
}
