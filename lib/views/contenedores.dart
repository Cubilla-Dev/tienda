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
    int _currentIndex = 0;
    return Scaffold(
        appBar: AppBar(
          title: const Text('La tienda'),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.local_grocery_store_sharp,
                ))
          ],
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
        bottomNavigationBar: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.8),
              borderRadius: const BorderRadius.all(Radius.circular(24)),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // TODO: Agregar animacion y que los botones que funcione
              children: [
                Icon(Icons.home, size: 30, color: Colors.white),
                Icon(Icons.search, size: 30, color: Colors.white),
                Icon(Icons.person, size: 30, color: Colors.white),
              ],
            ),
            // child: BottomNavigationBar(
            //   currentIndex: _currentIndex,
            //   showUnselectedLabels: false,
            //   showSelectedLabels: false,
            //   // unselectedItemColor: Colors.amber,
            //   onTap: (index) {
            //     setState(() {
            //       _currentIndex = index;
            //     });
            //   },
            //   items: [
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.home),
            //       label: '',
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.search),
            //       label: '',
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.person),
            //       label: '',
            //     )
            //   ],
            // ),
          ),
        ));
  }
}
