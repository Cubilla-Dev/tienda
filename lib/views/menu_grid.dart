import 'package:flutter/material.dart';

class MenuGrid extends StatelessWidget {
  final List<Map<String, dynamic>> imageUrls;
  const MenuGrid({
    Key? key, // Corrige aquí
    required this.imageUrls,
  }) : super(key: key); // Corrige aquí

  @override
  Widget build(BuildContext context) {
    //lo que no estan en oferta
    final List<Map<String, dynamic>> notOferta =
        imageUrls.where((element) => element['oferta'] == false).toList();
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: notOferta.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: const BoxDecoration(
                  color: Colors.amber,
                ),
                child: Image.network(
                  imageUrls[index]['url'],
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 80.0,
                left: 10.0,
                right: 10.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      imageUrls[index]['name'],
                      style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      '\$${imageUrls[index]['precio']}',
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }
}
