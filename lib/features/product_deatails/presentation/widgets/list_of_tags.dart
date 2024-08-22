
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taswaq/core/shared/widgets/spacers.dart';
import 'package:taswaq/features/product_deatails/presentation/widgets/tag_item.dart';

import '../../domain/entity/product_detais_entity/product_details_entity.dart';

class ListOfTags extends StatelessWidget {
  const ListOfTags({
    super.key,
    required this.instance,
  });

  final ProductDetailsEntity instance;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (cxt, index) {
          return TagItem(title: instance.tags![index]);
        },
        separatorBuilder: (cxt, index) => const HorizantalSpace(10),
        itemCount: instance.tags!.length,
      ),
    );
  }
}
