import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import '../Model/StyleModel.dart';
import '../Helpers/Logger.dart';


class DeepAPIService {
    final String BASE_URL = 'http://localhost:5000';

    DeepAPIService._init();
    static final DeepAPIService shared = DeepAPIService._init();

    bool _isValid(Response response) {
        return response.statusCode >= 200 && response.statusCode < 300; 
    }

    Future<List<StyleModel>> getStyles() async {
        final uri = '${BASE_URL}/deep/dream/styles';
        logger.i('Fetching available styles on path: ${uri} ...');
        final response = await(get(uri));

        if (_isValid(response)) {
            logger.i('Retrieved styles ...');
            return StyleModel.fromJsonList(json.decode(response.body));
        } else {
            logger.e('Failed to load styles - ${response.statusCode} - ${response.body}');
            throw Exception('Failed to load styles');
        }
    }

    Future<File> createFile(StyleModel _style) async {
        Directory tempDir = await getTemporaryDirectory();
        String tempPath = tempDir.path;
        return File('${tempPath}/${_style.path}.jpeg');
    }

    Future<File> processDream(File _image, StyleModel _style) async {
        var stream = new ByteStream(DelegatingStream.typed(_image.openRead()));
        var length = await _image.length();
        var uri = Uri.parse('${BASE_URL}/deep/dream/${_style.path}');
        var request = new MultipartRequest('POST', uri);

        var multipartFile = new MultipartFile('image',
                                              stream,
                                              length,
                                              filename: basename(_image.path));
        request.files.add(multipartFile);
        logger.i('Sending dream request for style: ${_style.name} with path: ${uri}');

        final response = await request.send();
        var file = await createFile(_style);
        var sink = file.openWrite();
        await response.stream.pipe(sink);
        sink.close();
        return file;
  }

}
