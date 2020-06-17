import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  AuthForm(this.formData, this.isLoading);
  final bool isLoading;

  final void Function(String userName, String email, String password,
      bool isLogin, BuildContext ctx) formData;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLogin = true;
  String _userName = '';
  String _userEmail = '';
  String _userPassword = '';

  void _checkSubmit() {
    final isValidate = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (isValidate) {
      _formKey.currentState.save();
      widget.formData(_userName.trim(), _userEmail.trim(), _userPassword.trim(),
          _isLogin, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(25),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.limeAccent[100], Colors.red[100]])),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    if (!_isLogin)
                      TextFormField(
                        key: ValueKey('user'),
                        validator: (value) {
                          if (value.isEmpty || value.length < 3) {
                            return 'Twoja nazwa musi zawierać conajmniej 3 litery';
                          }
                          return null;
                        },
                        decoration:
                            InputDecoration(labelText: 'Nazwa użytkownika'),
                        onSaved: (newValue) {
                          _userName = newValue;
                        },
                      ),
                    TextFormField(
                      key: ValueKey('email'),
                      validator: (value) {
                        if (value.isEmpty || !value.contains('@')) {
                          return 'Proszę wpisać prawidłowy adres email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: 'Adres email'),
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (newValue) {
                        _userEmail = newValue;
                      },
                    ),
                    TextFormField(
                      key: ValueKey('password'),
                      validator: (value) {
                        if (value.isEmpty || value.length < 7) {
                          return 'Twoje hasło musi mieć co najmniej 7 znaków';
                        }
                        return null;
                      },
                      decoration: InputDecoration(labelText: 'Hasło'),
                      obscureText: true,
                      onSaved: (newValue) {
                        _userPassword = newValue;
                      },
                    ),
                    SizedBox(height: 10),
                    if (widget.isLoading) CircularProgressIndicator(),
                    if (!widget.isLoading)
                      RaisedButton(
                        color: Colors.yellow[900],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(_isLogin ? 'Zaloguj' : 'Zarejestruj'),
                        onPressed: _checkSubmit,
                      ),
                    if (!widget.isLoading)
                      FlatButton(
                        child: Text(
                            _isLogin ? 'Stwórz nowe konto' : 'Mam już konto'),
                        onPressed: () {
                          setState(() {
                            _isLogin = !_isLogin;
                          });
                        },
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
