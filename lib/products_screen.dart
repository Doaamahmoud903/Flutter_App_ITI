import 'package:flutter/material.dart';
import 'package:first_app_filter/product_element.dart';
import 'dio/api_provider.dart';
import 'models/product_model.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  ProductsModel? productsModel;
  bool isLoading = true;

  getProductsFromApiProvider() async {
    productsModel = await ApiProvider().getProducts();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getProductsFromApiProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Soft background color
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.indigo, Colors.deepPurpleAccent], // Modern gradient
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 4,
        leading: const Icon(
          Icons.storefront,
          color: Colors.white,
          size: 30,
        ),
        centerTitle: true,
        title: const Text(
          "Products",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: isLoading
          ? const Center(
        child: CircularProgressIndicator(
          color: Colors.teal,
        ),
      )
          : productsModel == null || productsModel!.products.isEmpty
          ? const Center(
        child: Text(
          "No products available",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
        ),
      )
          : Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProductsElement(
                product: productsModel!.products[index],
              ),
            ),
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemCount: productsModel!.products.length,
        ),
      ),
    );
  }
}
