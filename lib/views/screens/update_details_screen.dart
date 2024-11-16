import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_app/blocs/list_bloc/list_bloc.dart';
import 'package:form_app/blocs/list_bloc/list_event.dart';
import 'package:form_app/blocs/update_bloc/update_bloc.dart';
import 'package:form_app/blocs/update_bloc/update_event.dart';
import 'package:form_app/blocs/update_bloc/update_state.dart';
import 'package:form_app/data/models/user_model.dart';

class UpdateDetailsScreen extends StatelessWidget {
  final User user;

  const UpdateDetailsScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: user.name);
    final ageController = TextEditingController(text: user.age.toString());

    return BlocListener<UpdateBloc, UpdateState>(
      listener: (context, state) {
        if (state is UpdateSuccessState) {
          // Trigger list update in ListBloc
          debugPrint('===> User updated successfully');
          BlocProvider.of<ListBloc>(context).add(FetchUsersEvent());

          // Pop the screen
          Navigator.pop(context);
        } else if (state is UpdateFailureState) {
          // Handle failure case
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to update: ${state.error}')),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text("Update User")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Name', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Enter your Name",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey[400]!),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey[400]!),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text('Age', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              TextField(
                controller: ageController,
                decoration: InputDecoration(
                  hintText: "Enter your Age",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey[400]!),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey[400]!),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomSheet: GestureDetector(
          onTap: () {
            final updatedUser = user.copyWith(
              name: nameController.text,
              age: int.parse(ageController.text),
            );
            BlocProvider.of<UpdateBloc>(context)
                .add(SubmitUpdateEvent(updatedUser: updatedUser));
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 30, left: 12, right: 12),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.pink,
            ),
            child: const Center(
              child: Text(
                "Submit",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
