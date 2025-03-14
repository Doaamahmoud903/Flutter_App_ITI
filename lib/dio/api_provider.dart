import 'package:dio/dio.dart';
import 'package:first_app_filter/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiProvider {
  final String baseUrl = "https://dummyjson.com";

  ProductsModel? productsModel;

  Future<ProductsModel?> getProducts() async {
    try {
      Response response = await Dio().get("$baseUrl/products");
      print(response.data.toString());
      productsModel = ProductsModel.fromJson(response.data);
      print(productsModel?.products[0].title);
      return productsModel;
    } catch (e) {
      print(e.toString());
    }
  }

  userLoginEmail({required String email, required String password}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();


    try {
      FormData userData = FormData.fromMap({
        "username": email,
        "password": password,
      });
      Response response = await Dio().post(
        "$baseUrl/auth/login",
        data: userData,
      );
      print(response.data["accessToken"]);

      prefs.setString("token", response.data["accessToken"]);
    } catch (e) {
      print(e.toString());
      if(e is DioException){
        print(e.response?.data["message"]);
        throw Exception(e.response?.data["message"]);
      };
    }
  }
}