import 'package:flutter/material.dart';
import 'package:flutter_rxdart/domain/entities/random_user.dart';

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({required this.randomUser, super.key});

  final RandomUser randomUser;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.redAccent.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15)),
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: const Center(child: Text('Error')))),
        Card(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            randomUser.error!,
          ),
        )),
      ],
    ));
  }
}
