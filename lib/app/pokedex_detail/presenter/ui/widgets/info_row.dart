import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const InfoRow({Key? key, required this.label, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            label,
            // textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(value),
        ),
      ],
    );
  }
}
