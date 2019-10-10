
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PaymentsProvider with ChangeNotifier{
  List<Widget> _listWidget=[
    Text('Visa'),
    Text('African Bank'),
    Text('RoMiAc Bank'),
    
  ];

  int _current;

  set currentcounter(value){
    _current=value;
    notifyListeners();
  }

  int get currentcounter=>_current;


  List<Widget> get readlist=>_listWidget;
}