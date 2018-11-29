import 'package:flutter/material.dart';
import 'package:flutter_app/Planet.dart';
import 'package:flutter_app/PlanetRow.dart';
import 'package:flutter_app/TextStyle.dart';

class DetailPage extends StatelessWidget{

  final Planet planet;

  DetailPage(this.planet);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        constraints: new BoxConstraints.expand(),
        color: new Color(0xFF736AB7),
        child: new Stack(
          children: <Widget>[
            _getBackground(),
            _getGradient(),
            _getContent(),
            _getToolbar(context)
          ],
        )
      )
    );
  }

  Container _getBackground(){
    return new Container(
      child: new Image.network(planet.picture,
        fit: BoxFit.cover,
        height: 300.0,
      ),
      constraints: new BoxConstraints.expand(height: 300.0),
    );
  }

  Widget _getContent(){
//    return new Column(
//      children: <Widget>[
//        new Text(planet.name),
//        new Hero(tag: "planet-hero-${planet.id}", child: new Image.asset(planet.image,height: 96.0,width: 96.0,))
//      ],
//    );
    return ListView(
      padding: new EdgeInsets.fromLTRB(0, 72.0, 0, 32.0),
      children: <Widget>[
        new PlanetRow(planet,horizontal: false),
        new Container(
          padding: new EdgeInsets.symmetric(horizontal: 32.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text("OverView".toUpperCase(),style: Style.headerTextStyle),
              new Container(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                height: 2.0,
                width: 18.0,
                color: new Color(0xff00c6ff),
              ),
              new Text(planet.description,style: Style.subHeaderTextStyle)
            ],
          ),
        )
      ],
    );
  }

  Container _getGradient(){
    return new Container(
      margin: new EdgeInsets.only(top: 190.0),
      height: 110.0,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
            colors: <Color>[
              new Color(0x00736AB7),
              new Color(0xFF736AB7)
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.0, 1.0),
            stops: [0.0,0.9],
        )
      ),
    );
  }

  Container _getToolbar(BuildContext context){
    return new Container(
      margin: new EdgeInsets.only(top:MediaQuery.of(context).padding.top),
      child: new BackButton(color: Colors.white,),
    );
  }
}