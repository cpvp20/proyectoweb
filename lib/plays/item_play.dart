import 'package:flutter/material.dart';
import 'package:proyectoM/models/play.dart';
import 'package:proyectoM/colors.dart';

class ItemPlay extends StatefulWidget {
  final Play play;
  ItemPlay({
    Key key,
    @required this.play,
  }) : super(key: key);

  @override
  _ItemPlayState createState() => _ItemPlayState();
}

class _ItemPlayState extends State<ItemPlay> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(alignment: Alignment.center, children: [
        Container(
          color: secondary,
          padding: const EdgeInsets.all(30.0),
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("${widget.play.title}",
                        style: Theme.of(context).textTheme.headline2),
                    Text(
                      "${widget.play.description.substring(0, 70)}...",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      "averageRating:",
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          .copyWith(fontSize: 18.0),
                    ),
                    Row(
                      children: _averageRatingToStars(
                          widget.play.productaverageRating),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 5.0),
                width: MediaQuery.of(context).size.width * 0.3,
                child: Image.network(
                  widget.play.image,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  List<Widget> _averageRatingToStars(averageRating) {
    List<Widget> stars = [];
    for (var i = 0; i < 5; i++) {
      if (averageRating > 0 && averageRating / 20 > i) {
        stars.add(Icon(Icons.star));
      } else {
        stars.add(Icon(Icons.star_border));
      }
    }
    return stars;
  }
}
