import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ShadowContai extends StatefulWidget {
  const ShadowContai({super.key, this.height, this.width});
  final double? height, width;

  @override
  State<ShadowContai> createState() => _ShadowContaiState();
}

class _ShadowContaiState extends State<ShadowContai> {
  late bool _isLoading;
  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Shimmer(
        child: Container(
      color: Colors.deepPurple,
    ));
  }
}
