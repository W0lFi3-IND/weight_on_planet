import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  int radioValue = 0;
  double fs = 0.0;
  String f;
  final TextEditingController weightController = new TextEditingController();
  void handleRadioValueChanged(int value){
  setState(() {
    radioValue = value;
    switch(value){
      case 0:
        fs = cal(weightController.text,0.06);
        f = "Your Weight on Pluto is ${fs.toStringAsFixed(1)}";;break;
      case 1:
        f= "Your Weight on Mars is ${fs.toStringAsFixed(1)}";
        fs = cal(weightController.text,0.38);break;
      case 2:
        fs = cal(weightController.text,0.91);
        f= "Your Weight on Venus is ${fs.toStringAsFixed(1)}";
    }
  });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weight on planet"),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: "Your Weight on Earth",
                        hintText: "In Kgs",
                        icon: new Icon(Icons.person)
                    ),
                  ),
                  new Padding(padding: new EdgeInsets.all(5.0)),

                  new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Radio<int>(
                          activeColor: Colors.brown,
                            value: 0, groupValue: radioValue, onChanged: handleRadioValueChanged),
                        new Text(
                          "Pluto",
                          style: new TextStyle(color: Colors.white30)
                        ),
                        new Radio<int>(
                            activeColor: Colors.red,
                            value: 1, groupValue: radioValue, onChanged: handleRadioValueChanged),
                        new Text(
                            "Mars",
                            style: new TextStyle(color: Colors.white30)
                        ),
                        new Radio<int>(
                            activeColor: Colors.orangeAccent,
                            value: 2, groupValue: radioValue, onChanged: handleRadioValueChanged),
                        new Text(
                            "Venus",
                            style: new TextStyle(color: Colors.white30)
                        ),
                      ],
                  ),
                  new Padding(padding: new EdgeInsets.all(16)),
                  new Text(
                    weightController.text.isEmpty ? " Enter Weight " : "$f"
                    ,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double cal(String w, double m) {
    if(int.parse(w).toString().isNotEmpty && int.parse(w) > 0)
      { return int.parse(w)*m;

      }
      else{
        return int.parse("180")*0.38;
    }
  }
}