import 'dart:convert';

import 'package:http/http.dart';
import 'package:pepetes/entities/account.dart';

const String GET_ACCOUNT_PATH = '/account/';

class BackendService{
  final String backendLocation;

  BackendService(this.backendLocation);

  Future<Account?> getAccountById(String id) async {
    Client client = Client();
    print('GET SEND TO: http://${this.backendLocation}$GET_ACCOUNT_PATH$id');
    Response response = await client.get(Uri.parse('https://${this.backendLocation}$GET_ACCOUNT_PATH$id'));
    /*Response response = await Dio().get(
      'http://${this.backendLocation}$GET_ACCOUNT_PATH$id',
      options: Options(
          headers: {
            Headers.contentTypeHeader: 'application/json'
          }
      ),
    );*/

    if (response.statusCode != 200) {
      return null;
    }
    return Account.fromJson(jsonDecode(response.body));
  }
}