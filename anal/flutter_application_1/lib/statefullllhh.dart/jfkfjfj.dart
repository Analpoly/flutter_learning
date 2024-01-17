import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: disk(),
  ));
}

class disk extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _diskState();
  }
}

class _diskState extends State<disk> {
  var _formkey = GlobalKey<FormState>();

  List<String> _currencies = ["gender", "male", "female", "others"];
  String _value12 = "gender";

  var _minimumPadding = 5;
  void resetDropdown() {
    setState(() {
      _value12 = 'gender';
    });
  }

  TextEditingController abc = TextEditingController();
  TextEditingController cnt = TextEditingController();
  TextEditingController jkg = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Exercise"),
          backgroundColor: Colors.blue,
        ),
        body: Form(
          key: _formkey,
          child: ListView(
            padding: EdgeInsets.all(10),
            children: <Widget>[
              yoyo(),
              Padding(
                  padding: EdgeInsets.all(3),
                  child: TextFormField(
                    controller: abc,
                    onChanged: (value) => {setState(() {})},
                    decoration: InputDecoration(
                        labelText: "Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter your name";
                      } else if (int.tryParse(value) != null) {
                        return 'characters only';
                      }
                      return null;
                    },
                  )),
              Padding(
                  padding: EdgeInsets.all(3),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter your phone number";
                      } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                        return 'Invalid mobile number (should contain 10 digits)';
                      }
                      return null;
                    },
                    maxLength: 10,
                    controller: cnt,
                    onChanged: (value) => {setState(() {})},
                    decoration: InputDecoration(
                        labelText: "phone number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                  )),
              Row(
                children: <Widget>[
                  Expanded(
                      child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your pincode';
                      } else if (!RegExp(r'^[0-9]{6}$').hasMatch(value)) {
                        return 'Invalid pin code (should contain 6 numbers)';
                      }
                      return null;
                    },
                    maxLength: 6,
                    controller: jkg,
                    onChanged: (value) => {setState(() {})},
                    decoration: InputDecoration(
                        labelText: "pincode",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
                  Container(width: _minimumPadding * 5),
                  Expanded(
                      child: DropdownButton<String>(
                    value: _value12,
                    items: _currencies.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _value12 = value!;
                      });
                    },
                  ))
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _calculate,
                      child: Text('Register'),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      child: Text("reset"),
                      onPressed: () {    
                   
                      abc.clear();
                        cnt.clear();
                        jkg.clear();
                        resetDropdown();
                      },))])])));
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

  void _calculate() {
    if (_formkey.currentState?.validate() ?? false) {
      // Perform registration logic here
      String name = abc.text;
      String mobileNumber = cnt.text;
      String pincode = jkg.text;

      // Check if gender is selected
      if (_value12! == "gender") {
        // Show error message or handle the case where gender is not selected
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please select a gender!'),
            duration: Duration(seconds: 2),
          ),
        );
        return; // Do not proceed with registration
      }

      // Proceed with registration
      print('Name: $name');
      print('Mobile Number: $mobileNumber');
      print('Pincode: $pincode');
      print('Gender: $_value12');

      // Show SnackBar on successful registration
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registration successful!'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
