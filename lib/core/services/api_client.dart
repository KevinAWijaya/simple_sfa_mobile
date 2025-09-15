import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as getx;

import 'dio_module.dart';

class ApiClient extends getx.GetxService {
  final Dio _dioModule = DioModule.instance.service();

  Future<ApiClient> init() async {
    // Tambah logika init jika perlu (contoh: ambil token dari storage)
    return this;
  }

  Future<Response?> get({
    required String url,
    Map<String, String> params = const {},
    Function(dynamic, dynamic)? onReceiveProgress,
    Map<String, dynamic> headers = const {},
  }) async {
    debugPrint("[ GET Request ]: $url");
    debugPrint("[ Params ]: $params");

    try {
      Response response = await _dioModule.get(
        url,
        queryParameters: params,
        options: Options(headers: headers),
        onReceiveProgress: onReceiveProgress,
      );
      debugPrint("[ StatusCode ]: ${response.statusCode}");
      debugPrint("[ Body ]: ${response.data}");
      return response;
    } on DioException catch (e) {
      debugPrint("[ Error ${e.response?.statusCode ?? 503}]: ${e.response}");
      return e.response;
    }
  }

  Future<Response?> getWithDioNewInstance({
    required String url,
    Map<String, String> params = const {},
    Map<String, dynamic> headers = const {},
  }) async {
    debugPrint("[ GET Request ]: $url");
    debugPrint("[ Params ]: $params");

    try {
      Response response = await Dio().get(url, queryParameters: params, options: Options(headers: headers));
      debugPrint("[ StatusCode ]: ${response.statusCode}");
      return response;
    } on DioException catch (e) {
      debugPrint("[ Error ${e.response?.statusCode ?? 503}]: ${e.response}");
      return e.response;
    }
  }

  Future<Response?> postMultipart({
    required String url,
    Map<String, dynamic> headers = const {},
    FormData? formData,
  }) async {
    try {
      headers[Headers.contentTypeHeader] = "multipart/form-data";

      debugPrint("[ PUT Multipart Request ]: $url");
      debugPrint("[ FormData ]: $formData");

      Response response = await _dioModule.post(url, options: Options(headers: headers), data: formData);
      debugPrint("[ StatusCode ]: ${response.statusCode}");
      return response;
    } on DioException catch (e) {
      debugPrint("[ Error ${e.response?.statusCode ?? 503}]: ${e.response}");
      return e.response;
    }
  }

  Future<Response?> putMultipart({
    required String url,
    Map<String, dynamic> headers = const {},
    FormData? formData,
  }) async {
    try {
      headers[Headers.contentTypeHeader] = "multipart/form-data";

      debugPrint("[ PUT Multipart Request ]: $url");
      debugPrint("[ FormData ]: $formData");

      Response response = await _dioModule.put(url, options: Options(headers: headers), data: formData);
      debugPrint("[ StatusCode ]: ${response.statusCode}");
      return response;
    } on DioException catch (e) {
      debugPrint("[ Error ${e.response?.statusCode ?? 503}]: ${e.response}");
      return e.response;
    }
  }

  Future<Response?> post({required String url, Map<String, dynamic> headers = const {}, Map<String, dynamic> body = const {}}) async {
    // headers["Content-Type"] =  Headers.jsonContentType;

    debugPrint("[ POST Request ]: $url");
    debugPrint("[ Body ]: $body");
    try {
      Response response = await _dioModule.post(url, options: Options(headers: headers), data: body);
      debugPrint("[ StatusCode ]: ${response.statusCode}");
      debugPrint("[ Body ]: ${response.data}");
      return response;
    } on DioException catch (e) {
      debugPrint("[ Error ${e.response?.statusCode ?? 503}]: ${e.response}");
      return e.response;
    }
  }

  Future<Response?> put({
    required String url,
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> params = const {},
    Map<String, dynamic> body = const {},
  }) async {
    // headers["Content-Type"] =  Headers.jsonContentType;

    debugPrint("[ PUT Request ]: $url");
    debugPrint("[ Body ]: $body");

    try {
      Response response = await _dioModule.put(
        url,
        queryParameters: params,
        options: Options(headers: headers),
        data: body,
      );
      debugPrint("[ StatusCode ]: ${response.statusCode}");
      debugPrint("[ Body ]: ${response.data}");
      return response;
    } on DioException catch (e) {
      debugPrint("[ Error ${e.response?.statusCode ?? 503}]: ${e.response}");
      return e.response;
    }
  }

