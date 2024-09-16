import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'product_details_top_bar.dart';
import '../../domain/entity/product_detais_entity/product_details_entity.dart';

class PrdouctDetailsImages extends StatelessWidget {
  const PrdouctDetailsImages({
    super.key,
    required this.product,
  });

  final ProductDetailsEntity product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // show back and love button
        CarouselSlider.builder(
          itemCount: product.images!.length,
          itemBuilder: (context, index, _) {
            return Image.network(
              product.images![index],
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height * .32,
              width: MediaQuery.of(context).size.width,
            );
          },
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * .32,
          ),
        ),
        Positioned(
          child: ProductDetailsTopBar(
            product: product,
          ),
        ),
      ],
    );
  }
}
