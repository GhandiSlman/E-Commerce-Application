import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Shimmerr extends StatelessWidget {
  const Shimmerr({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: GridView.builder(
        itemBuilder: (_, __) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 200.0,
                color: Colors.white,
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 10,
                width: double.infinity,
                color: Colors.white,
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 10,
                width: double.infinity,
                color: Colors.white,
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 10,
                width: double.infinity,
                color: Colors.white,
              ),
            ],
          ),
        ),
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of items per row
          crossAxisSpacing: 10, // Horizontal space between items
          mainAxisSpacing: 10, // Vertical space between items
          childAspectRatio: 0.5, // Aspect ratio of each item
        ), // Number of shimmer items
      ),
    );
  }
}