  Future<Response?> putWithBodyList({
    required String url,
    Map<String, dynamic> headers = const {},
    Map<String, String> params = const {},
    List<Map<String, dynamic>> body = const [],
  }) async {
    // headers["Content-Type"] =  Headers.jsonContentType;

    debugPrint("[ PUT Request ]: $url");
    debugPrint("[ Body ]: $body");

    try {
      Response response = await _dioModule.put(
        url,
        queryParameters: params,
        options: Options(headers: headers),
        data: body,
      );
      debugPrint("[ StatusCode ]: ${response.statusCode}");
      return response;
    } on DioException catch (e) {
      debugPrint("[ Error ${e.response?.statusCode ?? 503}]: ${e.response}");
      return e.response;
    }
  }

  Future<Response?> delete({required String url, Map<String, dynamic> headers = const {}, Map<String, dynamic> body = const {}}) async {
    // headers["Content-Type"] =  Headers.jsonContentType;

    debugPrint("[ DELETE Request ]: $url");
    debugPrint("[ Body ]: $body");

    try {
      Response response = await _dioModule.delete(url, options: Options(headers: headers), data: body);
      debugPrint("[ StatusCode ]: ${response.statusCode}");
      return response;
    } on DioException catch (e) {
      debugPrint("[ Error ${e.response?.statusCode ?? 503}]: ${e.response}");
      return e.response;
    }
  }

  Future<Response?> deleteWithBodyList({
    required String url,
    Map<String, dynamic> headers = const {},
    Map<String, String> params = const {},
    List<Map<String, dynamic>> body = const [],
  }) async {
    // headers["Content-Type"] =  Headers.jsonContentType;

    debugPrint("[ PUT Request ]: $url");
    debugPrint("[ Body ]: $body");

    try {
      Response response = await _dioModule.delete(
        url,
        queryParameters: params,
        options: Options(headers: headers),
        data: body,
      );
      debugPrint("[ StatusCode ]: ${response.statusCode}");
      return response;
    } on DioException catch (e) {
      debugPrint("[ Error ${e.response?.statusCode ?? 503}]: ${e.response}");
      return e.response;
    }
  }

  Future<Map<String, dynamic>> download({
    required String url,
    required String fileDestination,
    Map<String, dynamic> headers = const {},
    Function(dynamic, dynamic)? onReceiveProgress,
  }) async {
    // headers["Content-Type"] =  Headers.jsonContentType;

    debugPrint("[ DOWNLOAD Request ]: $url");

    try {
      Response response = await _dioModule.download(url, fileDestination, options: Options(headers: headers), onReceiveProgress: onReceiveProgress);
      debugPrint("[ StatusCode ]: ${response.statusCode}");
      return {
        "code": response.statusCode ?? 503,
        "messages": response.statusMessage ?? "Internal Server Error",
      };
    } on DioException catch (e) {
      debugPrint("[ Error ${e.response?.statusCode ?? 503}]: ${e.response}");
      return {
        "code": e.response!.statusCode ?? 503,
        "messages": e.response!.statusMessage ?? "Internal Server Error",
      };
    }
  }

  Map<String, dynamic> responseHandler(Response? res) {
    String message = errorMessage(res?.statusCode ?? 503);
    if (res == null && res?.data is String) {
      message += ", check your connection or contact our customer service";
      res?.data = null;
    } else {
      debugPrint(res?.data.toString());
      if (res?.data['messages'] == null) {
        message = errorMessage(res?.statusCode ?? 503);
      } else {
        message = res?.data['messages']["err_msg"][0] ?? errorMessage(res?.statusCode ?? 503);
      }
    }

    return {
      "code": res?.statusCode ?? 503,
      "messages": message,
      "data": res?.data != null ? res!.data["data"] : null,
    };
  }
}

String errorMessage(int statusCode) {
  switch (statusCode) {
    case 200:
      return 'OK: The request has succeeded.';
    case 201:
      return 'Created: The request has been fulfilled, resulting in the creation of a new resource.';
    case 204:
      return 'No Content: The server successfully processed the request, but is not returning any content.';
    case 400:
      return 'Bad Request: The server could not understand the request due to invalid syntax.';
    case 401:
      return 'Unauthorized: The client must authenticate itself to get the requested response.';
    case 403:
      return 'Forbidden: The client does not have access rights to the content.';
    case 404:
      return 'Not Found: The server can not find requested resource.';
    case 500:
      return 'Internal Server Error: The server has encountered a situation it doesn\'t know how to handle.';
    case 502:
      return 'Bad Gateway: The server, while acting as a gateway or proxy, received an invalid response from the upstream server.';
    case 503:
      return 'Service Unavailable: The server is not ready to handle the request.';
    case 504:
      return 'Gateway Timeout: The server, while acting as a gateway or proxy, did not get a response in time from the upstream server.';
    default:
      return 'Unknown status code: $statusCode';
  }
}
