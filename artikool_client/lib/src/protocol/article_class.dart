/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import
// ignore_for_file: overridden_fields
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: depend_on_referenced_packages

import 'package:serverpod_client/serverpod_client.dart';
import 'dart:typed_data';
import 'protocol.dart';

class Article extends SerializableEntity {
  @override
  String get className => 'Article';

  int? id;
  late String title;
  late String content;
  late DateTime publishedOn;
  late bool isPrime;

  Article({
    this.id,
    required this.title,
    required this.content,
    required this.publishedOn,
    required this.isPrime,
  });

  Article.fromSerialization(Map<String, dynamic> serialization) {
    var _data = unwrapSerializationData(serialization);
    id = _data['id'];
    title = _data['title']!;
    content = _data['content']!;
    publishedOn = DateTime.tryParse(_data['publishedOn'])!;
    isPrime = _data['isPrime']!;
  }

  @override
  Map<String, dynamic> serialize() {
    return wrapSerializationData({
      'id': id,
      'title': title,
      'content': content,
      'publishedOn': publishedOn.toUtc().toIso8601String(),
      'isPrime': isPrime,
    });
  }
}
