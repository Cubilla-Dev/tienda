import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class MenuGrid extends StatefulWidget {
  final List<Map<String, dynamic>> imageUrls;
  const MenuGrid({
    Key? key, // Corrige aquí
    required this.imageUrls,
  }) : super(key: key);
  @override
  State<MenuGrid> createState() => _MenuGridState();
}

class _MenuGridState extends State<MenuGrid> {
  // Corrige aquí
  late bool isLoading = true;
  @override
  void initState() {
    // isLoading = true;
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    //lo que no estan en oferta
    final List<Map<String, dynamic>> notOferta = widget.imageUrls
        .where((element) => element['oferta'] == false)
        .toList();
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: notOferta.length,
        itemBuilder: (context, index) {
          return isLoading
              ? Stack(
                  children: [
                    Shimmer(
                      child: Container(
                        color: Colors.grey.withOpacity(0.25),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      ),
                    )
                  ],
                )
              : Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: const BoxDecoration(
                        color: Colors.amber,
                      ),
                      child: Image.network(
                        widget.imageUrls[index]['url'],
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
                            widget.imageUrls[index]['name'],
                            style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            '\$${widget.imageUrls[index]['precio']}',
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
