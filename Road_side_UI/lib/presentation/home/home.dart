import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:road_side/presentation/core/grid_service.dart';
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
                    review_count: 23,
                  );
                },
              ).toList(),
              options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 1.0,
              enlargeCenterPage: true,
            ),),
            SizedBox(height: 20.0),

            GridView.builder(
                shrinkWrap: true,
                primary: false,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.25),
                ),
                itemCount: foods == null ? 0 : foods.length,
                itemBuilder: (BuildContext context, int index){
                  Map food = foods[index];

                  return GridService(
                      name: food['name'],
                      img: food['img'],
                      isFav: false,
                      rating: 5.0,
                      review_count: 67);
            })
          ],
        ),
      ),
    );
  }
}
