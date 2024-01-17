import 'dart:js';

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Disk()));

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

  void resetDropdown() => setState(() => _value12 = 'gender');

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text("Exercise"), backgroundColor: Colors.blue),
        body: Form(
          key: _formKey,
          child: ListView(padding: EdgeInsets.all(10), children: <Widget>[
            _yoyo(),
            _buildTextField("Name", abc, (value) => _validateName(value)),
            _buildTextField("Phone Number", cnt, (value) => _validatePhoneNumber(value), maxLength: 10),
            Row(children: <Widget>[
              Expanded(child: _buildTextField("Pincode", jkg, (value) => _validatePincode(value), maxLength: 6)),
              SizedBox(width: 5),
              Expanded(child: _buildDropdownButton()),
            ]),
            Row(children: <Widget>[
              Expanded(child: ElevatedButton(onPressed: _calculate, child: Text('Register'))),
              SizedBox(width: 5),
              Expanded(child: ElevatedButton(onPressed: _reset, child: Text("Reset"))),
            ]),
          ]),
        ),
      );

  Widget _yoyo() => Container(
        child: Image.asset("assets/dojob.jpg", width: 190, height: 190),
        alignment: Alignment.topCenter,
        margin: EdgeInsets.all(10),
      );

  Widget _buildTextField(String labelText, TextEditingController controller, FormFieldValidator<String?> validator,
          {int? maxLength}) =>
      Padding(
        padding: EdgeInsets.all(3),
        child: TextFormField(
          maxLength: maxLength,
          controller: controller,
          onChanged: (value) => setState(() {}),
          decoration: InputDecoration(labelText: labelText, border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
          validator: validator,
        ),
      );

  Widget _buildDropdownButton() => Expanded(
        child: DropdownButton<String>(
          value: _value12,
          items: ["gender", "male", "female", "others"].map((value) => DropdownMenuItem<String>(value: value, child: Text(value))).toList(),
          onChanged: (value) => setState(() => _value12 = value!),
        ),
      );

  String? _validateName(String? value) => (value == null || value.isEmpty) ? "pls entr ur name" : (int.tryParse(value) != null) ? 'Characters only' : null;

  String? _validatePhoneNumber(String? value) =>
      (value == null || value.isEmpty) ? "please entr ur phonenumber" : (!RegExp(r'^[0-9]{10}$').hasMatch(value)) ? 'Invalid mobile number (should contain 10 digits)' : null;

  String? _validatePincode(String? value) =>
      (value == null || value.isEmpty) ? "pls entr ur pincode" : (!RegExp(r'^[0-9]{6}$').hasMatch(value)) ? 'Invalid pin code (should contain 6 numbers)' : null;

  void _calculate() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_value12 == "gender") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please select a gender!'), duration: Duration(seconds: 2)));
        return;
      }
      print('Name: ${abc.text}\nPhone Number: ${cnt.text}\nPincode: ${jkg.text}\nGender: $_value12');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registration successful!'), duration: Duration(seconds: 2)));
    }
  }

  void _reset() {
    abc.clear();
    cnt.clear();
    jkg.clear();
    resetDropdown();
  }
}
