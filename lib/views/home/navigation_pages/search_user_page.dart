import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchUser extends StatefulWidget {
  const SearchUser({Key? key}) : super(key: key);

  @override
  State<SearchUser> createState() => _SearchUserState();
}

class _SearchUserState extends State<SearchUser> {
  final searchController = TextEditingController();
  bool isShowUser = false;

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: TextFormField(
              controller: searchController,
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: const InputDecoration(
                  labelText: 'Search Something!',
                  labelStyle: TextStyle(color: Colors.white)),
              onFieldSubmitted: (String _) {
                setState(() {
                  isShowUser = true;
                });
              }),
        ),
        body: isShowUser ? FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('users')
              .where('username',
              isGreaterThanOrEqualTo: searchController.text)
              .get(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          (snapshot.data!.docs[index]['photoUrl'])),
                    ),
                    title: Text(snapshot.data!.docs[index]['username']));
              },
            );
          },
        ):Center(child: Text('Posts',style: TextStyle(color: Colors.blue),)),
      ),
    );
  }
}
