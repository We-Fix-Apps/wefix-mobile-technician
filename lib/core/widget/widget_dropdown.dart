import 'package:flutter/material.dart';

import '../unit/app_color.dart';
import '../unit/app_text_style.dart';

class WidgetDropDown<T> extends StatelessWidget {
  final List<T> items;
  final VoidCallback? onTap;
  final T? value;
  final Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final String? hintText;
  final Widget? icon;
  final String Function(T) itemLabel;
  final TextStyle? styleHint;

  const WidgetDropDown({
    super.key,
    this.onTap,
    required this.items,
    this.hintText,
    required this.itemLabel,
    this.value,
    this.styleHint,
    this.onChanged,
    this.validator,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      style: AppTextStyle.style14.copyWith(color: AppColor.black),
      selectedItemBuilder: (BuildContext context) {
        return items.map<Widget>((T item) {
          return Text(
            itemLabel(item),
            style: AppTextStyle.style14.copyWith(color: AppColor.black),
          );
        }).toList();
      },
      hint: Text(hintText ?? '', style: styleHint ?? AppTextStyle.style14.copyWith(color: AppColor.grey)),
      icon: Row(
        children: [
          const Icon(Icons.arrow_drop_down_rounded, size: 22),
          if (onTap != null) InkWell(onTap: onTap, child: const Icon(Icons.clear, color: AppColor.red)),
        ],
      ),
      menuMaxHeight: MediaQuery.of(context).size.height * 0.4,
      isExpanded: true,
      dropdownColor: AppColor.white,
      decoration: InputDecoration(
        prefixIcon: icon,
        contentPadding: const EdgeInsets.all(7.0),
        fillColor: AppColor.white,
        filled: true,
        counter: const SizedBox(),
        hintStyle: AppTextStyle.style14.copyWith(color: AppColor.grey),
        hintText: hintText,
        border: OutlineInputBorder(gapPadding: 0, borderSide: const BorderSide(color: AppColor.grey), borderRadius: BorderRadius.circular(7)),
        focusedBorder: OutlineInputBorder(
          gapPadding: 0,
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.circular(7),
        ),
        enabledBorder: OutlineInputBorder(gapPadding: 0, borderSide: const BorderSide(color: AppColor.grey), borderRadius: BorderRadius.circular(7)),
      ),
      items: items.map((item) => DropdownMenuItem<T>(
        value: item,
        child: Text(itemLabel(item), style: AppTextStyle.style14.copyWith(color: AppColor.black)),
      )).toList(),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
