import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../util/foods.dart';
import '../core/slider_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                TextButton(
                    child: Text(
                      "View More",
                      style: TextStyle(
//                      fontSize: 22,
//                      fontWeight: FontWeight.w800,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    //TODO -- View More
                    onPressed: (){}),
              ],
            ),
            SizedBox(height: 10.0),
            
            CarouselSlider(
              items: map<Widget>(
                foods,
                    (index, i) {
                  Map food = foods[index];
                  return SliderItem(
                    img: food['img'],
                    isFav: false,
                    name: food['name'],
                    rating: 5.0,
                    raters: 23,
                  );
                },
              ).toList(),
              options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 1.0,
              enlargeCenterPage: true,
            ),)
          ],
        ),
      ),
    );
  }
}
