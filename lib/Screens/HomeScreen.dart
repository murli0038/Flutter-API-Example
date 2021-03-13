import 'package:apiflutter/Debouncer/Debouncer.dart';
import 'package:apiflutter/Models/Users.dart';
import 'package:apiflutter/Services/Services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Users users;
  String title = "Loading..";
  final debouncer = Debouncer(milisecs: 1000);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    users = Users();
    Services.getUsers().then((usersFromURL){
      setState(() {
        users = usersFromURL;
        title = "List of Users";
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            searchTF(),
            SizedBox(height: 5,),
            listOfUser()
          ],
        ),
      ),
    );
  }

  Widget listOfUser(){
    return Expanded(
        child: ListView.builder(
          itemCount: users.users == null ? 0 : users.users.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(users.users[index].name.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),),
                    SizedBox(height: 5,),
                    Text(users.users[index].email.toLowerCase(),style: TextStyle(color: Colors.grey,fontSize: 14),),
                  ],
                ),
              ),
            );
          },
      )
    );
  }

  Widget searchTF() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(5.0,),
            ),
          ),
          filled: true,
          fillColor: Colors.white60,
          contentPadding: EdgeInsets.all(15.0),
          hintText: 'Filter by name or email',
        ),
        onChanged: (value){
          //value
          if(value == ""){
            Services.getUsers().then((usersFromURL){
              setState(() {
                users = usersFromURL;
                title = "List of Users";
              });
            });
          }
          else{
            debouncer.run(() {
              setState(() {
                title = "Searching..";
              });
              Services.getUsers().then((usersFromURL){
                setState(() {
                  users = Users.filterList(usersFromURL, value);
                  title = "Filter List of Users";
                });
              });
            });
          }
        },
      ),
    );
  }
}