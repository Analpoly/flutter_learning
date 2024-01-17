import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DiskForm(),
  ));
}

class DiskForm extends StatefulWidget {
  @override
  _DiskFormState createState() => _DiskFormState();
}

class _DiskFormState extends State<DiskForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _pincodeController = TextEditingController();
  String _selectedGender = "gender";

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
          children: [
            _buildImage(),
            _buildFormField("Name", _nameController, _validateName),
            _buildFormField("Phone Number", _phoneController, _validatePhone),
            // _buildFormField("Pincode", _pincodeController, _validatePincode),
            _buildDropdown(),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      child: Image.asset(
        "assets/dojob.jpg",
        width: 190,
        height: 190,
      ),
      alignment: Alignment.topCenter,
      margin: EdgeInsets.all(20),
    );
  }

  Widget _buildFormField(String label, TextEditingController controller, String? Function(String?)? validator) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: TextFormField(
        controller: controller,
        onChanged: (_) => setState(() {}),
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        validator: validator,
      ),
    );
  }

  Widget _buildDropdown() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "Pincode",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            maxLength: 6,
            controller: _pincodeController,
            onChanged: (_) => setState(() {}),
            validator: _validatePincode,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: DropdownButton<String>(
            value: _selectedGender,
            items: ["gender", "male", "female", "others"]
                .map((value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ))
                .toList(),
            onChanged: (value) => setState(() => _selectedGender = value!),
          ),
        ),
      ],
    );
  }

  Widget _buildButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: _calculate,
            child: Text('Register'),
          ),
        ),
        SizedBox(width: 5),
        Expanded(
          child: ElevatedButton(
            onPressed: _resetForm,
            child: Text("Reset"),
          ),
        ),
      ],
    );
  }

  void _calculate() {
    if (_formKey.currentState?.validate() ?? false) {
       if (_selectedGender! == "gender") {
      // Show error message or handle the case where gender is not selected
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select a gender!'),
          duration: Duration(seconds: 2),
        ),
      );
      return; // Do not proceed with registration
    }
      // Perform registration logic here
      print('Name: ${_nameController.text}');
      print('Phone Number: ${_phoneController.text}');
      print('Pincode: ${_pincodeController.text}');
      print('Gender: $_selectedGender');

      // Show SnackBar on successful registration
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registration successful!'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void _resetForm() {
    _nameController.clear();
    _phoneController.clear();
    _pincodeController.clear();
    setState(() {
      _selectedGender = "gender";
    });
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your name";
    } else if (int.tryParse(value) != null) {
      return 'Characters only';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your phone number";
    } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Invalid mobile number (should contain 10 digits)';
    }
    return null;
  }

  String? _validatePincode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your pincode';
    } else if (!RegExp(r'^[0-9]{6}$').hasMatch(value)) {
      return 'Invalid pin code (should contain 6 numbers)';
    }
    return null;
  }
}
