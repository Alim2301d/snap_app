import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:snap_app/screens/login.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late int counter = 0;
  Random rnd = Random();
   String saying="";
  List<String> sayings = [
    "#Markhor🦌",
    "#MeTheLoneWolf🐺",
    "#thuglife☠️👽⚔️🔪⛓",
    "#nothingbox🙇🤷🏽‍♂️🕸🎁",
    "#hakunamatata🐅",
    "#maulahjat🏋🏾‍⚔",
    "#deadman💀⚰️",
    "#deadwillriseagain⚔",
    "#istandalone👑",
    "#istandaloneforjustic🐅☘️",
    "#nøfate⚓️🚀⚰️",
    "#bornfreeandwild👅💪",
    "#bornfreeandlivefree🐅🐆🐈",
    "#brutaltactician🎖",
    "#holysinner🕊",
    "#devilhunter😇",
    "#khalaimakhlooq👻☠️😈🦅👽",
    "#aakhrichittan👻🚶🏽‍♂️🦁🐆🐅🌊🧗🏼‍♂️🥇🎖🏆🗻",
    "#KoiJalGiaKisiNayDuaDi👤🔥🎃☠️🤯😇🙏📦",
    "#ZakhmiDillJallaDon🤦🏻‍♂️🤕🔥💔👿☠️👻",
    "#WhatHappensToTheSoulsWhoLookInTheEyesOfDragon🦖🐉☃️🌊⛈💥🔥🌪🐲☠️👻"
  ];

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadingStatus();
    Timer(const Duration(seconds: 10), ()=>Navigator
    .pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 10,
              margin: const EdgeInsets.all(10),
              color: Colors.orange.withOpacity(0.7),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(height: 10,),
                    Text('Loading $counter'),
                    Text(saying),
                    const Text("App powered by Ali",),
                  ],
                ),
                ),
            )
          ],
        ),
      ),
    );
  }



  void loadingStatus(){
    Future.delayed(const Duration(seconds: 1)).then((_){
      setState(() {
        counter+=10;
        saying = sayings[rnd.nextInt(18)];
      });
      loadingStatus();
    });
  }



}

