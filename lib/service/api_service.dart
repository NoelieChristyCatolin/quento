import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiService{

  Future<Response> getFeeds() async{
    final _response = await http.get(Uri.parse('https://www.buzzfeed.com/world.xml'));
    return _response;
  }
}