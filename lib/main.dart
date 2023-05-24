// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:quotesapp/quotes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: QuotesApp(),
    );
  }
}

class Quotees {
  String title;
  String auther;
  Quotees({
    required this.title,
    required this.auther,
  });
}

class QuotesApp extends StatefulWidget {
  const QuotesApp({super.key});

  @override
  State<QuotesApp> createState() => _QuotesAppState();
}

class _QuotesAppState extends State<QuotesApp> {
  List quot = [
    Quotees(title: "مساء الغرام على اللي حبه في قلبي نار.", auther: "Hakim"),
    Quotees(title: " مساء الغرام، أنا واحد عايز الانستجرام.", auther: "Hakim"),
    Quotees(title: "البلاستيك اي؟ تو نحولوه", auther: "Hakim"),
    Quotees(title: "لا تنتضر العسل مالفرززو لانها!!.", auther: "Hakim"),
    Quotees(title: "اا  علي هات اكي القادومة", auther: "Hakim"),
  ];

  String tit = "";
  String auth = "";
  final title = TextEditingController();
  final auther = TextEditingController();
  delTask(int id) {
    setState(() {
      quot.remove(quot[id]);
    });
  }

  myfunc() {
    setState(() {
      tit = title.text;
      auth = auther.text;

      quot.add(
        Quotees(title: "$tit ", auther: "$auth"),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                    height: double.infinity,
                    color: Colors.amber[100],
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(33, 0, 33, 0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(color: Colors.brown[100]),
                            child: TextField(
                              // link variable with data
                              controller: title,
                              decoration: InputDecoration(
                                  hintText: 'Quotes',
                                  prefixIcon: Icon(Icons.note),
                                  border: InputBorder.none),
                            ),
                          ),
                          SizedBox(
                            height: 33,
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(33, 0, 33, 0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(color: Colors.brown[100]),
                            child: TextField(
                              // link variable with data
                              controller: auther,
                              decoration: InputDecoration(
                                  hintText: 'Auther',
                                  prefixIcon: Icon(Icons.person),
                                  border: InputBorder.none),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              myfunc();
                              Navigator.pop(context);
                            },
                            child: Text("ADD Notes "),
                          ),
                        ]));
              });
        },
        backgroundColor: Colors.amber[200],
        child: Icon(
          Icons.add,
          color: Colors.blueGrey,
        ),
      ),
      appBar: AppBar(
        title: Text('Awesome Quotes'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 800,
            child: ListView.builder(
                itemCount: quot.length,
                itemBuilder: (BuildContext context, int index) {
                  return Quotes(
                    title: quot[index].title,
                    auther: quot[index].auther,
                    dTask: delTask,
                    i: index,
                  );
                }),
          )
        ],
      ),
    );
  }
}
