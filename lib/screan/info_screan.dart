import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:national_id/Blocs/NationalId/national_id_cubit.dart';

class InfoScrean extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NationalIdCubit,NationalIdState>(builder: (context,state){
      var cubit= NationalIdCubit.get(context);
      return Scaffold(

        appBar: AppBar(
          title: Text('Info'),
        ),
        body: Container(

         width: double.infinity,
          height: 350,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/Picture3.png"),
                fit: BoxFit.fill,

              )),

          child: Column(
crossAxisAlignment: CrossAxisAlignment.end,
mainAxisAlignment: MainAxisAlignment.center,

            children: [
Text(" الاسم / ${cubit.name.text} " ,textDirection:TextDirection.rtl ),
              Text(" السنة / ${cubit.yearOfBirth} " ,textDirection:TextDirection.rtl ),
              Text(" اليوم / ${cubit.dayOfBirth} " ,textDirection:TextDirection.rtl ),
              Text(" الشهر / ${cubit.monthOfBirth} " ,textDirection:TextDirection.rtl ),
              Text(" المحافظة / ${cubit.governorate} " ,textDirection:TextDirection.rtl ),
              Text(" الجنس او النوع / ${cubit.gender} " ,textDirection:TextDirection.rtl ),
              Text(" الرقم القومي / ${cubit.nationalID.text} " ,textDirection:TextDirection.rtl ),

            ],
          ),
        ),
      );
    }

        , listener: (context,state){}) ;
  }
}
