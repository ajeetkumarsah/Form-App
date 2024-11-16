import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_app/blocs/list_bloc/list_event.dart';
import 'package:form_app/data/repositories/user_repository.dart';
import 'package:form_app/views/screens/user_details_screen.dart';
import 'blocs/list_bloc/list_bloc.dart';
import 'blocs/update_bloc/update_bloc.dart';

void main() {
  final userRepository = UserRepository();
  runApp(MyApp(userRepository: userRepository));
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  const MyApp({super.key, required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => ListBloc(userRepository)..add(FetchUsersEvent())),
        BlocProvider(create: (_) => UpdateBloc(userRepository)),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: UserDetailsScreen(),
      ),
    );
  }
}
