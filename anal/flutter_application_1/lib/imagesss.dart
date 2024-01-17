import 'package:flutter/material.dart';
void main()
{
  runApp(MaterialApp(
    home:Image4(),
  ));
}
class Image4 extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Container(
      padding: EdgeInsets.all(40),
      alignment: Alignment.topCenter,
      child: ReturnImage(),
    );
  }
}

class ReturnImage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    AssetImage assetImage = AssetImage("assets/money.png");
    Image image = Image(image: assetImage);
    return Container(
      child: image,
      height: 160,
      width: 100,
    );
  }
}