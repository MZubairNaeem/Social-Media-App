import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sayhi/views/home/navigation_pages/profile_page.dart';

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
        body: isShowUser
            ? FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection('users')
                    .where('username',
                        isGreaterThanOrEqualTo: searchController.text)
                    .get(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(
                              uid: (snapshot.data!.docs[index]['uid']),
                            ),
                          ),
                        ),
                        child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  (snapshot.data!.docs[index]['photoUrl'])),
                            ),
                            title: Text(
                                snapshot.data!.docs[index]['username'])),
                      );
                    },
                  );
                },
              )
            : FutureBuilder(
                future: FirebaseFirestore.instance.collection('posts').get(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.deepOrange,
                      ),
                    );
                  }
                  return Center(child: Text('post'));
                  // return
                  // //   StaggeredGrid.count(
                  // //   crossAxisCount: 4,
                  // //   mainAxisSpacing: 4,
                  // //   crossAxisSpacing: 4,
                  // //   children: [
                  // //     StaggeredGridTile.count(
                  // //       crossAxisCellCount: 2,
                  // //       mainAxisCellCount: 2,
                  // //       child: Tile(index: 0),
                  // //     ),
                  // //   ],
                  // // );
                  // return StaggeredGridView.countBuilder(
                  //   crossAxisCount: 3,
                  //   itemCount: snapshot.data!.docs.length,
                  //   itemBuilder: (context, index) =>
                  //       Image.network(snapshot.data!.docs[index]['photoUrl']),
                  //   staggeredTileBuilder: (index) => StaggeredTile.count(
                  //     (index % 7 == 0) ? 2 : 1,
                  //     (index % 7 == 0) ? 2 : 1,
                  //   ),
                  // );
                },
              ),
      ),
    );
  }
}
