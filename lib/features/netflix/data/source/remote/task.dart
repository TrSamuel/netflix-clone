import 'dart:convert';

import 'package:http/http.dart' as http;

main(){
  get();
}

Future<void> get() async {
  final response=await http.get(Uri.parse('https://restcountries.com/v3.1/all?fields=name'));

  if(response.statusCode==200){
    print(response.body);
    // final  data=jsonDecode(response.body) as  List;
    // print(data.first);
  } 
}