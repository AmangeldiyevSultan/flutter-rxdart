import 'package:flutter_rxdart/domain/entities/random_user.dart';
import 'package:flutter_rxdart/domain/use_case/get_user.dart';
import 'package:rxdart/subjects.dart';

class GetUserBloc {
  const GetUserBloc({
    required GetUser getUser,
    required BehaviorSubject<RandomUser> subject,
  })  : _getUser = getUser,
        _subject = subject;

  final GetUser _getUser;
  final BehaviorSubject<RandomUser> _subject;

  Future<void> getUserHandler() async {
    final result = await _getUser();
    result.fold(
      (error) => _subject.sink.add(RandomUser.empty(error.toString())),
      (user) => _subject.sink.add(user),
    );
  }

  BehaviorSubject<RandomUser> get subject => _subject;

  void dispose() async {
    await _subject.drain();
    _subject.close();
  }
}
