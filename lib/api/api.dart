import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  final  String serveUrl = "http://127.0.0.1:8000/api/admin";
  var data;
  Future<List> post(var dataBody,String path) async{
    String url = "$serveUrl/$path";
    final response = await http.post(
      url,
      headers: {},
      body:dataBody
    );
    return json.decode(response.body);
  }
  Future<List> get(String path) async{
    String url = "$serveUrl/$path";
    final response = await http.get(
        url,
        headers: {},
    );
    Future<List> put(var dataBody,String path) async{
      String url = "$serveUrl/$path";
      final response = await http.put(
          url,
          headers: {},
          body:dataBody
      );
      return json.decode(response.body);
    }
    return json.decode(response.body);
  }

  saveToken(String token) async{
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }
}