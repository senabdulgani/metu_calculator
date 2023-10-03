import 'package:flutter/material.dart';

class MyDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[300],
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Alt kısım fotoğraf alanı içindir.
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 100,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/images/my_photo.jpg')
                )
            ),
          ),
          Text ("Jeoloji Mühendisliği", style: TextStyle(color: Colors.white, fontSize: 20),),
          //Text ("sen@abdulgani.dev", style: TextStyle (color: Colors.grey [200], fontSize: 14,),),
        ],
      ),
    );


  }
}