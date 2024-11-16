import 'package:flutter/material.dart';

import '../models/user_model.dart';

class UserRepository {
  final List<User> _users = [
    User(
      id: '0',
      name: 'Ajeet Kumar Sah',
      age: 28,
    ),
    User(
      id: '1',
      name: 'Ajay',
      age: 28,
      children: [
        User(
          id: '2',
          name: 'Anish',
          age: 28,
        ),
        User(
          id: '3',
          name: 'Manish',
          age: 28,
          children: [
            User(
              id: '4',
              name: 'Ankur',
              age: 28,
            ),
            User(
              id: '5',
              name: 'Ritesh',
              age: 28,
              children: [
                User(
                  id: '6',
                  name: 'Aniket',
                  age: 28,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ];

  List<User> getUsers() {
    return _users;
  }

  void updateUser(String id, User updatedUser) {
    void updateUserInList(List<User> list) {
      for (int i = 0; i < list.length; i++) {
        if (list[i].id == id) {
          list[i] = updatedUser;
          return;
        } else {
          updateUserInList(list[i].children);
        }
      }
    }

    updateUserInList(_users);
    debugPrint("Updated user list: $_users"); // Debugging log
  }

  void addUser(User user) {
    _users.add(user);
  }
}
