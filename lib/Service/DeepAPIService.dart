import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import '../Model/StyleModel.dart';
import '../Helpers/Logger.dart';


/// Deep API Service
///
/// Performs all API calls.
class DeepAPIService {
    final String BASE_URL = 'http://deep-api-23.herokuapp.com';

    DeepAPIService._init();
    static final DeepAPIService shared = DeepAPIService._init();

    bool _isValid(Response response) {
        return response.statusCode >= 200 && response.statusCode < 300; 
    }

    /// Get Styles
    /// Returns all available styles given by the API. 
    Future<List<StyleModel>> getStyles() async {
        // create url
        final uri = '${BASE_URL}/deep/dream/styles';
        logger.i('Fetching available styles on path: ${uri} ...');

        // send request
        final response = await(get(uri)).catchError((error) {
            logger.e('Failed to load styles with Error - ${error}');
            throw Exception('Failed to load styles');
        });

        // parse response
        if (_isValid(response)) {
            logger.i('Retrieved styles ...');
            return StyleModel.fromJsonList(json.decode(response.body));
        } else {
            logger.e('Failed to load styles with Response - ${response.statusCode} - ${response.body}');
            throw Exception('Failed to load styles');
        }
    }

    Future<File> createTempFile(StyleModel _style) async {
        Directory tempDir = await getTemporaryDirectory();
        String tempPath = tempDir.path;
        return File('${tempPath}/${_style.path}.jpeg');
    }

    Future<File> processDream(File _image, StyleModel _style) async {
        // create image request
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

        // send request
        final response = await request.send().catchError((error) {
            logger.e('Request failed with error - ${error}');
            throw Exception('Failed to dream');
        });

        // create temporary file
        var file = await createTempFile(_style).catchError((error) {
            logger.e('Temp file created failed with error - ${error}');
            throw Exception('Failed to dream');
        });

        // write byte stream into temp file
        var sink = file.openWrite();
        await response.stream.pipe(sink).catchError((error) {
            logger.e('Stream writing failed with error - ${error}');
            throw Exception('Failed to dream');
        });
        sink.close();
        return file;
  }

}
