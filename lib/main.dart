import 'package:fetch_json_data/repository.dart';
import 'package:fetch_json_data/starwars.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Star Wars People')),
        body: PeopleList(),
      ),
    );
  }
}

class PeopleList extends StatelessWidget {
  Repository repository = Repository();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Starwars>>(
      future: repository.fetchPeople(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final people = snapshot.data!;
          return ListView.builder(
            itemCount: people.length,
            itemBuilder: (context, index) {
              final person = people[index];
              return ListTile(
                title: Text(person.name),
                subtitle: Text('Height: ${person.height}'),
              );
            },
          );
        } else {
          return Text('No data');
        }
      },
    );
  }
}
