import 'package:flutter/material.dart';
import 'package:flutter_rxdart/domain/entities/random_user.dart';
import 'package:flutter_rxdart/injection_container.dart';
import 'package:flutter_rxdart/presentation/bloc/get_user_bloc.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  void initState() {
    super.initState();
    sl<GetUserBloc>().getUserHandler();
  }

  @override
  void dispose() {
    super.dispose();
    sl<GetUserBloc>().dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
            stream: sl<GetUserBloc>().subject.stream,
            builder: (context, AsyncSnapshot<RandomUser> snapshot) {
              if (snapshot.hasData) {
                final randomUser = snapshot.data!;

                if (randomUser == RandomUser.empty(randomUser.error)) {
                  return _buildError(context, randomUser);
                }
                return _buildSuccess(snapshot);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }

  LayoutBuilder _buildSuccess(AsyncSnapshot<RandomUser> snapshot) {
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

  Center _buildError(BuildContext context, RandomUser randomUser) {
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
