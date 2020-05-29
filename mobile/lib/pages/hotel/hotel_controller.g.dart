// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HotelController on _HotelControllerBase, Store {
  final _$hotelAtom = Atom(name: '_HotelControllerBase.hotel');

  @override
  Hotel get hotel {
    _$hotelAtom.reportRead();
    return super.hotel;
  }

  @override
  set hotel(Hotel value) {
    _$hotelAtom.reportWrite(value, super.hotel, () {
      super.hotel = value;
    });
  }

  @override
  String toString() {
    return '''
hotel: ${hotel}
    ''';
  }
}
