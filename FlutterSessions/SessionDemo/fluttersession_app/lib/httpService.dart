
import 'dart:convert';

import 'package:http/http.dart' as http;

class httpService{

  static String channelApi = "https://api.thingspeak.com/channels/793622/feeds.json?results=2";

 static Future<String> getData() async {

    final res = await http.get(Uri.parse(channelApi));

    if(res.statusCode == 200){
      final dict = json.decode(res.body);

      print(dict['feeds']);
      return res.body;
    }
    else
      return " ";

  }

}