import 'dart:async';

import 'package:nairawallet/blocs/bloc.dart';
import 'package:nairawallet/repositories/create_account_repository.dart';
import 'package:nairawallet/services/api/api_response.dart';

class CreateAccountBloc implements Bloc {
  CreateAccountRepository _createAccountRepository;

  StreamController pageController;
  StreamController usernameError = StreamController<String>();
  StreamController isNameValid = StreamController<ApiResponse<String>>();

  CreateAccountBloc() {
    pageController = StreamController<int>();
    _createAccountRepository = CreateAccountRepository();
    pageController.sink.add(1);
  }

  void validateName(String name) async {

    if (name.trim().length <= 3) {
      isNameValid.sink.add(null);
    } else {
      isNameValid.sink.add(ApiResponse<String>.loading("loading name"));
      await Future.delayed(Duration(seconds: 1));
      if (name == "david") {
        isNameValid.sink
            .add(ApiResponse<String>.error("username already taken"));
      } else {
        isNameValid.sink.add(ApiResponse<String>.completed("good to go"));
      }
    }
  }

  @override
  void dispose() {
    isNameValid.sink.close();
  }
}
