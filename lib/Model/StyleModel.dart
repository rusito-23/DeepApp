import 'dart:convert';
import 'dart:typed_data';

/// Style Model
///
/// Saves style configuration
class StyleModel {
    String name;
    String description;
    String path;
    Uint8List icon;

    StyleModel({this.name, this.description, this.path, this.icon});

    factory StyleModel.fromJson(Map<String, dynamic> json) {
        return StyleModel(
            name: json['name'],
            description: json['description'],
            path: json['title'],
            icon: Base64Decoder().convert(json['icon']),
        );
    } 

    static fromJsonList(List<dynamic> list) {
        return list.map((x) => StyleModel.fromJson(x)).toList();
    }

}
