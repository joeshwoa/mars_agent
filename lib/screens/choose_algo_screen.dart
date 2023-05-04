import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mars_exploration_game/screens/put_gold_screen.dart';
import 'package:mars_exploration_game/screens/start_game.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../functions/copy_list_function.dart';
import '../shared/shared.dart';

class ChooseAlgoScreen extends StatefulWidget {
  const ChooseAlgoScreen({Key? key}) : super(key: key);

  @override
  State<ChooseAlgoScreen> createState() => _ChooseAlgoScreenState();
}

class _ChooseAlgoScreenState extends State<ChooseAlgoScreen> {

  bool waiting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: waiting?
      SizedBox(
        width: 100.w,
        height: 100.h,
        child: Stack(
          children: [
            Container(
              width: 100.w,
              height: 100.h,
              child: Stack(
                children: [
                  SizedBox(
                    child: Image(image: AssetImage("assets/cda924c352.jpeg.jpg"),fit: BoxFit.fill),
                    width: 100.w,
                    height: 100.h,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10.h,
                        width: 100.w,
                        child: Row(
                          children: [
                            Container(
                              child: MaterialButton(
                                onPressed: (){
                                  setState(() {
                                    intTable= copy(modifiedTable);

                                    path=[];
                                  });
                                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => PutGoldScreen()));
                                },
                                child: Text('Back',style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xffffffff))),
                              ),
                              height: 5.h,
                              width: 10.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.px),
                                  color: Color(0xff224364).withOpacity(0.3),
                                  border: Border.all(color: Color(0xffffffff),width: 2.px)
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 100.w,
                        height: 90.h,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: MaterialButton(
                                onPressed: ()async {
                                  bool result;
                                  if(kIsWeb)
                                    {
                                      result=true;
                                    }else{
                                    result = await InternetConnectionChecker().hasConnection;
                                  }

                                  if(result == true) {

                                    setState(() {
                                      waiting=true;
                                    });
                                    final url = 'http://joeshwoa.pythonanywhere.com/astar/';
                                    final headers = {'Content-Type': 'application/json'};
                                    final data = {
                                      'golds': golds,
                                      'rocks': rocks,
                                    };
                                    final response = await http.post(Uri.parse(url),
                                        headers: headers, body: jsonEncode(data));
                                    setState(() {
                                      waiting=false;
                                    });
                                    if (response.statusCode == 200) {
                                      final result = jsonDecode(response.body);
                                      print(result);
                                      path=result['path'];
                                      Navigator.push(context,MaterialPageRoute(builder: (context) => StartGame()));
                                    } else {
                                      print('Failed to send data. Error: ${response.statusCode}');

                                    }
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('No internet :( Reason:'),
                                          content: Text('Please check your internet connection.'),
                                          actions: [
                                            TextButton(
                                              child: Text('OK'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                },
                                child: Text('A* Algorithm',style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xffffffff))),
                              ),
                              height: 10.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.px),
                                  color: Color(0xff224364).withOpacity(0.3),
                                  border: Border.all(color: Color(0xffffffff),width: 2.px)
                              ),
                            ),
                            Container(
                              child: MaterialButton(
                                onPressed: ()async {
                                  bool result;
                                  if(kIsWeb)
                                    {
                                      result=true;
                                    }else{
                                    result = await InternetConnectionChecker().hasConnection;
                                  }

                                  if(result == true) {

                                    setState(() {
                                      waiting=true;
                                    });
                                    final url = 'http://joeshwoa.pythonanywhere.com/bfs/';
                                    final headers = {'Content-Type': 'application/json'};
                                    final data = {
                                      'golds': golds,
                                      'rocks': rocks,
                                    };
                                    final response = await http.post(Uri.parse(url),
                                        headers: headers, body: jsonEncode(data));
                                    setState(() {
                                      waiting=false;
                                    });
                                    if (response.statusCode == 200) {
                                      final result = jsonDecode(response.body);
                                      print(result);
                                      path=result['path'];
                                      Navigator.push(context,MaterialPageRoute(builder: (context) => StartGame()));
                                    } else {
                                      print('Failed to send data. Error: ${response.statusCode}');

                                    }
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('No internet :( Reason:'),
                                          content: Text('Please check your internet connection.'),
                                          actions: [
                                            TextButton(
                                              child: Text('OK'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                },
                                child: Text('BFS Algorithm',style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xffffffff))),
                              ),
                              height: 10.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.px),
                                  color: Color(0xff224364).withOpacity(0.3),
                                  border: Border.all(color: Color(0xffffffff),width: 2.px)
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100.h,
              width: 100.w,
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(width: 100.w,height: 100.h,child: CircularProgressIndicator(strokeWidth: 0.px,color: Colors.transparent)),
                    SizedBox(width: 50.h,height: 50.h,child: CircularProgressIndicator(strokeWidth: 5.px,color: Colors.white)),
                    SizedBox(width: 40.h,height: 40.h,child: CircularProgressIndicator(strokeWidth: 4.px,color: Colors.amber)),
                    SizedBox(width: 30.h,height: 30.h,child: CircularProgressIndicator(strokeWidth: 3.px,color: Colors.orangeAccent)),
                    SizedBox(width: 20.h,height: 20.h,child: CircularProgressIndicator(strokeWidth: 2.px,color: Colors.orange)),
                    SizedBox(width: 10.h,height: 10.h,child: CircularProgressIndicator(strokeWidth: 1.px,color: Colors.deepOrange)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ):
      Container(
        width: 100.w,
        height: 100.h,
        child: Stack(
          children: [
            SizedBox(
              child: Image(image: AssetImage("assets/cda924c352.jpeg.jpg"),fit: BoxFit.fill),
              width: 100.w,
              height: 100.h,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10.h,
                  width: 100.w,
                  child: Row(
                    children: [
                      Container(
                        child: MaterialButton(
                          onPressed: (){
                            setState(() {
                              intTable= copy(modifiedTable);

                              path=[];
                            });
                            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => PutGoldScreen()));
                          },
                          child: Text('Back',style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xffffffff))),
                        ),
                        height: 5.h,
                        width: 10.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.px),
                            color: Color(0xff224364).withOpacity(0.3),
                            border: Border.all(color: Color(0xffffffff),width: 2.px)
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 100.w,
                  height: 90.h,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: MaterialButton(
                          onPressed: ()async {
                            bool result;
                                  if(kIsWeb)
                                    {
                                      result=true;
                                    }else{
                                    result = await InternetConnectionChecker().hasConnection;
                                  }

                            if(result == true) {

                              setState(() {
                                waiting=true;
                              });
                              final url = 'http://joeshwoa.pythonanywhere.com/astar/';
                              final headers = {'Content-Type': 'application/json'};
                              final data = {
                                'golds': golds,
                                'rocks': rocks,
                              };
                              final response = await http.post(Uri.parse(url),
                                  headers: headers, body: jsonEncode(data));
                              setState(() {
                                waiting=false;
                              });
                              if (response.statusCode == 200) {
                                final result = jsonDecode(response.body);
                                print(result);
                                path=result['path'];
                                Navigator.push(context,MaterialPageRoute(builder: (context) => StartGame()));
                              } else {
                                print('Failed to send data. Error: ${response.statusCode}');

                              }
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('No internet :( Reason:'),
                                    content: Text('Please check your internet connection.'),
                                    actions: [
                                      TextButton(
                                        child: Text('OK'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          child: Text('A* Algorithm',style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xffffffff))),
                        ),
                        height: 10.h,
                        width: 20.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.px),
                            color: Color(0xff224364).withOpacity(0.3),
                            border: Border.all(color: Color(0xffffffff),width: 2.px)
                        ),
                      ),
                      Container(
                        child: MaterialButton(
                          onPressed: ()async {
                            bool result;
                                  if(kIsWeb)
                                    {
                                      result=true;
                                    }else{
                                    result = await InternetConnectionChecker().hasConnection;
                                  }

                            if(result == true) {

                              setState(() {
                                waiting=true;
                              });
                              final url = 'http://joeshwoa.pythonanywhere.com/bfs/';
                              final headers = {'Content-Type': 'application/json'};
                              final data = {
                                'golds': golds,
                                'rocks': rocks,
                              };
                              final response = await http.post(Uri.parse(url),
                                  headers: headers, body: jsonEncode(data));
                              setState(() {
                                waiting=false;
                              });
                              if (response.statusCode == 200) {
                                final result = jsonDecode(response.body);
                                print(result);
                                path=result['path'];
                                Navigator.push(context,MaterialPageRoute(builder: (context) => StartGame()));
                              } else {
                                print('Failed to send data. Error: ${response.statusCode}');

                              }
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('No internet :( Reason:'),
                                    content: Text('Please check your internet connection.'),
                                    actions: [
                                      TextButton(
                                        child: Text('OK'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          child: Text('BFS Algorithm',style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xffffffff))),
                        ),
                        height: 10.h,
                        width: 20.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.px),
                            color: Color(0xff224364).withOpacity(0.3),
                            border: Border.all(color: Color(0xffffffff),width: 2.px)
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
