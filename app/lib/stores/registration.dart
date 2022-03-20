import 'package:hooks_riverpod/hooks_riverpod.dart';

final registrationProvider = StateNotifierProvider((_) => RegistrationState());

class RegistrationState extends StateNotifier<Registration> {
  RegistrationState() : super(const Registration());

  void update(Registration value) {
    state = value;
  }

  void copyWith({
    String? username,
    String? password,
    String? confirmPassword,
    String? email,
    String? alias,
    String? name,
  }) {
    state = state.copyWith(
      username: username ?? state.username,
      password: password ?? state.password,
      confirmPassword: confirmPassword ?? state.confirmPassword,
      email: email ?? state.email,
      alias: alias ?? state.alias,
      name: name ?? state.name,
    );
  }

  void reset() {
    state = const Registration();
  }
}

class Registration {
  const Registration({
    this.username = '',
    this.password = '',
    this.confirmPassword = '',
    this.email = '',
    this.alias = '',
    this.name = '',
  });

  final String username;
  final String password;
  final String confirmPassword;
  final String email;
  final String alias;
  final String name;

  Registration copyWith({
    String? username,
    String? password,
    String? confirmPassword,
    String? email,
    String? alias,
    String? name,
  }) =>
      Registration(
        username: username ?? this.username,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        email: email ?? this.email,
        alias: alias ?? this.alias,
        name: name ?? this.name,
      );
}
