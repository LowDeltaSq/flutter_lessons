import 'package:flutter/cupertino.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> product;
  final Function(Map<String, dynamic>) onAddToCart;

  const ProductDetailsScreen({
    super.key,
    required this.product,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(product['name'] ?? 'Детали продукта'),
        previousPageTitle: 'Назад',
      ),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemGrey3,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Icon(
                          CupertinoIcons.photo,
                          size: 80,
                          color: CupertinoColors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      product['name'] ?? '',
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      product['description'] ?? '',
                      style: const TextStyle(
                          fontSize: 16, color: CupertinoColors.systemGrey),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: CupertinoButton.filled(
                child: const Text('Добавить в корзину'),
                onPressed: () {
                  onAddToCart(product);
                  Navigator.pop(context); // Вернуться назад после добавления
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
