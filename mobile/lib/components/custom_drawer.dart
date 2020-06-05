import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/pages/home/home_page.dart';
import 'package:mobile/pages/hotel/create_hotel_page.dart';
import 'package:mobile/pages/login/login_controller.dart';
import 'package:mobile/pages/login/login_page.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginController = Modular.get<LoginController>();
    debugPrint(loginController.token);

    Widget _authenticationList() {
      return Column(
        children: <Widget>[
          ListTile(
              leading: Icon(Icons.star),
              title: Text("Minhas publicações"),
              subtitle: Text("Hotéis que eu postei"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                debugPrint(loginController.token);
              }),
          ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Conta"),
              subtitle: Text("Configurações da conta"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                //Navigator.pop(context);
              }),
          ListTile(
              leading: Icon(Icons.hotel),
              title: Text("Postar novo hotel"),
              subtitle: Text("Crie um novo hotel"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => CreateHotelPage()));
                //Navigator.pop(context);
              }),
          ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Sair"),
              subtitle: Text("Sair"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                loginController.logout();
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => HomePage()));
                //Navigator.pop(context);
              })
        ],
      );
    }

    Widget _offlineList() {
      return Column(
        children: <Widget>[
          ListTile(
              leading: Icon(FontAwesomeIcons.doorOpen),
              title: Text("Entrar"),
              subtitle: Text("Faça login ou crie sua conta."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => LoginPage()));
              }),
          ListTile(
              leading: Icon(Icons.hotel),
              title: Text("Postar novo hotel"),
              subtitle: Text("Crie um novo hotel"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => CreateHotelPage()));
                //Navigator.pop(context);
              }),
        ],
      );
    }

    return Drawer(
      child: ListView(
        children: <Widget>[
          (loginController.token != null)
              ? UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  accountName: Text(loginController.user.username),
                  accountEmail: Text(loginController.user.email),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor:
                        Theme.of(context).platform == TargetPlatform.iOS
                            ? Colors.blue
                            : Colors.deepPurple,
                    child: Text(
                      loginController.user.username.substring(0, 1),
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                  ),
                )
              : Container(
                  height: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/Traveling(1).png'),
                          fit: BoxFit.cover)),
                ),
          (loginController.token != null)
              ? Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: _authenticationList(),
                )
              : Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: _offlineList(),
                )
        ],
      ),
    );
  }
}
