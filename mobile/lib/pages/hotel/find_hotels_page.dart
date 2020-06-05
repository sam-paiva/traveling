import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FindHotelsPage extends StatefulWidget {
  @override
  _FindHotelsPageState createState() => _FindHotelsPageState();
}

class _FindHotelsPageState extends State<FindHotelsPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Pesquise aqui',
                    icon: Icon(FontAwesomeIcons.search),
                    fillColor: Colors.red,
                    filled: false,
                    focusColor: Colors.red),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 30,
              ),
              FlatButton(
                child: const Text('Pesquisar'),
                color: Colors.red[300],
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
