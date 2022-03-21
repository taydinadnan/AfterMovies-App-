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

/** This is an auto generated class representing the Movie type in your schema. */
@immutable
class Movie extends Model {
  static const classType = const _MovieModelType();
  final String id;
  final String? image;
  final String? overview;
  final String? rating;
  final String? latestMessage;
  final String? latestMessageTime;
  final String? title;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const Movie._internal(
      {required this.id,
      this.image,
      this.overview,
      this.rating,
      this.latestMessage,
      this.latestMessageTime,
      this.title});

  factory Movie(
      {String? id,
      String? image,
      String? overview,
      String? rating,
      String? latestMessage,
      String? latestMessageTime,
      String? title}) {
    return Movie._internal(
      id: id == null ? UUID.getUUID() : id,
      image: image!,
      overview: overview!,
      rating: rating!,
      latestMessage: latestMessage!,
      latestMessageTime: latestMessageTime!,
      title: title!,
    );
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Movie &&
        id == other.id &&
        image == other.image &&
        overview == other.overview &&
        rating == other.rating &&
        latestMessage == other.latestMessage &&
        latestMessageTime == other.latestMessageTime &&
        title == other.title;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Movie {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("image=" + "$image" + ", ");
    buffer.write("overview=" + "$overview" + ", ");
    buffer.write("rating=" + "$rating" + ", ");
    buffer.write("latestMessage=" + "$latestMessage" + ", ");
    buffer.write("latestMessageTime=" + "$latestMessageTime" + ", ");
    buffer.write("title=" + "$title");
    buffer.write("}");

    return buffer.toString();
  }

  Movie copyWith(
      {String? id,
      String? image,
      String? overview,
      String? rating,
      String? latestMessage,
      String? latestMessageTime,
      String? title}) {
    return Movie(
        id: id ?? this.id,
        image: image ?? this.image,
        overview: overview ?? this.overview,
        rating: rating ?? this.rating,
        latestMessage: latestMessage ?? this.latestMessage,
        latestMessageTime: latestMessageTime ?? this.latestMessageTime,
        title: title ?? this.title);
  }

  Movie.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        image = json['image'],
        overview = json['overview'],
        rating = json['rating'],
        latestMessage = json['latestMessage'],
        latestMessageTime = json['latestMessageTime'],
        title = json['title'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'overview': overview,
        'rating': rating,
        'latestMessage': latestMessage,
        'latestMessageTime': latestMessageTime,
        'title': title
      };

  static final QueryField ID = QueryField(fieldName: "movie.id");
  static final QueryField IMAGE = QueryField(fieldName: "image");
  static final QueryField OVERVIEW = QueryField(fieldName: "overview");
  static final QueryField RATING = QueryField(fieldName: "rating");
  static final QueryField LATESTMESSAGE =
      QueryField(fieldName: "latestMessage");
  static final QueryField LATESTMESSAGETIME =
      QueryField(fieldName: "latestMessageTime");
  static final QueryField TITLE = QueryField(fieldName: "title");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Movie";
    modelSchemaDefinition.pluralName = "Movies";

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
        key: Movie.IMAGE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Movie.OVERVIEW,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Movie.RATING,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Movie.LATESTMESSAGE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Movie.LATESTMESSAGETIME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Movie.TITLE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _MovieModelType extends ModelType<Movie> {
  const _MovieModelType();

  @override
  Movie fromJson(Map<String, dynamic> jsonData) {
    return Movie.fromJson(jsonData);
  }
}
