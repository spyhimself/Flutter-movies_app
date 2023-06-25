import 'package:flutter/material.dart';
import 'package:movies_app/Home.dart';

import 'Sqldb.dart';

class UpdateMovie extends StatefulWidget {
  final id;
  final title;
  final duration;
  const UpdateMovie({super.key, this.id, this.title, this.duration});

  @override
  State<UpdateMovie> createState() => _UpdateMovieState();
}

class _UpdateMovieState extends State<UpdateMovie> {
  TextEditingController _title = TextEditingController();
  TextEditingController _duration = TextEditingController();
  Sqldb sqldb = Sqldb();

  @override
  void initState() {
    // TODO: implement initState
    _title.text = widget.title;
    _duration.text = widget.duration;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Modif"),),
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
              int rep = await sqldb.updateData('''
              UPDATE "movies" SET
              title = "${_title.text}",
              duration = "${int.parse(_duration.text)}"
              WHERE id = "${widget.id}"
              ''');
              if(rep > 0) {
                Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => Home()), (route) => false);
              }
            }, child: Text("Update"))
          ],
        ),
      ),
    );
  }
}
