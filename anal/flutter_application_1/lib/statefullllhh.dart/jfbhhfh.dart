import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegistrationForm(),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _mobileNumberController = TextEditingController();
  TextEditingController _pincodeController = TextEditingController();
  String _selectedOption = 'Option 1';

  void _register() {
    if (_formKey.currentState?.validate() ?? false) {
      // Perform registration logic here
      String name = _nameController.text;
      String mobileNumber = _mobileNumberController.text;
      String pincode = _pincodeController.text;

      print('Name: $name');
      print('Mobile Number: $mobileNumber');
      print('Pincode: $pincode');
      print('Selected Option: $_selectedOption');

      // Show SnackBar on successful registration
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registration successful!'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void _secondButtonAction() {
    // Add your action for the second button here
    print('Second Button Pressed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              yoyo(),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  else if(int.tryParse(value)!=null){
                    return 'hii';
                  }               
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _mobileNumberController,
                decoration: InputDecoration(labelText: 'Mobile Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your mobile number';
                  } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                    return 'Invalid mobile number (should contain 10 digits)';
                  }
                  return null;
                },
                // keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 16.0),
              Row(
                children: [

                Expanded(
                  child:TextFormField
              
              (
                controller: _pincodeController,
                decoration: InputDecoration(labelText: 'Pincode'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your pincode';
                  } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'Invalid pin code (should contain only numbers)';
                  }
                  return null;
                },
                // keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16.0),
              Expanded(
              child:DropdownButtonFormField<String>(
                value: _selectedOption,
                items: ['Option 1', 'Option 2', 'Option 3']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedOption = value ?? 'Option 1';
                  });
                },
                decoration: InputDecoration(labelText: 'Select Option'),
              ))
                ],),
              SizedBox(height: 32.0),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: _register,
                    child: Text('Register'),
                  ),
                  SizedBox(width: 16.0),
                  ElevatedButton(
                    onPressed: _secondButtonAction,
                    child: Text('Second Button'),
                  ),
                ],
              ),
            ],
              
          ),
        ),
      ),
    );
  }
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
      // margin: EdgeInsets.all(_minimumPadding * 5),
    );
  }
