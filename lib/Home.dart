import 'package:flutter/material.dart';
import 'package:movies_app/Sqldb.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Sqldb sqldb = Sqldb();
  //-----------------------------------------
  Future<List<Map>> getAllMovies() async {
    List<Map> movies = await sqldb.getData("SELECT * FROM 'movies'");
    return movies;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      appBar: AppBar(title: Text("Home"),),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(flex: 11,
                child: Container(
                  child: FutureBuilder(
                    future: getAllMovies(),
                    builder: (ctx, snp) {
                      if(snp.hasData) {
                        List<Map> listFilms = snp.data!;
                        return ListView.builder(itemCount: listFilms.length,
                            itemBuilder: (ctx, idx) {
                              return Card(
                                child: ListTile(
                                  leading: Icon(Icons.movie, color: Colors.pink, size: 30,),
                                  title: Text("${listFilms[idx]['title']}",
                                    style: TextStyle(fontSize: 25, color: Colors.purple),),
                                  subtitle: Text("${listFilms[idx]['duration']} min",
                                    style: TextStyle(fontSize: 20, color: Colors.black),),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextButton(onPressed: () {}, child: Icon(Icons.edit, color: Colors.green, size: 25,)),
                                      TextButton(onPressed: () {}, child: Icon(Icons.delete, color: Colors.red, size: 25,)),
                                    ],
                                  ),
                                ),
                              );
                            });
                      } else {
                        return Center(child: CircularProgressIndicator(),);
                      }
                    },
                  ),
                )),
            Expanded(flex: 1,
                child: Container(
                )),

          ],
        )
      ),
    );
  }
}
