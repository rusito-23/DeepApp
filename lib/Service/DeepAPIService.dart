import 'dart:convert';
import 'package:http/http.dart';
import '../Model/StyleModel.dart';


class DeepAPIService {
    final String BASE_URL = 'https://deep-api-23.herokuapp.com';

    DeepAPIService._init();
    static final DeepAPIService shared = DeepAPIService._init();

    bool _isValid(Response response) {
        return response.statusCode >= 200 && response.statusCode < 300; 
    }

    Future<List<StyleModel>> getStyles() async {
        final response = await(get('${BASE_URL}/deep/dream/styles'));

        if (_isValid(response)) {
            return StyleModel.fromJsonList(json.decode(response.body));
        } else {
            throw Exception('Failed to load styles');
        }
    }

}
