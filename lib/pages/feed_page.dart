import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import '../model/post_model.dart';
import '../model/story_model.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final List<Story> _stories = [
    Story(
      'assets/images/user_1.jpeg',
      'monica',
    ),
    Story(
      'assets/images/user_2.jpeg',
      'alikhan',
    ),
    Story(
      'assets/images/user_3.jpeg',
      'littos',
    ),
    Story(
      'assets/images/user_1.jpeg',
      'monica',
    ),
    Story(
      'assets/images/user_2.jpeg',
      'alikhan',
    ),
    Story(
      'assets/images/user_3.jpeg',
      'littos',
    ),
  ];

  final List<Post> _posts = [
    Post('assets/images/user_1.jpeg', 'Monica', 'assets/images/feed_1.jpeg',
        "Sometime too hot the eye of heaven shines and often is his gold complexion dimmed,"),
    Post('assets/images/user_2.jpeg', 'Alikhan', 'assets/images/feed_2.jpeg',
        "Sometime too hot the eye of heaven shines and often is his gold complexion dimmed,"),
    Post('assets/images/user_3.jpeg', 'Littos', 'assets/images/feed_3.jpeg',
        "Sometime too hot the eye of heaven shines and often is his gold complexion dimmed,")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Divider(),
                // stories and watch all
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Stories',
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Jost',
                            fontSize: 16),
                      ),
                      Text(
                        'Watch All',
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Jost',
                            fontSize: 15),
                      )
                    ],
                  ),
                ),

                // #storyList
                Container(
                  color: Colors.black,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: 110,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: _stories.map((story) {
                      return _itemOfStory(story);
                    }).toList(),
                  ),
                ),

                // #postList
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _posts.length,
                    itemBuilder: (ctx, i){
                      return _itemOfPost(_posts[i]);
                    },
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

  Widget _itemOfStory(Story story) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            border: Border.all(width: 3, color: Colors.purple),
          ),
          child: Container(
            padding: const EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image(
                image: AssetImage(story.image),
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          story.name,
          style: const TextStyle(
              color: Colors.grey, fontFamily: 'Jost', fontSize: 14),
        )
      ],
    );
  }

  Widget _itemOfPost(Post post){
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          //header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image(
                        image: AssetImage(post.userImage),
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover ,
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Text(post.userName, style: const TextStyle(color: Colors.grey, fontSize: 15, fontFamily: "Jost"),)
                  ],
                ),
                IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.more_horiz, color: Colors.grey, size: 30,)
                )
              ],
            ),
          ),

          FadeInImage(
            image: AssetImage(post.postImage),
            placeholder: const AssetImage('assets/images/placeholder.png'),
            width: MediaQuery.of(context).size.width,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(EvaIcons.heartOutline, color: Colors.grey,),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(FeatherIcons.messageCircle, color: Colors.grey,),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(FeatherIcons.send, color: Colors.grey,),
                  ),
                ],
              ),
              IconButton(
                  onPressed: (){},
                  icon: const Icon(FeatherIcons.bookmark, color: Colors.grey,)
              )
            ],
          ),

          // #tags
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 14),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: const TextSpan(
                children: [
                  TextSpan(
                    text:   'Liked by ',
                    style: TextStyle(color: Colors.grey, fontFamily: 'Jost', fontSize: 16)
                  ),
                  TextSpan(
                      text:   'akhrorov, ',
                      style: TextStyle(color: Colors.white, fontFamily: 'Jost', fontWeight: FontWeight.bold, fontSize: 16)
                  ),
                  TextSpan(
                      text:   'monica ',
                      style: TextStyle(color: Colors.white, fontFamily: 'Jost', fontSize: 16, fontWeight: FontWeight.bold)
                  ),
                  TextSpan(
                      text:   'and ',
                      style: TextStyle(color: Colors.grey, fontFamily: 'Jost', fontSize: 16)
                  ),
                  TextSpan(
                      text:   '1,234  others',
                      style: TextStyle(color: Colors.grey, fontFamily: 'Jost', fontSize: 16, fontWeight: FontWeight.bold)
                  ),
                ]
              ),
            ),
          ),

          // #caption
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            width: MediaQuery.of(context).size.width,
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${post.userName} ',
                    style: const TextStyle(color: Colors.white, fontFamily: 'Jost', fontSize: 17, fontWeight: FontWeight.bold)
                  ),
                  TextSpan(
                      text: '${post.caption} ',
                      style: const TextStyle(color: Colors.white70, fontFamily: 'Jost', fontSize: 17)
                  )
                ]
              ),
            ),
          ),

          // #postDate
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 14),
            alignment: Alignment.topLeft,
            child: const Text('February 2022', style:  TextStyle(color: Colors.grey, fontFamily: 'Jost'),),
          )
        ],
      ),
    );
  }
}
