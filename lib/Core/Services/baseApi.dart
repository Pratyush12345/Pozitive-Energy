import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:pozitive/Core/Model/apiError.dart';
import 'package:pozitive/Core/Model/sendable.dart';

GetIt getIt = GetIt.instance;

abstract class BaseApi {
  // TODO: Move the endpoint to some settings file?
  static const _ENDPOINT = 'https://api.boshposh.com/api/Partner/';
  final client = http.Client();

  @protected
  Future<dynamic> getRequest(String path, Function(Response) success) async {
    return _processResponse(
        await client.get(
          '${BaseApi._ENDPOINT}/$path',
        ),
        success);
  }

  @protected
  Future<dynamic> postRequest(String path, Function(Response) success,
      [Sendable body]) async {
    //print(body.toJson());
    //    var data=await jsonEncode(body.toJson());
    return _processResponse(
        await client.post('${BaseApi._ENDPOINT}/$path',
            body: body != null ? body.toJson() : null),
        success);
  }

  @protected
  Future<dynamic> putRequest(String path, Function(Response) success,
      [Sendable body]) async {
    return _processResponse(
        await client.put('${BaseApi._ENDPOINT}/$path',
            //            body: body != null ? jsonEncode(body.toJson()) : null
            body: body != null ? body.toJson() : null),
        success);
  }

  @protected
  Future<dynamic> deleteRequest(String path, Function(Response) success) async {
    return _processResponse(
        await client.delete(
          '${BaseApi._ENDPOINT}/$path',
        ),
        success);
  }

  dynamic _processResponse(Response response, Function(Response) success) {
    if (200 >= response.statusCode && response.statusCode < 300) {
      return success(response);
    } else {
      return ApiError.fromJson(json.decode(response.body));
    }
  }
}
