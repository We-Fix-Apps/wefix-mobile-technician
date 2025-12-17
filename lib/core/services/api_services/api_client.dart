import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../constant/app_links.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) {
    return _ApiClient(dio, baseUrl: baseUrl ?? AppLinks.server);
  }

  // ---------------- GET ----------------
  @GET("{endpoint}")
  Future<HttpResponse<dynamic>> getRequest({
    @Path("endpoint") required String endpoint,
    @Queries() Map<String, dynamic>? query,
    @Header("Authorization") String? authorization,
  });

  // ---------------- POST ----------------
  @POST("{endpoint}")
  Future<HttpResponse<dynamic>> postRequest({
    @Path("endpoint") required String endpoint,
    @Body() required Map<String, dynamic> body,
    @Queries() Map<String, dynamic>? query,
    @Header("Authorization") String? authorization,
  });

  // ---------------- PUT ----------------
  @PUT("{endpoint}")
  Future<HttpResponse<dynamic>> putRequest({
    @Path("endpoint") required String endpoint,
    @Body() required Map<String, dynamic> body,
    @Queries() Map<String, dynamic>? query,
    @Header("Authorization") String? authorization,
  });

  // ---------------- DELETE ----------------
  @DELETE("{endpoint}")
  Future<HttpResponse<dynamic>> deleteRequest({
    @Path("endpoint") required String endpoint,
    @Queries() Map<String, dynamic>? query,
    @Header("Authorization") required String authorization,
  });

  // ---------------- Upload Single File ----------------
  @POST("{endpoint}")
  @MultiPart()
  Future<HttpResponse<dynamic>> uploadFile({
    @Path("endpoint") required String endpoint,
    @Part(name: "file") required File file,
    @Part(name: "name") String? name,
    @Header("Authorization") String? authorization,
  });

  // ---------------- Upload Multiple Files ----------------
  @POST("{endpoint}")
  @MultiPart()
  Future<HttpResponse<dynamic>> uploadMultipleFiles({
    @Path("endpoint") required String endpoint,
    @Part(name: "files") required List<MultipartFile> files,
    @Part(name: "albumId") required String albumId,
    @Header("Authorization") String? authorization,
  });
}
