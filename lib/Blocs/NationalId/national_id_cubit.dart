import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:national_id/Map/Map_Born.dart';

part 'national_id_state.dart';

class NationalIdCubit extends Cubit<NationalIdState> {
  NationalIdCubit() : super(NationalIdInitial());

  static NationalIdCubit get(context) => BlocProvider.of(context);
  TextEditingController name = TextEditingController();

  TextEditingController nationalID = TextEditingController();
  String ?yearOfBirth;
  var dayOfBirth;
  var monthOfBirth;
  var governorate = "";
  var governmentNumber;
  var gender;
  var validatorType='';

  validator() {


    if (nationalID.text == null || nationalID.text.isEmpty) {
      return validatorType = 'Please enter the data';
    } else if (nationalID.text.length < 14 || nationalID.text.length > 14) {
      return validatorType = 'Please enter a valid number';
    }
    return '';
  }

   getYearOfBirth() {
    if (nationalID.text[0] == '2') {
      yearOfBirth = "19${nationalID.text[1]}${nationalID.text[2]}";
    }
    else if (nationalID.text[0] == '3') {
      yearOfBirth = "20${nationalID.text[1]}${nationalID.text[2]}";
    } else {
      yearOfBirth = "18${nationalID.text[1]}${nationalID.text[2]}";
    }

    emit(GetYearOfBirthState());

  }


  getdayOfBirth() {
    // dayOfBirth="${nationalID.text[5]}${nationalID.text[6]}";
    dayOfBirth = int.parse(nationalID.text.substring(5, 7));
    if (dayOfBirth > 31) {
      return validatorType = 'Please enter a valid day';
    }
    emit(GetDayOfBirthState());

  }

   getMonthOfBirth() {
    monthOfBirth = int.parse(nationalID.text.substring(3, 5));
    if (monthOfBirth > 12) {
      return validatorType = 'Please enter a valid month';
    }

    emit(GetMonthOfBirthState());
  }

   getgovernorateOfBirth() {
    governmentNumber = nationalID.text.substring(7, 9);
    if (!bornGovernorate.containsKey(governmentNumber)) {
      return validatorType = 'Please enter a valid government';
    }
    else {
      governorate = bornGovernorate[governmentNumber]!;
    }


    emit(GetgovernorateOfBirthState());
  }

   getgender() {
    int? GenderNumber = int.tryParse(nationalID.text[12]);

    if (GenderNumber! % 2 == 0) {
      gender = 'انثي / female';
    }
    else {
      gender = 'male/ ذكر';
    }
    emit(GetGenderState());
  }


  alertDialog(context) {
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text('Error'),
        content: Text(validatorType),
        actions: [
          TextButton(onPressed: () {
            Navigator.pop(context);
            validatorType='';
          }, child: Text('ok'))
        ],
      );
    });

  }
}

