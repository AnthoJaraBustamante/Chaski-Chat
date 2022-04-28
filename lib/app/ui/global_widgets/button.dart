import 'package:flutter/material.dart';

class RegularButton extends StatelessWidget {
  const RegularButton({
    Key? key,
    this.onTap,
    required this.text,
  }) : super(key: key);
  final void Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 60),
      child: Hero(
        tag: 'button_$text',
        child: Card(
          elevation: 0,
          color: Colors.transparent,
          margin: EdgeInsets.zero,
          child: Material(
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              onTap: onTap,
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Text(text)),
            ),
          ),
        ),
      ),
    );
  }
}
