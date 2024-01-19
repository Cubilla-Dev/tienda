import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class MyImageSlider extends StatefulWidget {
  final List<Map<String, dynamic>> imageUrls;
  const MyImageSlider({
    Key? key, // Corrige aquí
    required this.imageUrls,
  }) : super(key: key);
  @override
  State<MyImageSlider> createState() => _MyImageSliderState();
}

class _MyImageSliderState extends State<MyImageSlider> {
  // Corrige aquí
  late bool isLoading = false;
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
    final List<Map<String, dynamic>> ofertaImagen =
        widget.imageUrls.where((map) => map['oferta'] == true).toList();
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      items: ofertaImagen.map((map) {
        return Builder(
          builder: (BuildContext context) {
            return isLoading
                ? Shimmer(
                    child: Container(
                    color: Colors.grey.withOpacity(0.25),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  ))
                : Stack(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          //si se cumple la condicion se muestra la imagen debes de usar if
                          child: Visibility(
                            visible: (map['oferta'] == true),
                            child: Image.network(
                              map['url'],
                              fit: BoxFit.cover,
                            ),
                          )),
                      //posicion de la oferta
                      Positioned(
                        bottom: 10.0,
                        left: 10.0,
                        right: 10.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (map['oferta'] == true)
                              Container(
                                alignment: Alignment.center,
                                width: 150,
                                height: 23,
                                color: Colors.red,
                                child: Text(
                                  'Oferta: \$${map['precio']}',
                                  style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            // Text(
                            //   '\$${map['precio']}',
                            //   style: const TextStyle(
                            //     fontSize: 14.0,
                            //     color: Colors.white,
                            //   ),
                            // ),
                          ],
                        ),
                      )
                    ],
                  );
          },
        );
      }).toList(),
    );
  }
}
