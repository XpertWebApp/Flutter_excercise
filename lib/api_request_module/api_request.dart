import 'package:demo_project/api_request_module/network_apis.dart';
import 'package:demo_project/model/model.dart';
import 'package:flutter/material.dart';

import 'api_url.dart';

class ApiRequest {
  static final ApiRequest _singleton = ApiRequest._internal();

  ApiRequest._internal();

  var request = NetworkApis();

  factory ApiRequest() {
    return _singleton;
  }

  Future<List<ItemListModel>> getItemList() async {
    var res = await request.getRequest(url: ApiUrl.baseUrl + ApiUrl.getProduct);

    return  res;
  }
}
