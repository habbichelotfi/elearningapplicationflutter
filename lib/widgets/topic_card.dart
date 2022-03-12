import 'package:elearningapp/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TopicCard extends StatefulWidget {
  final bool isSelected;
  final String asset;
  final String topic;

  const TopicCard(
      {Key? key,
      required this.asset,
      required this.isSelected,
      required this.topic})
      : super(key: key);

  @override
  _TopicCardState createState() => _TopicCardState();
}

class _TopicCardState extends State<TopicCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 70,
        child: Column(children: [
          Stack(
            overflow: Overflow.visible,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: !widget.isSelected
                    ? BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20))
                    : BoxDecoration(
                        border: Border.all(color: primaryColor, width: 2),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                child: Image.asset(
                  widget.asset,
                  width: 30,
                  height: 30,
                ),
              ),
              widget.isSelected?Positioned(
                  left: 50,
                  top: -10,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: primaryColor,

                    ),
                      child: Icon(
                    Icons.done,
                    size: 15,
                    color: Colors.white,
                  ))):SizedBox()
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            widget.topic,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey.shade500, fontSize: 13),
          )
        ]));
  }
}
