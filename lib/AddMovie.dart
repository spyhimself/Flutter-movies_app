import 'package:flutter/material.dart';
import 'package:movies_app/Sqldb.dart';
import 'package:movies_app/Home.dart';

class AddMovie extends StatefulWidget {
  const AddMovie({super.key});

  @override
  State<AddMovie> createState() => _AddMovieState();
}

class _AddMovieState extends State<AddMovie> {
  TextEditingController _title = TextEditingController();
  TextEditingController _duration = TextEditingController();
  Sqldb sqldb = Sqldb();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ajout"),),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 20,),
            TextField(
              controller: _title,
              style: TextStyle(fontSize: 20, color: Colors.black),
              decoration: InputDecoration(
                labelText: "Titre",
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40)))
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: _duration,
              style: TextStyle(fontSize: 20, color: Colors.black),
              decoration: InputDecoration(
                  labelText: "Durée",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40)))
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () async {
              int rep = await sqldb
                  .insertData("INSERT INTO 'movies' (title, duration) VALUES ('${_title.text}', '${int.parse(_duration.text)}')");
              if(rep > 0) {
                Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => Home()), (route) => false);
              }
            },
                child: Container(child: Icon(Icons.add, size: 30,), width: double.infinity,))
          ],
        ),
      ),
    );
  }
}
