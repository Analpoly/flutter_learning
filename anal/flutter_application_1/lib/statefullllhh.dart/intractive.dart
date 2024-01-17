// import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: disk(),
  ));
}

var _currencies = ["rupees", "pounds", "doller"];
var _minimumPadding = 5.0;
final _controller = TextEditingController();
final _cnt = TextEditingController();
final _hbh = TextEditingController();

class disk extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _diskState();
  }
}

class _diskState extends State<disk> {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        title: Text("Exercise"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        margin: EdgeInsets.all(_minimumPadding * 3),
        child: ListView(
          // padding: EdgeInsets.all(16),
          children: [
            yoyo(),
            Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Name",
                    hintText: "hfgdfs",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0))),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: TextFormField(
                  maxLength: 10,

                  controller: _controller,
                  onChanged: (value) {
                    setState(() {});
                  },

                  decoration: InputDecoration(
                    labelText: "Mobile number",
                    errorText: _errorText,
                    // hintText: "hfgdfs",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                  ),
                  //  validator: (value) {
                  //    if(value!.isEmpty || !)
                  //  },
                )),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: TextFormField(
                       maxLength: 6,   
                      controller: _cnt,
                      onChanged: (value) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                          labelText: "pincode",
                          errorText: _errorText1,
                          // hintText: "time in interest",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    )),
                    Container(width: _minimumPadding * 5),
                    Expanded(
                        child: DropdownButton<String>(
                      items: _currencies.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),

                      value: "rupees",
                      // onTap: () {},

                      // onChanged: (value) {
                      //   setState(() {});
                      // },
                      onChanged: (String? newValueSelected){},
                    ))
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(
                    bottom: _minimumPadding, top: _minimumPadding),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      
                      child: ElevatedButton(
                        
                        child: Text("Register"),
                        onPressed: () {  Scaffold.of(context).showSnackBar(
                          SnackBar(
                          
                            content: Text("hello!")),
                        ),},
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        child: Text("clear all"),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget yoyo() {
    AssetImage assetImage = AssetImage("assets/dojob.jpg");
    Image image = Image(
      image: assetImage,
      width: 190,
      height: 190,
    );

    return Container(
      child: image,
      alignment: Alignment.topCenter,
      margin: EdgeInsets.all(_minimumPadding * 5),
    );
  }

  String? get _errorText {
    final text = _controller.value.text;
    if (text.isEmpty) {
      return "cant be empty";
    } else if (int.tryParse(text.toString()) == null) {
      return "too short";
    }
    return null;
  }

  String? get _errorText1 {
    final text = _cnt.value.text;
    if (text.isEmpty) {
      return "cbh";
    } else if (int.tryParse(text.toString()) == null) {
      return "toofffff";
    }
    return null;
  }
  //  String? get _errorText2
  // {
  //   final text= _hbh.value.text;
  //   if(text.isEmpty)
  //   {
  //     return "cbh";
  //   }
  //   else if(int.tryParse(text.toString())==null)
  //   {
  //     return "toofffff";
  //   }
  //   return null;
  // }
}
