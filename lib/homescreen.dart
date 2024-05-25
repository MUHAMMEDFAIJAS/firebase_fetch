import 'package:flutter/material.dart';
import 'package:shibu_fire/addscreen.dart';
import 'package:shibu_fire/model.dart';
import 'package:shibu_fire/service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddPage(),
        ));
      }),
      body: StreamBuilder(
        stream: StService().getdata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('error${snapshot.hasError}'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                StModel data = snapshot.data![index];

                return ListTile(
                  title: Text(data.name!),
                  subtitle: Text(data.email!),
                );
              },
            );
          }
        },
      ),
    );
  }
}
