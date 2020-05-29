// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$currentIndexAtom = Atom(name: '_HomeControllerBase.currentIndex');

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  final _$openDialogAtom = Atom(name: '_HomeControllerBase.openDialog');

  @override
  bool get openDialog {
    _$openDialogAtom.reportRead();
    return super.openDialog;
  }

  @override
  set openDialog(bool value) {
    _$openDialogAtom.reportWrite(value, super.openDialog, () {
      super.openDialog = value;
    });
  }

  final _$textFieldControllerAtom =
      Atom(name: '_HomeControllerBase.textFieldController');

  @override
  TextEditingController get textFieldController {
    _$textFieldControllerAtom.reportRead();
    return super.textFieldController;
  }

  @override
  set textFieldController(TextEditingController value) {
    _$textFieldControllerAtom.reportWrite(value, super.textFieldController, () {
      super.textFieldController = value;
    });
  }

  final _$destinationAtom = Atom(name: '_HomeControllerBase.destination');

  @override
  List<Destination> get destination {
    _$destinationAtom.reportRead();
    return super.destination;
  }

  @override
  set destination(List<Destination> value) {
    _$destinationAtom.reportWrite(value, super.destination, () {
      super.destination = value;
    });
  }

  final _$hotelsAtom = Atom(name: '_HomeControllerBase.hotels');

  @override
  List<Hotel> get hotels {
    _$hotelsAtom.reportRead();
    return super.hotels;
  }

  @override
  set hotels(List<Hotel> value) {
    _$hotelsAtom.reportWrite(value, super.hotels, () {
      super.hotels = value;
    });
  }

  final _$getDestinationsAsyncAction =
      AsyncAction('_HomeControllerBase.getDestinations');

  @override
  Future getDestinations() {
    return _$getDestinationsAsyncAction.run(() => super.getDestinations());
  }

  final _$getHotelsAsyncAction = AsyncAction('_HomeControllerBase.getHotels');

  @override
  Future getHotels() {
    return _$getHotelsAsyncAction.run(() => super.getHotels());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic showDialog() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.showDialog');
    try {
      return super.showDialog();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePage(int index) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.changePage');
    try {
      return super.changePage(index);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex},
openDialog: ${openDialog},
textFieldController: ${textFieldController},
destination: ${destination},
hotels: ${hotels}
    ''';
  }
}
