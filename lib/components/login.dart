

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_apptest/Entities/Client.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../main.dart';
 
class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final _formKey = GlobalKey<FormState>();
  Client client;
  String url = "http://172.20.10.4:8010/client/login";
  Future save() async{
    print(client.email);
    print(client.password);
    var res = await http.post(url, headers: {"Content-Type":"application/json", "accept" : "application/json",}, body: json.encode(
      {
        "email":client.email,
        "password":client.password
      }
    ));
    Client newclient = Client.fromJson(jsonDecode(res.body));
    print(newclient.email);
    if(newclient.email == client.email && newclient.password==client.password){
      Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> new MyApp()));}
    else{ Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> new login()));};
    print(res.body);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SingleChildScrollView(
       child: Column(
         children: [
           Form(child: Container(
             height: 500,
             width: MediaQuery.of(context).size.width,
             decoration: BoxDecoration(
               color: Colors.deepPurpleAccent,
               borderRadius: BorderRadius.only(
                 bottomLeft: Radius.circular(20),
                 bottomRight: Radius.circular(20),
               )
             ),
             child: Padding(
               padding: const EdgeInsets.all(16.0),
               child: Column(
                 children: [
                   Column(
                     children: [
                       SizedBox(
                         height: 100,
                       ),
                       Text("Login", style: GoogleFonts.pacifico(
                         fontWeight: FontWeight.bold,
                         fontSize: 50,
                         color: Colors.white,
                       )),
                       SizedBox(
                         height: 50,
                       ),
                       // Align(
                       //   alignment: Alignment.topLeft,
                       //   child: Text("Email:", style: GoogleFonts.roboto(
                       //     fontWeight: FontWeight.normal,
                       //     fontSize: 30,
                       //     color: Colors.white,
                       //   )),
                       // ),
                       SizedBox(
                         height: 10,
                       ),
                       TextFormField(
                         controller: TextEditingController(text: client.email),
                         onChanged: (val){
                           client.email = val;
                          },
                         validator:(value){
                           if (value.isEmpty){
                             return 'Please insert your email';
                           }return null;
                         },
                         style: TextStyle(fontSize: 20, color: Colors.white),
                         decoration: InputDecoration(
                           errorStyle: TextStyle(fontSize: 20, color:Colors.red),
                             hintText: 'Email@example.com',
                             contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                             border: OutlineInputBorder(
                             borderRadius: BorderRadius.all(Radius.circular(8)),
                           )
                         ),
                       ),
                       SizedBox(
                         height: 10,
                       ),
                       TextFormField(
                         controller: TextEditingController(text: client.password),
                         onChanged: (val){
                           client.password = val;
                         },
                         validator:(value){
                           if (value.isEmpty){
                             return 'Please insert your password';
                           }return null;
                         },
                         style: TextStyle(fontSize: 20, color: Colors.white),
                         decoration: InputDecoration(
                             hintText: 'Password',
                             contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                             border: OutlineInputBorder(
                               borderRadius: BorderRadius.all(Radius.circular(8)),
                             )
                         ),
                       ),

                     ],
                   ),
                 ],
               ),
             ),
           )),
           Container(
               height:70,
               width: 70,
               child: TextButton(onPressed: (){
                 // if (_formKey.currentState.validate()) {
                   save();
                 // }
               },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.deepPurple), shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)
                       ),),),
                   child: Text("Login", style: TextStyle(
                     fontSize: 10,
                     fontWeight: FontWeight.bold,
                     color: Colors.white,
                   ),))
           )
         ],
       )
     ),
    );
  }
}
