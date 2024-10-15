import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url, String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        "Authorization": "Bearer $token",
      });
    }

    http.Response response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print(response.body);
      }
      debugPrint("success");
      return jsonDecode(response.body);
    } else {
      debugPrint(response.body);
      throw Exception(response.body);
    }
  }

  Future<dynamic> postWithGoogle(
      {required String url, dynamic body, String? token}) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };

    if (kDebugMode) {
      print("URL: $url");
    }
    if (kDebugMode) {
      print("Request Body: ${jsonEncode(body)}");
    }

    // Ensure the body is properly encoded as a JSON string
    http.Response response = await http.post(
      Uri.parse(url),
      body: jsonEncode(body), // Correctly encode the body as a JSON string
      headers: headers, // Pass headers
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response;
    } else {
      if (kDebugMode) {
        print('Error occurred: ${response.statusCode}');
      }
      if (kDebugMode) {
        print("respnse ${response.body}");
      }
      throw Exception(response.body);
    }
  }

  Future<dynamic> postWithEmailAndPassword(
      {required String url, dynamic body, String? token}) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({
        "Authorization": "Bearer $token",
      });
    }

    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  Future<dynamic> put(
      {required String url, dynamic body, String? token}) async {
    Map<String, String> headers = {
      "Content-Type": "application/x-www-form-urlencoded",
    };

    if (token != null) {
      headers.addAll({
        "Authorization": "Bearer $token",
      });
    }
    if (kDebugMode) {
      print("url =$url body=$body token=$token");
    }
    http.Response response = await http.put(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print(response.statusCode);
      }
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'Failed to load data status code: ${response.statusCode}');
    }
  }

  Future<dynamic> patch({
    required String url,
    dynamic body,
    String? token,
  }) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };

    // Ensure that the body is correctly encoded to JSON
    final encodedBody = jsonEncode(body);

    // if body == null  not send
    http.Response response = await http.patch(
      Uri.parse(url),
      body: body == null
          ? null
          : encodedBody, // Correctly encode the body to JSON
      headers: headers,
    );

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print(response.statusCode);
      }
      debugPrint("success");
      return jsonDecode(response.body); // Return the decoded JSON response
    } else {
      debugPrint(response.body.toString());
      debugPrint(response.statusCode.toString());
      throw Exception(response.body);
    }
  }

  Future<Map<String, dynamic>> patchResetPassword({
    required String url,
    dynamic body,
    String? token,
  }) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };

    final encodedBody = jsonEncode(body);

    http.Response response = await http.patch(
      Uri.parse(url),
      body: body == null ? null : encodedBody,
      headers: headers,
    );

    // If the response is successful, return a map with status code and body
    if (response.statusCode == 200) {
      debugPrint("Request successful");
      return {
        "statusCode": response.statusCode,
        "body": jsonDecode(response.body),
      };
    } else {
      // In case of error, add the status code to the response body
      debugPrint("Error response: ${response.body}");
      debugPrint("Error status code: ${response.statusCode}");
      Map<String, dynamic> errorResponse = jsonDecode(response.body);
      errorResponse["statusCode"] = response.statusCode;

      // Throw an exception with both the status code and error body
      throw Exception(jsonEncode(errorResponse));
    }
  }

  Future<dynamic> delete({
    required String url,
    String? token,
  }) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };

    // if body == null  not send
    http.Response response = await http.delete(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print(response.statusCode);
      }
      debugPrint("success");
      return jsonDecode(response.body); // Return the decoded JSON response
    } else {
      debugPrint(response.body.toString());
      debugPrint(response.statusCode.toString());

      throw Exception(response.body);
    }
  }
}
