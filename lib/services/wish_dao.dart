import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:snap_app/models/wish.dart';

class WishDao {
  final _databaseRef = FirebaseDatabase.instance.ref("Wishes");

  void  saveWish(Wish wish){
    _databaseRef.push().set(wish.toJson());
  }

  Query getWishQuery(){
    if (!kIsWeb) {
      FirebaseDatabase.instance.setPersistenceEnabled(true);
    }
    return _databaseRef;
  }

  void deleteWish(String key){
    _databaseRef.child(key).remove();
  }

  void updateWish(String key, Wish wish){
    _databaseRef.child(key).update(wish.toMap());
  }
}