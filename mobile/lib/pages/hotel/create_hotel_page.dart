import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/pages/home/home_controller.dart';
import 'package:mobile/pages/login/login_controller.dart';
import 'package:mobile/utils/validations.dart';
import 'package:mobile/viewModels/create_hotel_vm.dart';

import 'hotel_controller.dart';

class CreateHotelPage extends StatefulWidget {
  @override
  _CreateHotelPageState createState() => _CreateHotelPageState();
}

class _CreateHotelPageState extends State<CreateHotelPage> {
  final hotelController = Modular.get<HotelController>();
  final loginController = Modular.get<LoginController>();
  final homeController = Modular.get<HomeController>();
  final _formKey = GlobalKey<FormState>();
  final textNameController = TextEditingController();
  final textAddressController = TextEditingController();
  final textPhoneController = TextEditingController();
  final textPriceController = TextEditingController();
  final textCityController = TextEditingController();

  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  void sendForm() async {
    CreateHotelViewModel hotel = new CreateHotelViewModel();
    String base64;

    if (_image != null) {
      final imageBytes = await File(_image.path).readAsBytes();
      base64 = base64Encode(imageBytes);
    }

    hotel.name = textNameController.text;
    hotel.address = textAddressController.text;
    hotel.city = textCityController.text;
    hotel.imageBase64 = _image;
    hotel.phone = textPhoneController.text;
    hotel.userId = loginController.user.id;
    hotel.price = double.parse(textPriceController.text);

    bool success = await hotelController.storeHotel(hotel);
    if (success) {
      Fluttertoast.showToast(
          msg: "Hotel cadastrado com sucesso",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      homeController.getHotels();
    } else {
      Fluttertoast.showToast(
          msg: "Ocorreu um erro ao cadastrar o hotel",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Widget _formUI() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: new Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Nome', contentPadding: const EdgeInsets.all(5.0)),
            controller: textNameController,
            validator: Validations.validateTextField,
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Endereço',
                contentPadding: const EdgeInsets.all(5.0)),
            controller: textAddressController,
            validator: Validations.validateTextField,
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Preço diária',
                contentPadding: const EdgeInsets.all(5.0)),
            controller: textPriceController,
            validator: Validations.validateTextField,
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Cidade', contentPadding: const EdgeInsets.all(5.0)),
            controller: textCityController,
            validator: Validations.validateTextField,
          ),
          SizedBox(height: 10),
          TextFormField(
            inputFormatters: <TextInputFormatter>[
              LengthLimitingTextInputFormatter(15),
              WhitelistingTextInputFormatter.digitsOnly,
              BlacklistingTextInputFormatter.singleLineFormatter
            ],
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: 'Telefone',
                contentPadding: const EdgeInsets.all(5.0)),
            controller: textPhoneController,
            validator: Validations.validateTextField,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF5757),
        title: Text('Traveling'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            iconSize: 30,
            onPressed: () {
              if (_formKey.currentState.validate()) {
                // Scaffold.of(context)
                //     .showSnackBar(SnackBar(content: Text('Processando')));
                try {
                  sendForm();
                } catch (e) {
                  throw e;
                }
              }
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Hero(
                  tag: 'assets/default.jpg',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: GestureDetector(
                      onTap: () => getImage(),
                      child: Image(
                        image: (_image == null)
                            ? AssetImage('assets/default.jpg')
                            : FileImage(File(_image.path)),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              (_image == null)
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 100.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Toque para Escolher uma imagem',
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.all(8),
                    ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: _formKey,
                        child: _formUI(),
                      ),
                    ),
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
