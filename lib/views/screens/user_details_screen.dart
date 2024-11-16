import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_app/blocs/list_bloc/list_bloc.dart';
import 'package:form_app/blocs/list_bloc/list_state.dart';
import 'package:form_app/views/widgets/user_list_widget.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Details")),
      body: BlocBuilder<ListBloc, ListState>(
        builder: (context, state) {
          if (state is UsersLoadedState) {
            return UserListWidget(users: state.users);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
