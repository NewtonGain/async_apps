import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main()=>runApp(MyApp());
class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var stringResponse;
  Map? mapResponse;
  Future getData()async{
    http.Response response;
    response=await http.get(
      Uri.parse("https://reqres.in/api/users/2"),
    );
    if(response.statusCode==200){
      setState(() {
        mapResponse=jsonDecode(response.body);
      });
    }
  }
  
  @override
  void initState() {
    
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: Center(
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.blueGrey,
        ),
        child: mapResponse==null? Text('The data is loading'):
        Center(
          child: Text("${mapResponse?["data"].toString()}",
          textAlign: TextAlign.center,),
        )
        ),
        ),
        ),
        );
  }
}