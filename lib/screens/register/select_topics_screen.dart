import 'package:elearningapp/screens/home/home_screen.dart';
import 'package:elearningapp/widgets/default_button.dart';
import 'package:elearningapp/widgets/topic_card.dart';
import 'package:flutter/material.dart';

class SelectTopicsScreen extends StatefulWidget {
  const SelectTopicsScreen({Key? key}) : super(key: key);

  @override
  _SelectTopicsScreenState createState() => _SelectTopicsScreenState();
}

class _SelectTopicsScreenState extends State<SelectTopicsScreen> {
  List<String> _listTopics = [
    'Web dev',
    'Mobile Dev',
    'IA',
    'Blockchain',
    'Security',
    'Network',
    'Gaming',
    'Data science',
    'Algorithms'
  ];
  List<bool> isTopicSelect = List.filled(9, false);
  List<String> _listIconsTopics = [
    'assets/images/web.png',
    'assets/images/mobile.png',
    'assets/images/ia.png',
    'assets/images/blockchain.png',
    'assets/images/security.png',
    'assets/images/network.png',
    'assets/images/gaming.png',
    'assets/images/data_science.png',
    'assets/images/algorithm.png',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: DefaultButton(
        isLoading: false,
        percentage: 0.85,
        textButton: 'Start Learning',
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (builder) => HomeScreen()));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(height: 30),
          Center(
              child: Text('Pick your favorite topic',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold))),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
                margin: EdgeInsets.only(left: 32, right: 32),
                child: Text(
                  'Choose your favorite topic to help us deliver the most suitable course of you',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                  textAlign: TextAlign.center,
                )),
          ),
          const SizedBox(
            height: 30,
          ),
          Wrap(runSpacing: 50, spacing: 50, children: [
            for (int i = 0; i < _listTopics.length; i++)
              InkWell(
                splashColor: Colors.transparent,
                onTap: (){
                  setState(() {
                    isTopicSelect[i]=!isTopicSelect[i];
                  });
                },
                child: TopicCard(
                    isSelected: isTopicSelect[i],
                    topic: _listTopics.elementAt(i),
                    asset: _listIconsTopics.elementAt(i)),
              )
          ])
        ],
      )),
    );
  }
}
