import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirestoreService._();
  static final instance = FirestoreService._();

  final _fireStore = FirebaseFirestore.instance;

  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    try {
      final refrance = _fireStore.doc(path);
      await refrance.set(data);
    } catch (e) {
      log(e.toString());
    }
  }

  // Future<Map<String, dynamic>?> getData(String path) async {
  //   try {
  //     final refrance = _fireStore.doc(path);
  //     final result = await refrance.get();
  //     return result.data() as Map<String, dynamic>;
  //   } catch (e) {
  //     log(e.toString());
  //     rethrow;
  //   }
  // }
  //
  // Future<void> updateData(String path, Map<String, dynamic> data) async {
  //   try {
  //     final refrance = _fireStore.doc(path);
  //     await refrance.update(data);
  //   } catch (e) {
  //     log(e.toString());
  //     rethrow;
  //   }
  // }

  Future<void> deleteData({required String path}) async {
    try {
      final refrance = _fireStore.doc(path);
      await refrance.delete();
    } catch (e) {
      log(e.toString());
    }
  }

  Stream<T> documintStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documintId) builder,
  }) {
    try {
      final refrance = _fireStore.doc(path);
      final snapshots = refrance.snapshots();
      return snapshots.map((snapshot) => builder(snapshot.data(), snapshot.id));
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Stream<List<T>> collectionsStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documintId) builder,
    Query Function(Query query)? queryBuilder,
    int Function(T lhs, T rhs)? sort,
  }) {
    try {
      Query query = _fireStore.collection(path);
      if (queryBuilder != null) {
        query = queryBuilder(query);
      }
      final snapshots = query.snapshots();
      return snapshots.map((snapshot) {
        final result = snapshot.docs
            .map(
              (snapshot) =>
                  builder(snapshot.data() as Map<String, dynamic>, snapshot.id),
            )
            .where((value) => value != null)
            .toList();
        if (sort != null) {
          result.sort(sort);
        }
        return result;
      });
    } catch (e) {
      rethrow;
    }
  }
}
