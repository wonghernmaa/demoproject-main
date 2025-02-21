import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'product_form_page/product_edit_page.dart';
import 'product_form_page/product_create_page.dart';
import 'product_model/product_data_model.dart';

class ProductMainPage extends StatefulWidget {
  const ProductMainPage({super.key});

  @override
  State<ProductMainPage> createState() => _ProductMainPageState();
}

class _ProductMainPageState extends State<ProductMainPage> {
  bool isLoaded = true;
  List<Product> product = [];
  Future<void> fetchData() async {
    try {
      var response = await http.get(Uri.parse('http://10.0.2.2:8001/products'));
      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        //print(jsonList);
        setState(() {
          product = jsonList.map((item) => Product.fromJson(item)).toList();
          isLoaded = true;
        });
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print(e);
    }
  }

/*
  Future<void> createProduct() async {
    try {
      var response = await http.post(
          Uri.parse("http://localhost:8001/products"),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode({
            "name": "iPhone 5s",
            "description": "Apple smartphone",
            "price": 21999.00
          }));
      if (response.statusCode == 201) {
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateProduct({dynamic idUpdate = "44b7"}) async {
    try {
      var response = await http.put(
          Uri.parse("http://localhost:8001/products/$idUpdate"),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode({
            "name": "iPhone 5 plus",
            "description": "Apple smartphone",
            "price": 34900.00
          }));
      if (response.statusCode == 200) {
//code somthing...
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteProduct({dynamic idDelete = "44b7"}) async {
    try {
      var response = await http
          .delete(Uri.parse("http://localhost:8001/products/$idDelete"));
      if (response.statusCode == 200) {
//code somthing...
      } else {
        throw Exception("Failed to delete products");
      }
    } catch (e) {
      print(e);
    }
  }
*/
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        backgroundColor: const Color.fromARGB(255, 193, 211, 225),
      ),
      body: isLoaded
          ? ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemCount: product.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Text('${product[index].id}'),
                  title: Text('${product[index].name}'),
                  subtitle: Text('${product[index].description}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${product[index].price}',
                        style: const TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Icon(
                        Icons.edit,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ],
                  ),
                  onTap: () async {
                    bool? isUpdated = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductEditPage(
                            productId: product[index].id.toString()),
                      ),
                    );
                    if (isUpdated == true) {
                      fetchData(); // โหลดข้อมูลใหม่ถ้ามีการแก้ไขหรือลบ
                    }
                  },
                );
              })
          : const Center(child: Text('loading...')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool? isUpdated = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProductFormPage()),
          );

          if (isUpdated == true) {
            fetchData(); // โหลดข้อมูลใหม่เมื่อกลับมาจากหน้าเพิ่มสินค้า
          }
        },
        backgroundColor: const Color.fromARGB(255, 174, 231, 168),
        child: const Icon(Icons.add),
      ),
    );
  }
}
