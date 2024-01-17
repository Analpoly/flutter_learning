import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Disk(),
  ));
}

class Disk extends StatefulWidget {
  @override
  _DiskState createState() => _DiskState();
}

class _DiskState extends State<Disk> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController abc = TextEditingController();
  final TextEditingController cnt = TextEditingController();
  final TextEditingController jkg = TextEditingController();
  String _value12 = "gender";
  void resetDropdown() {
    setState(() {
      _value12 = 'gender';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exercise"),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(10),
          children: <Widget>[
            _yoyo(),
            _buildTextField("Name", abc, (value) => _validateName(value)),
            _buildTextField(
                "Phone Number", cnt, (value) => _validatePhoneNumber(value), maxLength: 10),
            Row(
              children: <Widget>[
                Expanded(
                  child: _buildTextField(
                      "Pincode", jkg, (value) => _validatePincode(value),maxLength: 6),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: _buildDropdownButton(),
                ),
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
                SizedBox(width: 5),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      abc.clear();
                      cnt.clear();
                      jkg.clear();
                      resetDropdown();
                    },
                    child: Text("Reset"),
                  ),)])])));         
  }

  Widget _yoyo() {
    return Container(
      child: Image.asset("assets/dojob.jpg", width: 190, height: 190),
      alignment: Alignment.topCenter,
      margin: EdgeInsets.all(10),
    );
  }

  // ignore: unused_element
  Widget _buildTextField(String labelText, TextEditingController controller,
      FormFieldValidator<String?> validator,{int? maxLength}) {
    return Padding(
      padding: EdgeInsets.all(3),
      child: TextFormField(
         maxLength: maxLength,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        onChanged: (value) => setState(() {}),
        decoration: InputDecoration(
          
          labelText: labelText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
           
        ),
        validator: validator,
        //  maxLengthEnforcement: MaxLengthEnforcement.enforced,
      ),
    );
  }

  Widget _buildDropdownButton() {
    return Expanded(
      child: DropdownButton<String>(
        value: _value12,
        items: ["gender", "male", "female", "others"]
            .map((value) =>
                DropdownMenuItem<String>(value: value, child: Text(value)))
            .toList(),
        onChanged: (value) => setState(() => _value12 = value!),
      ),
    );
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "pls entr ur name";
    } else if (int.tryParse(value) != null) {
      return 'Characters only';
    }
    return null;
  }

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "please entr ur phonenumber";
    } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Invalid mobile number (should contain 10 digits)';
    }
    return null;
  }

  String? _validatePincode(String? value) {
    if (value == null || value.isEmpty) {
      return "pls entr ur pincode";
    } else if (!RegExp(r'^[0-9]{6}$').hasMatch(value)) {
      return 'Invalid pin code (should contain 6 numbers)';
    }
    return null;
  }

  void _calculate() {
    if (_formKey.currentState?.validate() ?? false) {
      // Registration logic here
      // Check if gender is selected
      if (_value12 == "gender") {
        // Show error message or handle the case where gender is not selected
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please select a gender!'),
            duration: Duration(seconds: 2),
          ),
        );
        return; // Do not proceed with registration
      }
      print('Name: ${abc.text}');
      print('Phone Number: ${cnt.text}');
      print('Pincode: ${jkg.text}');
      print('Gender: $_value12');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Registration successful!'),
          duration: Duration(seconds: 2)));
    }
  }
}
