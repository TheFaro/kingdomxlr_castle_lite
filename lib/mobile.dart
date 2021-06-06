import 'package:flutter/material.dart';
import 'dart:html' as html;

class Mobile extends StatefulWidget{
  @override
  MobileState createState() => new MobileState();
}

class MobileState extends State<Mobile>{
  @override
  Widget build(BuildContext context){
    return Theme(
      data: Theme.of(context).copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      child: Builder(
        builder: (context) => Scaffold(
          body: SafeArea(
            child: Stack(
              children:[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/unlock_mobile.jpg'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                Positioned.fill(
                  bottom: MediaQuery.of(context).size.height * 0.15,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () =>  html.window.open('https://drive.google.com/file/d/1u3WfSCl_nkLyAe0t7iGj6IHCzpRw_5y_/view?usp=sharing', '_self'),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.14,
                            height: MediaQuery.of(context).size.width * 0.14,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle
                            ),
                            child: Image.asset('assets/images/download_new.png'),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text(
                            'Lution - Cold As Ice (ft Kena & YOU)[Prod. Tantu].mp3',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  right: MediaQuery.of(context).size.width * 0.25,
                  top: 10,
                  child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 27.0,
                          height: 27.0,
                          child: MaterialButton(
                            child: Image.asset('assets/icons/facebook.png'),
                            onPressed: () => html.window.open('https://www.facebook.com/PsychoLution', '_blank'),
                            shape: CircleBorder(),
                            color: Colors.transparent,
                            padding: const EdgeInsets.all(5.0),
                            elevation: 5,
                          ),
                        ),
                        SizedBox(width: 15.0),
                        Container(
                          width: 27.0,
                          height: 27.0,
                          child: MaterialButton(
                            child: Image.asset('assets/icons/instagram.png'),
                            onPressed: () => html.window.open('https://instagram.com/lution_xlr?utm_medium=copy_link', '_blank'),
                            shape: CircleBorder(),
                            color: Colors.transparent,
                            padding: const EdgeInsets.all(5.0),
                            elevation: 5,
                          ),
                        ),
                        SizedBox(width: 15.0),
                        Container(
                          width: 27.0,
                          height: 27.0,
                          child: MaterialButton(
                            child: Image.asset('assets/icons/twitter.png'),
                            onPressed: () => html.window.open('https://mobile.twitter.com/lution_xlr', '_blank'),
                            shape: CircleBorder(),
                            color: Colors.transparent,
                            padding: const EdgeInsets.all(5.0),
                            elevation: 5,
                          ),
                        ),
                        SizedBox(width: 15.0),
                        Container(
                          width: 27.0,
                          height: 27.0,
                          child: MaterialButton(
                            child: Image.asset('assets/icons/youtube.png'),
                            onPressed: () => html.window.open('https://www.youtube.com/channel/UCjQW_fSS6JItpE1Q8VE7N9Q', '_blank'),
                            shape: CircleBorder(),
                            color: Colors.transparent,
                            padding: const EdgeInsets.all(5.0),
                            elevation: 5,
                          ),
                        ),
                      ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}