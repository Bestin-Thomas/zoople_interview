import 'package:bestin_interview/model/User.dart';
import 'package:bestin_interview/services/api_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<User> users = [];
  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      final userList = await apiService.getUsers();
      setState(() {
        users = userList;
      });
    } catch (e) {
      // Handle error
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double paddingHeight = MediaQuery.of(context).padding.vertical;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                const Text(
                  'Hello ReqRes users!',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
            SizedBox(height: 24,),
            Wrap(
              alignment: WrapAlignment.center,
              direction: Axis.horizontal,
              children: List.generate(
                users.length,
                    (index) => UserCard(
                      name: users[index].firstName,
                      email: users[index].email,
                      imgUrl: users[index].avatar,
                    ),
              ),
            ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(onPressed: (){}, child: Text('Open Sandbox')),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final String name;
  final String email;
  final String imgUrl;

  const UserCard(
      {
      required this.name,
      required this.email,
      required this.imgUrl
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8,),
          Text(
            email,
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 8,),
          Image.network(
            imgUrl,
          ),
        ],
      ),
    );
  }
}
