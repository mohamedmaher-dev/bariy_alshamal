import 'package:flutter/material.dart';

import 'extra_item.dart';
import 'section_item.dart';

class SizesSection extends StatelessWidget {
  const SizesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const SectionItem(name: "الأحجام"),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 0,
          itemBuilder: (context, index) => const ExtraItem(),
        )
      ],
    );
  }
}
