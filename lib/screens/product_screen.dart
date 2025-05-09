import 'package:flutter/material.dart';

class Product {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});

  final List<Product> products = [
    Product(
      name: 'Fresh Apple',
      description: 'Organic and juicy red apples.',
      price: 3.50,
      imageUrl: 'assets/images/apple.png',
    ),
    Product(
      name: 'Banana Bunch',
      description: 'Sweet ripe bananas from Madagascar.',
      price: 2.20,
      imageUrl: 'assets/images/banana.png',
    ),
  ];

  void _showProductDetails(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (_) {
        final theme = Theme.of(context);
        return Dialog(
          backgroundColor: theme.colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Image.network(product.imageUrl, width: 80, height: 80),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color:
                              theme.brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        product.description,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color:
                              theme.brightness == Brightness.dark
                                  ? Colors.grey[300]
                                  : Colors.grey[800],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Products',
          style: TextStyle(
            color:
                theme.brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
          ),
        ),
        backgroundColor: theme.colorScheme.surface,
        iconTheme: IconThemeData(
          color:
              theme.brightness == Brightness.dark ? Colors.white : Colors.black,
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: products.length,
        itemBuilder: (_, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () => _showProductDetails(context, product),
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              color: theme.colorScheme.surface,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Image.network(product.imageUrl, width: 80, height: 80),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color:
                                  theme.brightness == Brightness.dark
                                      ? Colors.white
                                      : Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            product.description,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color:
                                  theme.brightness == Brightness.dark
                                      ? Colors.grey[300]
                                      : Colors.grey[800],
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '\$${product.price.toStringAsFixed(2)}',
                            style: theme.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
