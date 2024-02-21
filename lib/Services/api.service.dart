// ignore_for_file: depend_on_referenced_packages, unused_local_variable

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:VedRich/Models/AppResponse.model.dart';

import 'app_exception.dart';

class ApiService {
  static final Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json'
  };

  static AppResponse _createResponse(res, {bool getOne = false}) {
    var parsedData = jsonDecode(res.body);

    int status = res.statusCode;
    bool success = parsedData['success'] ?? false;
    String message = parsedData['message'];

    parsedData.remove('message');
    parsedData.remove('success');

    var data = parsedData;

    if (getOne) data = data[0];

    return AppResponse(success: success, message: message, data: data);
  }



  static Future<String> getGeocoder(String url, Map<String, String> query,
      {Map<String, String>? headers}) async {
    debugPrint(Uri.parse(url).replace(queryParameters: query).toString());
    var response = await http.get(
      Uri.parse(url).replace(queryParameters: query),
      headers: {...defaultHeaders, ...(headers ?? {})},
    );
    if (response.statusCode != 200) {
      return "Oops! Issue found for location fetching.";
    }
    return response.body;
  }

  static Future<AppResponse> get(String url, Map<String, String> query,
      {Map<String, String>? headers}) async {
    debugPrint(Uri.parse(url).replace(queryParameters: query).toString());

    try {
      var response = await http.get(
        Uri.parse(url).replace(queryParameters: query),
        headers: {...defaultHeaders, ...(headers ?? {})},
      );
      return _createResponse(response);
    } on SocketException {
      debugPrint('No network');
      throw FetchDataException('No Internet connection');
    }
  }

  static Future<AppResponse> getlinkedgeofence(String url,
      {Map<String, String>? headers}) async {
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {...defaultHeaders, ...(headers ?? {})},
      );
      return _createResponse(response);
    } on SocketException {
      debugPrint('No network');
      throw FetchDataException('No Internet connection');
    }
  }

  static Future<AppResponse> delete(String url,
      {Map<String, String>? headers}) async {
    var response = await http.get(
      Uri.parse(url).replace(),
      headers: {...defaultHeaders, ...(headers ?? {})},
    );

    return _createResponse(response);
  }

  static Future<AppResponse> deletegeofence(url,
      {Map<String, String>? query, Map<String, String>? headers}) async {
    try {
      var response = await http.delete(
        Uri.parse(url),
        headers: {...defaultHeaders, ...(headers ?? {})},
      );

      return _createResponse(response);
    } on SocketException {
      debugPrint('No network');
      throw FetchDataException('No Internet connection');
    }
  }

  static Future<AppResponse> getOne(url, query, headers) async {
    var response = await http.get(
      Uri.parse(url).replace(queryParameters: query),
      headers: {...defaultHeaders, ...headers},
    );

    return _createResponse(response, getOne: true);
  }

  static Future<AppResponse> post(url, body,
      {Map<String, String>? query, Map<String, String>? headers}) async {
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {...defaultHeaders, ...(headers ?? {})},
        body: jsonEncode(body),
      );

      return _createResponse(response);
    } on SocketException {
      debugPrint('No network');
      throw FetchDataException('No Internet connection');
    }
  }

  static Future<AppResponse> put(url, body,
      {Map<String, String>? query,
        Map<String, String>? headers,
        String? id}) async {
    try {
      debugPrint(url);
      var response = await http.put(
        Uri.parse(url + '/' + id),
        headers: {...defaultHeaders, ...(headers ?? {})},
        body: jsonEncode(body),
      );

      return _createResponse(response);
    } on SocketException {
      debugPrint('No network');
      throw FetchDataException('No Internet connection');
    }
  }

  static Future<AppResponse> putWithQuery(
      url, {
        Map<String, dynamic>? query,
        Map<String, String>? headers,
      }) async {
    try {
      debugPrint(url);
      var response = await http.put(Uri.parse(url),
          headers: {...defaultHeaders, ...(headers ?? {})},
          body: jsonEncode(query));

      return _createResponse(response);
    } on SocketException {
      debugPrint('No network');
      throw FetchDataException('No Internet connection');
    }
  }

  static postWithFile(
      String url, Map<String, String> body, File file, query, headers) async {
    var request = http.MultipartRequest("POST", Uri.parse(url));
    // var pic = await http.MultipartFile.fromPath("image", file.path);

    if (file.path != "") {
      request.files.add(await http.MultipartFile.fromPath("image", file.path));
    }

    request.fields.addAll(body);

    var response = await request.send();

    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    var jsonRes = jsonDecode(responseString);

    return AppResponse(
        success: jsonRes['success'],
        message: jsonRes['message'],
        data: jsonRes['body']);
  }
}