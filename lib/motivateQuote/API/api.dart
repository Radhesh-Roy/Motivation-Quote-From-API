import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
class Api {

   getData()async{
    var url= Uri.parse("https://appapi.coderangon.com/api/slider");
    var response= await http.get(url);
    return jsonDecode(response.body);

    // print("${response.body}");


  }

}