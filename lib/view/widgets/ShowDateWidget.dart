import 'package:flutter/material.dart';

Future<DateTime> selectDate(BuildContext context, selectedDate,{String campodata}) async {
    
  final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900, 8),
        lastDate: DateTime(2101));
        if (picked != null && picked != selectedDate){
           print(picked .toString());
           selectedDate = picked;
           campodata = picked.toString();
           print("Campo "+campodata);
           return picked ;
        }
  }