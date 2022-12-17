import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('the First Page'),
      ),
      body: Column(
        children: const [Post(), LikeButton()],
      ),
    );
  }
}

class Post extends StatelessWidget {
  const Post({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network('https://fileinfo.com/img/ss/md/png_79.png');
  }
}

class LikeButton extends StatefulWidget {
  const LikeButton({Key? key}) : super(key: key);

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isLiked = !isLiked;
        setState(() {});
      },
      child: Container(
        height: 100,
        width: 100,
        child: Icon(
            isLiked?Icons.thumb_up:Icons.thumb_up_alt_outlined,
          color: isLiked?Colors.red:Colors.grey,
        )
      ),
    );
  }
}
