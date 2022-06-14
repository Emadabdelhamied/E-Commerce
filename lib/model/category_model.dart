import 'dart:convert';

List<String> CategoryModelFromJson(String str) => List<String>.from(
      json.decode(str).map(
            (x) => x,
          ),
    );

String CategoryModelToJson(List<String> data) => json.encode(
      List<dynamic>.from(
        data.map(
          (x) => x,
        ),
      ),
    );
