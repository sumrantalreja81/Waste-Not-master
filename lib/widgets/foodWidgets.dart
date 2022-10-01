import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageDisplay extends StatelessWidget {
  const ImageDisplay(
      {Key? key, required this.height, required this.width, required this.link})
      : super(key: key);

  final double height;
  final double width;
  final String link;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: Material(
        elevation: 20,
        child: Image.network(
          link,
          height: height * 0.35,
          width: width,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}



class Button extends StatefulWidget {
  Button({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;
  Color color = Colors.green;
  String buttonText = 'Send Request';
  Color buttonTextColor = Colors.white;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ,
      height: widget.height * 0.052,
      //add a top margin of height * 0.02
      margin: EdgeInsets.only(top: widget.height * 0.01),
      child: ElevatedButton(onPressed: ()=>{
        //Change button color to Red
        setState(() {
          //change button color to red
          widget.color = const Color(0xffF1C5D6);
          //change button text to 'Requested'
          widget.buttonText = 'Requested';
          widget.buttonTextColor = Colors.black;
        })
      },
      style: ElevatedButton.styleFrom(
        primary: widget.color,
        shape:  RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(13.0)
        ),
      ), child:  Text(widget.buttonText, 
      
      style: TextStyle(
        fontSize: widget.height * 0.02,
        fontWeight: FontWeight.w600,
        color: widget.buttonTextColor,

      ),
      ),
      ),
    );
  }
}


class AddOn extends StatelessWidget {
  const AddOn({
    Key? key,
    required this.width,
    required this.height, required this.addOn,
  }) : super(key: key);

  final double width;
  final double height;
  final List<String> addOn;
    ClipRRect addOnFood(List<String> addOn, int i, double height, double width) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        addOn[i],
        height: height * 0.125,
        width: width * 0.36,
        fit: BoxFit.fill,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: width * 0.047, top: height * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Also Add',
              style: TextStyle(
                fontSize: height * 0.023,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(
            height: height * 0.0125,
          ),
          CarouselSlider(
            items: [
              for (var i = 0; i < addOn.length; i++)
                addOnFood(addOn, i, height, width),
            ],
            options: CarouselOptions(
              height: height * 0.125,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              viewportFraction: 0.47,
              enableInfiniteScroll: false
            ),
          )
        ],
      ),
    );
  }
}

class NameContainer extends StatelessWidget {
  const NameContainer({
    Key? key,
    required this.width,
    required this.height,
    required this.foodName,
    required this.foodDescription,
    required this.foodLocation,
    required this.foodRating,
    required this.foodServes
  }) : super(key: key);

  final double width;
  final double height;
  final String foodName;
  final String foodDescription;
  final String foodLocation;
  final int foodServes;
  final double foodRating;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: width,
        height: height * 0.14,
        padding: EdgeInsets.all(width * 0.01875),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(foodName.split(' ').first,
                
                    style: TextStyle(
                      
                        fontSize: height * 0.03, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: height * 0.01,
                ),
                Text(
                  '$foodServes serves',
                  // make the style grey and slightly smaller
                  style: TextStyle(
                    fontSize: height * 0.02,
                    color: const Color(0xff7C7C7C),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: height * 0.02,
                    ),
                    Text(foodLocation,
                        style: TextStyle(
                            fontSize: height * 0.017,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star_border,
                      size: height * 0.025,
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    Text(
foodRating.ceil().toString(),
                      //make it bold

                      style:  TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: height*0.02,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FoodDetails extends StatelessWidget {
  const FoodDetails({
    Key? key,
    required this.height,
    required this.des,
  }) : super(key: key);

  final double height;
  final String des;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.all(height * 0.01875),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                "Food Details",
                style: TextStyle(
                    fontSize: height * 0.02, fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                size: height * 0.03,
              ),
            ]),
            SizedBox(
              height: height * 0.01,
            ),
            Text(
              des,
              style: const TextStyle(height: 1.5),
            )
          ],
        ),
      ),
    );
  }
}

