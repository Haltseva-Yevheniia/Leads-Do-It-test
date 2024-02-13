import 'dart:convert';
import 'dart:developer';

import 'package:lead_do_it_test/constants.dart';
import 'package:lead_do_it_test/models/repository_model.dart';
import 'package:http/http.dart' as http;

class ServiceApi {
  Future<List<RepositoryModel>> fetchRepositories(
      {required String name}) async {
    Uri url = Uri.https(baseURL, pathURL, {
      'q': name,
      'per_page': '$searchResultsOutput',
    });
    final response = await http.get(url, headers: headers);

    if (response.statusCode != 200) {
      throw Exception('Error. Status code is ${response.statusCode}');
    }
    if (response.body.isEmpty) {
      throw Exception('The list of items is empty');
    }
    final data = jsonDecode(response.body);
    List<RepositoryModel> repositories =
        List<RepositoryModel>.from(data['items'].map(
      (item) => RepositoryModel.fromJson(item),
    ));
    logResponse(response);
    return repositories;
  }
}

void logResponse(http.Response response) {
  log('${response.request?.method.toUpperCase()} \n${response.request?.url}  \n${response.statusCode} \n${response.body.toString()} ');
}
