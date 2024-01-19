import 'package:flutter/material.dart';
import 'package:tienda/views/menu_grid.dart';

class SearchContai extends StatefulWidget {
  const SearchContai({super.key});

  @override
  State<SearchContai> createState() => _SearchContaiState();
}

class _SearchContaiState extends State<SearchContai> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
        body: SafeArea(
            child: Row(
      children: [WidgetSearch(), MenuGrid(imageUrls: imageUrls)],
    )));
  }
}

class WidgetSearch extends StatelessWidget {
  const WidgetSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            children: [
              Expanded(
                  child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Ingrese el nombre del proyecto'),
              )),
              Container(
                height: 50,
                width: 1,
                color: Colors.grey,
              ),
              IconButton(
                iconSize: 32.0,
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.all(10.0),
                  ),
                ),
                onPressed: () {
                  print('Objeto encontrado');
                },
                icon: Icon(Icons.search),
              )
            ],
          ),
        ));
  }
}
