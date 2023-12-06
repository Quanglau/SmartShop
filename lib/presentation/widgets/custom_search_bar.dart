import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final Function()? onSubmitted;
  const CustomSearchBar({
    required this.textEditingController,
    required this.focusNode,
    this.onSubmitted,
    super.key,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
      ),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            size: 24,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: TextField(
              textInputAction: TextInputAction.search,
              controller: widget.textEditingController,
              focusNode: widget.focusNode,
              onTapOutside: (event) {
                widget.focusNode.unfocus();
              },
              onSubmitted: (value) {
                widget.onSubmitted?.call();
              },
              decoration: const InputDecoration(
                hintText: 'Tìm kiếm sản phẩm',
                hintStyle: TextStyle(
                  fontSize: 16,
                ),
                border: InputBorder.none,
              ),
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          if (widget.textEditingController.text.isNotEmpty)
            IconButton(
                onPressed: () {
                  widget.textEditingController.clear();
                },
                icon: const Icon(
                  Icons.cancel,
                )),
        ],
      ),
    );
  }
}
