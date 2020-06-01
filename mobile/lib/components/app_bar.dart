import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/models/hotel_model.dart';
import 'package:mobile/pages/hotel/hotel_page.dart';
import 'package:mobile/pages/login/login_controller.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Hotel> hotels;
  final Function showDialog;
  final loginController = Modular.get<LoginController>();

  CustomAppBar({Key key, this.hotels, this.showDialog})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Traveling'),
      backgroundColor: Color(0xFFFF5757),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            showSearch(
                context: context, delegate: DataSearch(hotels: this.hotels));
          },
        ),
      ],
    );
  }

  @override
  final Size preferredSize;
}

class DataSearch extends SearchDelegate<String> {
  @override
  String get searchFieldLabel => 'Pesquise aqui um hotel';

  final List<Hotel> hotels;

  DataSearch({this.hotels});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        child: Card(
          color: Colors.red,
          child: Center(
            child: Text(
              query,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList =
        this.hotels.where((h) => h.name.contains(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.local_hotel),
        title: Text(suggestionList[index].name),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => HotelPage(
                        hotel: suggestionList[index],
                      )));
        },
      ),
      itemCount: suggestionList.length,
    );
  }
}
