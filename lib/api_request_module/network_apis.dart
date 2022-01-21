import 'dart:convert';
import 'package:demo_project/model/model.dart';
import 'package:dio/dio.dart';

class NetworkApis {
  late Dio dio;

  static final NetworkApis _singleton = NetworkApis._internal();

  NetworkApis._internal();

  factory NetworkApis() {
    return _singleton;
  }

  Future<List<ItemListModel>> getRequest({String? url}) async {
    try {
      dio = Dio();
      print("Url ${url}");

      final response = await dio.get(
        url!,
      );
      print("response =========");
      print(response.data.toString());
      List<ItemListModel> list = [];
      for (int i = 0; i < response.data.length; i++) {
        list.add(ItemListModel.fromJson(response.data[i]));
      }

      return list;
    } catch (error) {
      handleError(error, false);
      return [];
    }
  }
}

String handleError(Object error, bool value) {
  String errorDescription = "";
  if (error is DioError) {
    DioError dioError = error as DioError;
    switch (dioError.type) {
      case DioErrorType.cancel:
        errorDescription = "Request to API server was cancelled";
        //ShowError.showErrorMessage(message: errorDescription);
        throw Exception(errorDescription);

      case DioErrorType.connectTimeout:
        errorDescription = "Connection timeout with API server";
        //ShowError.showErrorMessage(message: errorDescription);
        throw Exception(errorDescription);
      case DioErrorType.other:
        errorDescription =
            "Connection to API server failed due to internet connection";
        print("============Time out Issue${errorDescription}");
        throw Exception(errorDescription);
      case DioErrorType.receiveTimeout:
        errorDescription = "Receive timeout in connection with API server";
        print("============Time out Issue${errorDescription}");
        //ShowError.showErrorMessage(message: errorDescription);
        throw Exception(errorDescription);
      case DioErrorType.response:
        errorDescription =
            "Received invalid status code: ${dioError.response!.statusCode}";

        throw Exception(errorDescription);
      case DioErrorType.sendTimeout:
        errorDescription = "Send timeout in connection with API server";

        print("============Time out Issue${errorDescription}");

        throw Exception(errorDescription);
    }
  } else {
    errorDescription = "Unexpected error occured";
  }
  return errorDescription;
}
