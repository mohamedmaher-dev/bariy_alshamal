import 'package:bariy_alshamal/features/home/presentation/view_model/home_bloc/home_bloc.dart';
import 'package:bariy_alshamal/features/home/presentation/views/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    HomeBloc conroller = BlocProvider.of<HomeBloc>(context);
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => CategoryItem(
        controller: conroller,
        name: conroller.categorys[index].name,
        category: conroller.categorys[index].type,
      ),
      itemCount: conroller.categorys.length,
    );
  }
}
