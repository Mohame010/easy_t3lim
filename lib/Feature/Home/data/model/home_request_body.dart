import 'package:json_annotation/json_annotation.dart';

part 'home_request_body.g.dart';
@JsonSerializable()
class HomeRequestBody {
    final String token;


  HomeRequestBody({ required this.token});



  Map<String, dynamic> toJson() => _$HomeRequestBodyToJson(this);

}
