/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, file_names, unnecessary_new, prefer_if_null_operators, prefer_const_constructors, slash_for_doc_comments, annotate_overrides, non_constant_identifier_names, unnecessary_string_interpolations, prefer_adjacent_string_concatenation, unnecessary_const, dead_code

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the Message type in your schema. */
@immutable
class Message extends Model {
  static const classType = const _MessageModelType();
  final String id;
  final String? message;
  final String? fromId;
  final String? timestamp;
  final String? movieId;
  final String? fromUsername;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const Message._internal(
      {required this.id,
      this.message,
      this.fromId,
      this.timestamp,
      this.movieId,
      this.fromUsername});

  factory Message(
      {required String id,
      String? message,
      String? fromId,
      String? timestamp,
      String? movieId,
      String? fromUsername}) {
    return Message._internal(
        id: id == null ? UUID.getUUID() : id,
        message: message,
        fromId: fromId,
        timestamp: timestamp,
        movieId: movieId,
        fromUsername: fromUsername);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Message &&
        id == other.id &&
        message == other.message &&
        fromId == other.fromId &&
        timestamp == other.timestamp &&
        movieId == other.movieId &&
        fromUsername == other.fromUsername;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Message {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("message=" + "$message" + ", ");
    buffer.write("fromId=" + "$fromId" + ", ");
    buffer.write("timestamp=" + "$timestamp" + ", ");
    buffer.write("movieId=" + "$movieId" + ", ");
    buffer.write("fromUsername=" + "$fromUsername");
    buffer.write("}");

    return buffer.toString();
  }

  Message copyWith(
      {String? id,
      String? message,
      String? fromId,
      String? timestamp,
      String? movieId,
      String? fromUsername}) {
    return Message(
        id: id ?? this.id,
        message: message ?? this.message,
        fromId: fromId ?? this.fromId,
        timestamp: timestamp ?? this.timestamp,
        movieId: movieId ?? this.movieId,
        fromUsername: fromUsername ?? this.fromUsername);
  }

  Message.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        message = json['message'],
        fromId = json['fromId'],
        timestamp = json['timestamp'],
        movieId = json['movieId'],
        fromUsername = json['fromUsername'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'message': message,
        'fromId': fromId,
        'timestamp': timestamp,
        'movieId': movieId,
        'fromUsername': fromUsername
      };

  static final QueryField ID = QueryField(fieldName: "message.id");
  static final QueryField MESSAGE = QueryField(fieldName: "message");
  static final QueryField FROMID = QueryField(fieldName: "fromId");
  static final QueryField TIMESTAMP = QueryField(fieldName: "timestamp");
  static final QueryField MOVIEID = QueryField(fieldName: "movieId");
  static final QueryField FROMUSERNAME = QueryField(fieldName: "fromUsername");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Message";
    modelSchemaDefinition.pluralName = "Messages";

    modelSchemaDefinition.authRules = [
      AuthRule(authStrategy: AuthStrategy.PUBLIC, operations: [
        ModelOperation.CREATE,
        ModelOperation.UPDATE,
        ModelOperation.DELETE,
        ModelOperation.READ
      ])
    ];

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Message.MESSAGE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Message.FROMID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Message.TIMESTAMP,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Message.MOVIEID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Message.FROMUSERNAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _MessageModelType extends ModelType<Message> {
  const _MessageModelType();

  @override
  Message fromJson(Map<String, dynamic> jsonData) {
    return Message.fromJson(jsonData);
  }
}
