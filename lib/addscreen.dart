
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:shibu_fire/model.dart';
import 'package:shibu_fire/service.dart';

class AddPage extends StatelessWidget {
  AddPage({super.key});
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextFormField(
              controller: nameCtrl,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            TextFormField(
              controller: emailCtrl,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            ElevatedButton(
                onPressed: () {
                  add();
                },
                child:const Text("submit")),
          ],
        ),
      ),
    );
  }

  add() async {
    String id = randomNumeric(10);
    StModel ssmodel =
        StModel(name: nameCtrl.text, email: emailCtrl.text, id: id);
    await StService().addData(ssmodel);
  }
}