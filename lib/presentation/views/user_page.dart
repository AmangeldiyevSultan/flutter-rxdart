import 'package:flutter/material.dart';
import 'package:flutter_rxdart/domain/entities/random_user.dart';
import 'package:flutter_rxdart/injection_container.dart';
import 'package:flutter_rxdart/presentation/bloc/get_user_bloc.dart';
import 'package:flutter_rxdart/presentation/widget/success_widget.dart';

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
                  return ErrorWidget(randomUser);
                }
                return SuccessWidget(
                  snapshot: snapshot,
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
