import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main()=>runApp(const MyApp());
class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _jsonPost=[];
  Future fetchData() async{
    try{
      final response =await http.get(Uri.parse("http://jsonplaceholder.typicode.com/posts"),);
      final jsonData= jsonDecode(response.body)as List;
      setState(() {
        _jsonPost=jsonData;
      });
    }
    catch(err){
      // ignore: avoid_print
      print("This is the $err error");
    }
  }
  @override
  void initState() {

    super.initState();
    fetchData();
  }

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("API"),
        centerTitle: true,
        ),
        backgroundColor: Colors.teal,
      body: ListView.builder(
        itemCount: _jsonPost.length,
        itemBuilder: (context,index){
      final post=_jsonPost[index];
      return Center(child: Text("Title: ${post["title"]}\n body:${post["body"]}\n\n"));
    },),
    ),
    );
  }
} 