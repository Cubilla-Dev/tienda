import 'package:flutter/material.dart';
import 'package:tienda/domain/peticiones.dart';
import 'package:tienda/views/image_slider.dart';
import 'package:tienda/views/menu_grid.dart';

class GridContai extends StatefulWidget {
  // final List<Map<String, dynamic>> imageUrls;

  const GridContai({Key? key}) : super(key: key);

  @override
  State<GridContai> createState() => _GridContaiState();
}

class _GridContaiState extends State<GridContai> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('La tienda'),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: MyImageSlider(
              imageUrls: imageUrls,
            ),
          ),
          Expanded(
            child: MenuGrid(
              imageUrls: imageUrls,
            ),
          ),
        ],
      )),
    );
  }
}
