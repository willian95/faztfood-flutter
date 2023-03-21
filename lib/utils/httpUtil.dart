import 'dart:convert';

import 'package:fastfoodapp/services/httpStatusService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;


class HttpUtil {
  final client = http.Client();
  final httpStatusService = HttpStatusService();

  httpPost(String url, data, {bool isClientAuth = false}) async {

    final headers = await setHeaderRequest(isClientAuth);
   
    await dotenv.load(
      fileName: ".env",
    );
    
    final response = await client.post(
      Uri.parse("${dotenv.env['SERVER_URL']}$url"),
      headers: headers,
      body: json.encode(data)
    );

    

    var hasError = responseHasError(response);
    if(hasError != false){
      return hasError;
    }
    return {
      "status": httpStatusService.SUCCESS,
      "message": "success",
      "data": json.decode(response.body)
    };
  }

  httpGet(String url, {bool isClientAuth = false}) async {
    
    try{

      final headers = await setHeaderRequest(isClientAuth);
      await dotenv.load(
        fileName: ".env",
      );
      final response = await client.get(
        Uri.parse("${dotenv.env['SERVER_URL']}$url"),
        headers: headers
      );
      var hasError = responseHasError(response);
      if(hasError != false){
        return hasError;
      }
      
      return {
        "status": httpStatusService.SUCCESS,
        "message": "success",
        "data": json.decode(response.body)
      };

    }catch(e){

      if(e == "Connection closed before full header was received"){
        httpGet(url, isClientAuth: isClientAuth);
      }

    }

  }

  httpDelete(String url, {bool isClientAuth = false}) async {
    
    try{

      final headers = await setHeaderRequest(isClientAuth);
      await dotenv.load(
        fileName: ".env",
      );
      final response = await client.delete(
          Uri.parse("${dotenv.env['SERVER_URL']}$url"),
          headers: headers
      );
      var hasError = responseHasError(response);
      if(hasError != false){
        return hasError;
      }

      return {
        "status": httpStatusService.SUCCESS,
        "message": "success",
        "data": json.decode(response.body)
      };

    }catch(e){

      if(e == "Connection closed before full header was received"){
        httpDelete(url, isClientAuth: isClientAuth);
      }

    }

  }

  httpPut(String url, data, {bool isClientAuth = false}) async {
    
    try{

      final headers = await setHeaderRequest(isClientAuth);
      await dotenv.load(
        fileName: ".env",
      );
      final response = await client.put(
        Uri.parse("${dotenv.env['SERVER_URL']}$url"),
        headers: headers,
        body: json.encode(data)
      );
      var hasError = responseHasError(response);
      if(hasError != false){
        return hasError;
      }
      
      return {
        "status": httpStatusService.SUCCESS,
        "message": "success",
        "data": json.decode(response.body)
      };

    }catch(e){

      if(e == "Connection closed before full header was received"){
        httpPut(url, data, isClientAuth: isClientAuth);
      }

    }

  }

  responseHasError(response){
    if(response.statusCode == httpStatusService.UNAUTHORIZED){
      return {
        "status": httpStatusService.UNAUTHORIZED,
        "message": "NO_AUTH"
      };
    }

    else if(response.statusCode == httpStatusService.NOT_FOUND){
      return {
        "status": httpStatusService.NOT_FOUND,
        "message": "NOT_FOUND"
      };
    }

    else if(response.statusCode == httpStatusService.ERROR){
      return {
        "status": httpStatusService.ERROR,
        "message": "SOMETHING_WENT_WRONG"
      };
    }
    else if(response.statusCode == httpStatusService.FORBIDDEN){
      return {
        "status": httpStatusService.FORBIDDEN,
        "message": "FORBIDDEN"
      };
    }
    else if(response.statusCode == httpStatusService.VALIDATION_FAIL){
      return {
        "status": httpStatusService.VALIDATION_FAIL,
        "message": "WRONG_DATA",
        "data": json.decode(response.body)
      };
    }
    return false;
  }

  setHeaderRequest(bool isClientAuth)async{
    var oauthToken = "";
    /*if(!isClientAuth){
      
      final accessToken = await userService.getUserAccessToken();
      return {
        "Accept":"application/json",
        "Content-type":"application/json",
        "Authorization": "Bearer ${accessToken}"
      };
    }*/

    return {
        "Accept":"application/json",
        "Content-type":"application/json"
      };
  }

}