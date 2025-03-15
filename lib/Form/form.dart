import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: RegistrationForm(),
  ));
}

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  String fullName = '';
  String email = '';
  String gender = 'Male';
  String province = 'Bangkok';
  bool acceptTerms = false;

  final List<String> provinces = [
    'Bangkok',
    'Chiang Mai',
    'Phuket',
    'Khon Kaen',
    'Chonburi'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registration Form")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                "Registration Form (650710671)",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),

              // Full Name
              TextFormField(
                decoration: InputDecoration(labelText: "Full Name"),
                validator: (value) =>
                    value!.isEmpty ? "Please enter your full name" : null,
                onSaved: (value) => fullName = value!,
              ),

              // Email
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => value!.isEmpty || !value.contains("@")
                    ? "Enter a valid email"
                    : null,
                onSaved: (value) => email = value!,
              ),

              SizedBox(height: 20),

              // Gender Selection
              Text("Gender",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Radio(
                    value: "Male",
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value.toString();
                      });
                    },
                  ),
                  Text("Male"),
                  SizedBox(width: 20),
                  Radio(
                    value: "Female",
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value.toString();
                      });
                    },
                  ),
                  Text("Female"),
                ],
              ),

              // Province Dropdown
              Text("Province",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              DropdownButtonFormField(
                value: province,
                items: provinces.map((String item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    province = value.toString();
                  });
                },
              ),

              SizedBox(height: 20),

              // Accept Terms Checkbox
              CheckboxListTile(
                title: Text("Accept Terms & Conditions"),
                value: acceptTerms,
                onChanged: (value) {
                  setState(() {
                    acceptTerms = value!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),

              SizedBox(height: 20),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() && acceptTerms) {
                    _formKey.currentState!.save();
                    print(
                        "Name: $fullName, Email: $email, Gender: $gender, Province: $province");
                  }
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
