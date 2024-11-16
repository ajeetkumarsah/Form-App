import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_app/blocs/list_bloc/list_bloc.dart';
import 'package:form_app/blocs/list_bloc/list_state.dart';
import 'package:form_app/blocs/update_bloc/update_bloc.dart';
import 'package:form_app/data/models/user_model.dart';
import 'package:form_app/views/screens/update_details_screen.dart';

class UserListWidget extends StatelessWidget {
  final List<User> users;

  const UserListWidget({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListBloc, ListState>(
      builder: (context, state) {
        if (state is UsersLoadedState) {
          return ListView.builder(
            itemCount: state.users.length,
            itemBuilder: (context, index) {
              return _buildUserItem(context, state.users[index]);
            },
          );
        } else if (state is UsersLoadingErrorState) {
          return Center(child: Text('Error: ${state.error}'));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _buildUserItem(BuildContext context, User user) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: ExpansionTile(
        shape: const Border(),
        iconColor: Colors.black54,
        collapsedIconColor: Colors.black54,
        title: Row(
          children: [
            Expanded(child: Text(user.name)),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                      value: BlocProvider.of<UpdateBloc>(context),
                      child: UpdateDetailsScreen(user: user),
                    ),
                  ),
                );
              },
              child: const Icon(Icons.edit_square, size: 20),
            ),
          ],
        ),
        subtitle: Text("${user.age} Years Old",
            style: const TextStyle(color: Colors.grey)),
        children: [
          ...user.children.map((child) => _buildUserItem(context, child)),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
