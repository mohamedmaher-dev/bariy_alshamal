import 'package:flutter/material.dart';

import 'extra_item.dart';
import 'section_item.dart';

class MafroumSection extends StatelessWidget {
  const MafroumSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const SectionItem(name: "مفروم"),
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
