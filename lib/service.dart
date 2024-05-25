import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shibu_fire/model.dart';

class StService {
  CollectionReference fireStore =
      FirebaseFirestore.instance.collection("datas");

  Future<StModel> addData(StModel model) async {
    await fireStore.add(model.toJson());
    return model;
  }

  Stream<List<StModel>> getdata() {
    return fireStore.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => StModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList());
  }
}
