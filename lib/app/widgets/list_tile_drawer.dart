import 'package:flutter/material.dart';

class ListTileDrawerCustom extends StatelessWidget {
  const ListTileDrawerCustom({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
