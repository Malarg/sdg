import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

class AppProviders {
  static final dioProvider = _dioProvider;
}

final _dioProvider = Provider<Dio>(
  (ref) {
    final dio = Dio();
    
    dio.options.baseUrl = 'https://68a2b00ac5a31eb7bb1d7ad2.mockapi.io'; 
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);
    dio.options.sendTimeout = const Duration(seconds: 30);
    
    // Add interceptors if needed
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      requestHeader: true,
      responseHeader: true,
    ));
    
    return dio;
  },
);