import 'package:flutter/material.dart';
import 'package:lab45/home/OrderPage.dart';


class UserOrdersContainer extends StatelessWidget {
  final int countOfCocktail;
  final List<Order> orders; // Добавлен параметр orders

  UserOrdersContainer({required this.countOfCocktail, required this.orders});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OrderPage()),
        );
      },
      child: Container(
        width: 85,
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromARGB(255, 52, 41, 71),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 10,
              child: Container(
                alignment: Alignment.center,
                width: 37,
                height: 37,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(141, 29, 29, 29),
                ),
                child: Text(
                  '$countOfCocktail',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 65,
              child: Text(
                'number',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              child: Text(
                'Total price',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
