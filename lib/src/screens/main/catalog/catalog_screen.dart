import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:module_1/src/screens/main/catalog/product_screen.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  List<Map<String, dynamic>> products = [];
  List<Map<String, dynamic>> filteredProducts = [];
  List<Map<String, dynamic>> cart = [];
  bool isLoading = true;
  String? errorMessage;

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      setState(() {
        isLoading = true;
        errorMessage = null;
      });

      Dio dio = Dio();
      final response = await dio.get('http://10.0.2.2:53000/products');

      if (response.statusCode == 200 && response.data is List) {
        setState(() {
          products = List<Map<String, dynamic>>.from(response.data);
          filteredProducts = products;
        });
      } else {
        setState(() {
          errorMessage = 'Failed to load products';
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Error: ${e.toString()}';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _filterProducts(String query) {
    setState(() {
      filteredProducts = products
          .where((product) =>
              product['name']?.toLowerCase().contains(query.toLowerCase()) ??
              false ||
                  product['description']
                      ?.toLowerCase()
                      .contains(query.toLowerCase()) ??
              false)
          .toList();
    });
  }

  void _addToCart(Map<String, dynamic> product) {
    setState(() {
      cart.add(product);
    });
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text("Товар добавлен в корзину"),
          content: Text("Вы добавили ${product['name']} в корзину."),
          actions: [
            CupertinoDialogAction(
              child: const Text("ОК"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _navigateToProductDetails(Map<String, dynamic> product) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => ProductDetailsScreen(
          product: product,
          onAddToCart: _addToCart,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Каталог'),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: CupertinoTextField(
                controller: searchController,
                placeholder: 'Поиск',
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                onChanged: _filterProducts,
              ),
            ),
            if (isLoading) const Center(child: CupertinoActivityIndicator()),
            if (errorMessage != null) Center(child: Text(errorMessage!)),
            if (!isLoading && errorMessage == null)
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.65,
                  ),
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    final product = filteredProducts[index];
                    return CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        _navigateToProductDetails(product);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: CupertinoColors.systemGrey6,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 150,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(15)),
                                color: CupertinoColors.systemGrey3,
                              ),
                              child: const Center(
                                child: Icon(
                                  CupertinoIcons.photo,
                                  color: CupertinoColors.white,
                                  size: 40,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product['name']?.toString() ?? '',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    product['description']?.toString() ?? '',
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color: CupertinoColors.systemGrey),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
