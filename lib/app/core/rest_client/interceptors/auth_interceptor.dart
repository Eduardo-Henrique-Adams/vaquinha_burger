import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../global/global_context.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final sp = await SharedPreferences.getInstance();
    final accessToken = sp.getString('accessToken');
    options.headers['Authorization'] = 'Bearer $accessToken';

    handler.next(options);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      //Redirecionar o usuario para a tela de home
      GlobalContext.i.loginExpire();
    } else {
      handler.next(err);
    }
  }
}
