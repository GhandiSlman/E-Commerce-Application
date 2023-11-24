import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerHomeScreen extends StatelessWidget {
  const ShimmerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 70, right: 20, left: 20),
          child: Column(
            children: [
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: Colors.red),
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                height: 100,
                child: ListView.separated(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.grey[100]),
                          height: 60,
                          width: 60,
                          child: Padding(
                            padding: EdgeInsets.all(15),
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    width: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 250,
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 2,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width * .4,
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
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    width: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
