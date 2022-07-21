import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:resep_masakan/app/data/data/resep.dart';

class HomeController extends GetxController {
  CollectionReference ref = FirebaseFirestore.instance.collection('resep');

  Stream<List<Resep>> readResep() => FirebaseFirestore.instance
      .collection('resep')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Resep.fromJson(doc.data())).toList());
  @override
  void onInit() async {
    super.onInit();
    FlutterNativeSplash.remove();
  }
}
