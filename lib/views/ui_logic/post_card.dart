import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sayhi/model/user.dart';
import 'package:sayhi/views/state_management/user_provide.dart';
import 'package:sayhi/views/ui_logic/like_animation.dart';

class PostCard extends StatelessWidget {
  final snap;
  const PostCard({Key? key,required this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvide>(context).getUser;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 5, bottom: 5, left: 20),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(
                    snap['profImage']
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snap['username'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          child: ListView(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            shrinkWrap: true,
                            children: ['Delete']
                                .map(
                                  (e) => GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 15),
                                      child: Text(e),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.more_vert_outlined))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(
              child: AspectRatio(
                aspectRatio: 3 / 4,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          image: NetworkImage(
                            snap['postUrl']
                          ),
                          fit: BoxFit.fitHeight,
                          filterQuality: FilterQuality.low,
                          alignment: FractionalOffset.topCenter)),
                ),
              ),
            ),
          ),
          Row(
            children: [
              LikeAnimation(
                isAnimated: snap['likes'].contains,
                child: IconButton(
                    onPressed: () {},
                    icon: const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(Icons.favorite_border,color: Colors.red,))),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(Icons.comment_outlined))),
              IconButton(
                  onPressed: () {},
                  icon: const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(Icons.share_outlined)))
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'likes ${snap['likes'].length}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Comments 12',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        DateFormat.yMMMd().format(snap['datePublished'].toDate()),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )),
                  RichText(
                    //textAlign: TextAlign.end,
                    text: TextSpan(
                      style: TextStyle(fontFamily: GoogleFonts.varelaRound().fontFamily),
                      children:  [
                        TextSpan(
                            text: 'Description: ',
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 14,color: Colors.grey.shade900)),
                        TextSpan(text: snap['description'],
                            style: TextStyle( fontSize: 12,color: Colors.grey.shade800)
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
