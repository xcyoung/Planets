import 'package:flutter/material.dart';
import 'package:flutter_app/Planet.dart';
import 'package:flutter_app/TextStyle.dart';
import 'package:flutter_app/DetailPage.dart';

class PlanetRow extends StatelessWidget{

  final Planet planet;
  final bool horizontal;

  PlanetRow(this.planet,{this.horizontal = true});

  @override
  Widget build(BuildContext context) {
    //星球图片
    final planetThumbnail = new Container(
      margin: new EdgeInsets.symmetric(
        vertical: 16.0,
      ),
      alignment: horizontal?FractionalOffset.centerLeft:FractionalOffset.center,
      child:new Hero(
          tag: "planet-hero-${planet.id}",
          child:  new Image(
            image: new AssetImage(planet.image),
            height: 92.0,
            width: 92.0,
          ),)
    );

    final planetContent = new Container(
      margin: new EdgeInsets.fromLTRB(horizontal?76.0:16.0,horizontal?16.0:42.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: horizontal?CrossAxisAlignment.start:CrossAxisAlignment.center,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(planet.name,
              style: Style.headerTextStyle),
          new Container(height: 10.0),
          new Text(planet.location,
              style: Style.subHeaderTextStyle),
          new Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            height: 2.0,
            width: 18.0,
            color: new Color(0xff00c6ff),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(flex:horizontal?1:0, child: _planetValue(planet.distance, "assets/image/ic_distance.png")),
              new Expanded(flex:horizontal?1:0, child: _planetValue(planet.gravity, "assets/image/ic_gravity.png")),
            ],
          )
        ],
      ),
    );

    final planetCard = new Container(
      height: horizontal?124.0:154.0,
      margin: horizontal
          ? new EdgeInsets.only(left: 46.0)
          :new EdgeInsets.only(top: 72.0),
      decoration: new BoxDecoration(
        color: new Color(0xFF333366),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0)
          )
        ]
      ),
      child: planetContent,
    );

    return new GestureDetector(
      onTap: horizontal? () => Navigator.of(context).push(new PageRouteBuilder(
          pageBuilder: (context,a,b) => new DetailPage(planet),
          transitionsBuilder:(context,animation,secondaryAnimation,child) =>
              new FadeTransition(opacity: animation,child: child,)
      )):null,
      child: new Container(
        margin: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 24.0
        ),
        child: new Stack(
          children: <Widget>[
            planetCard,
            planetThumbnail
          ],
        ),
      ),
    );
  }

  Widget _planetValue(String value,String image){
    return new Row(
      children: <Widget>[
        new Image(
          image: new AssetImage(image),
          height: 12.0,
        ),
        new Container(width: 8.0),
        new Text(value,style: Style.regularTextStyle),
      ],
    );
  }
}