import 'package:flutter/material.dart';
import 'package:flutter_rxdart/domain/entities/random_user.dart';
import 'package:flutter_rxdart/injection_container.dart';
import 'package:flutter_rxdart/presentation/bloc/get_user_bloc.dart';

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({required this.snapshot, super.key});

  final AsyncSnapshot<RandomUser> snapshot;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final randomUser = snapshot.data!;
      return Stack(
        children: [
          ColoredBox(
            color: Theme.of(context).primaryColor.withOpacity(0.4),
            child: SizedBox(
              height: 170,
              width: constraints.maxWidth,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: constraints.maxWidth,
                ),
                CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(
                    randomUser.image,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  '${randomUser.prefixName}. ${randomUser.firstName} ${randomUser.lastName}',
                ),
                Text('Email: ${randomUser.email}',
                    style: const TextStyle(fontSize: 14)),
                Text('Username: ${randomUser.username}',
                    style: const TextStyle(fontSize: 14)),
                Text('phone: ${randomUser.phone}',
                    style: const TextStyle(fontSize: 14)),
                Text('Age: ${randomUser.dob}',
                    style: const TextStyle(fontSize: 14)),
                Text(
                  'Address: ${randomUser.street}',
                  style: const TextStyle(fontSize: 14),
                ),
                Text('Location: ${randomUser.city}, ${randomUser.country}',
                    style: const TextStyle(fontSize: 14)),
                Text('PostCode: ${randomUser.postcode}',
                    style: const TextStyle(fontSize: 14)),
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: ElevatedButton(
                    onPressed: () {
                      sl<GetUserBloc>().getUserHandler();
                    },
                    child: const Text('Other User')),
              ))
        ],
      );
    });
  }
}
