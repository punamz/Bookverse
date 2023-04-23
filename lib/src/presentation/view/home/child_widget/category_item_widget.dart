import 'package:bookverse/src/domain/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItemWidget extends StatelessWidget {
  final CategoryModel category;
  final void Function(CategoryModel category) onSelect;
  const CategoryItemWidget({Key? key, required this.category, required this.onSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: InkWell(
          onTap: () => onSelect.call(category),
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Center(
              child: Text(
                category.name ?? '',
                style: context.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
