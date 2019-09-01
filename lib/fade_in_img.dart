import 'package:flutter/material.dart';

class FadeInImg extends StatefulWidget {
  FadeInImg({Key key, this.imgPath}) : super(key: key);
  final String imgPath;

  @override
  _FadeInImgState createState() => _FadeInImgState();

}

class _FadeInImgState extends State<FadeInImg> {

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 0.5,
      duration: Duration(seconds: 3),
      child: Image.asset('assets/card-img-shadow.png', width: 360),
    );
  }
}
