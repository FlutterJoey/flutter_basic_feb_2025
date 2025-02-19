import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FormScreen(),
    );
  }
}

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Example"),
      ),
      body: SafeArea(
        child: InputForm(),
      ),
    );
  }
}

class FormData {
  String username = "";
  String password = "";
}

class InputForm extends StatelessWidget {
  InputForm({
    super.key,
  });

  final _formKey = GlobalKey<FormState>();
  final _data = FormData();

  void submit(BuildContext context) {
    var form = _formKey.currentState;
    if (form == null) return;

    if (form.validate()) {
      form.save();
      form.reset();

      if (_data.username != "test" && _data.password != "password") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Wrong email and password"),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Username",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Username is required";
                }
                return null;
              },
              onSaved: (value) {
                if (value != null) {
                  _data.username = value;
                }
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Password",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Password is required";
                }
                return null;
              },
              onSaved: (value) {
                if (value != null) {
                  _data.password = value;
                }
              },
            ),
            Spacer(),
            FilledButton(
              onPressed: () {
                submit(context);
              },
              child: Text("submit"),
            )
          ],
        ),
      ),
    );
  }
}
