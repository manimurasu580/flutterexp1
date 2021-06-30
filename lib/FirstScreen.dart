import 'package:flutter/material.dart';
import 'package:flutterexp1/search_data.dart';
import 'package:flutterexp1/user.dart';
import 'package:flutterexp1/user_data.dart';

class FirstScreen extends StatefulWidget {
  @override
  FirstScreenState createState() => FirstScreenState();
}

class FirstScreenState extends State<FirstScreen> {
  late List<User> users;
  String query = '';

  @override
  void initState() {
    super.initState();
    users = userData;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreenAccent,
          title: Text('User Info'),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            buildSearch(),
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];

                  return buildUser(user);
                },
              ),
            ),
          ],
        ),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Enter the word you are lookin\' for',
        onChanged: searchUser,
      );

  Widget buildUser(User user) => Card(
        child: ListTile(
          leading: Image.asset(
            user.assetImage,
            fit: BoxFit.cover,
            width: 50,
            height: 50,
          ),
          title: Text('${user.name}' " " "is" " " '${user.age}' "years old"),
          subtitle: Text("Expertised in" " " '${user.skill}'),
        ),
        elevation: 10,
        shadowColor: Colors.limeAccent,
      );

  void searchUser(String query) {
    //method to search users
    final users = userData.where((user) {
      final nameLower = user.name.toLowerCase();
      final skillLower = user.skill.toLowerCase();
      final searchLower = query.toLowerCase();
      final ageInt = user.age.toString();
      final searchAgeInt = query.toString();

      return nameLower.contains(searchLower) ||
          skillLower.contains(searchLower) ||
          ageInt.contains(searchAgeInt);
    }).toList();

    setState(() {
      this.query = query;
      this.users = users;
    });
  }
}
