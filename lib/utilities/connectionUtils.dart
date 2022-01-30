import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:news_feed/utilities/systemConstants.dart';

import 'dialogs.dart';

class ConnectionUtils {
  BuildContext context;

  Future<String> createPost( String parameter, bool hasLoading) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      MessageDialogs().messageDialog(context, "Alert", "Please Check Your Network Connection", 453);
      return "";
    }
    String url = serverUrl+"&"+parameter;

    print(url);
    var uri = Uri.parse(url);
    http.Response response = await http.get(uri);
    final int statusCode = response.statusCode;
    if (statusCode < 200 || statusCode > 400) {
      if (hasLoading) {
        MessageDialogs().dismissDialogs(context);
      }
      //MessageDialogs().messageDialog(context, "Error",
      // "Seems There is a problem please try again later", 564);
      throw  Exception("Error while fetching data");
    }
    return response.body;
  }

  Future<dynamic> formDataPost(http.MultipartRequest formData, bool hasLoading) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      MessageDialogs().messageDialog(context, "Alert", "Please Check Your Network Connection", 453);
      return "";
    }

    // we are copying the request, because we can not use the original one
    http.BaseRequest requestCopy = http.MultipartRequest(formData.method, formData.url)
      ..fields.addAll(formData.fields)
      ..files.addAll(formData.files);

    return requestCopy.send().then((http.StreamedResponse response) async {
      final int statusCode = response.statusCode;
      print('STATUS CODE IS $statusCode');
      if (statusCode < 200 || statusCode > 400) {
        // no need to get the body, just leave
        return (false);
      }

      return true;
    }).catchError((err) {
      return (false);
    });
  }

  ConnectionUtils(this.context);
}
