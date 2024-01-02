import 'package:flutter/material.dart';
import 'package:lab45/CocktailScreen.dart';

class CocktailsType extends StatelessWidget {
  final int countOfCocktail;
  final Function(int) onCocktailCountChanged;

  CocktailsType({
    required this.countOfCocktail,
    required this.onCocktailCountChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () async {
            
          },
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            foregroundColor: Colors.white,
            backgroundColor: const Color.fromARGB(255, 51, 39, 71),
            fixedSize: Size(120, 45),
          ),
          child: const Text(
            'Promotion',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
