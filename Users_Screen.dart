import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:udemy_flutter/models/user/user_model.dart';


class UsersScreen extends StatelessWidget {

  List<UserModel> users = [
    UserModel(
        id: 1,
        name: 'Naira Hassan',
        phone: '01154775690',
    ),
    UserModel(
      id: 2,
      name: 'Ali Hassan',
      phone: '01112806581',
    ),
    UserModel(
      id: 3,
      name: 'Ziad Hassan',
      phone: '01155768640',
    ),
    UserModel(
      id: 4,
      name: 'Hassan Marouf',
      phone: '01119703484',
    ),
    UserModel(
      id: 5,
      name: 'Entsar Ezz',
      phone: '01120184112',
    ),
    UserModel(
      id: 6,
      name: 'Bassant Mohamed',
      phone: '01118612982',
    ),
    UserModel(
      id: 1,
      name: 'Naira Hassan',
      phone: '01154775690',
    ),
    UserModel(
      id: 2,
      name: 'Ali Hassan',
      phone: '01112806581',
    ),
    UserModel(
      id: 3,
      name: 'Ziad Hassan',
      phone: '01155768640',
    ),
    UserModel(
      id: 4,
      name: 'Hassan Marouf',
      phone: '01119703484',
    ),
    UserModel(
      id: 5,
      name: 'Entsar Ezz',
      phone: '01120184112',
    ),
    UserModel(
      id: 6,
      name: 'Bassant Mohamed',
      phone: '01118612982',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users'
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context, Index) => buildUsersItem(users[Index]),
          separatorBuilder: (context, Index) => Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
          itemCount: users.length,
      ),
    );
  }

  Widget buildUsersItem(UserModel user) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 25.0,
          child: Text(
            '${user.id}',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${user.name}',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${user.phone}',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
