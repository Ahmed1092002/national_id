import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:national_id/Blocs/NationalId/national_id_cubit.dart';
import 'package:national_id/screan/info_screan.dart';
import 'package:national_id/utils/Nafigator.dart';

import '../Compoant/text_field_componant.dart';

class EnterScrean extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NationalIdCubit, NationalIdState>(
        builder: (context, state) {
          var cubit = NationalIdCubit.get(context);
          return Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/Picture1.png"),
                    fit: BoxFit.cover,
                  )),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFieldComponant(
                    controller: cubit.name,
                    hintText: 'Enter your name',
                  ),
                  TextFieldComponant(
                    controller: cubit.nationalID,
                    hintText: 'Enter your national ID',
                  ),
                  ElevatedButton(

                      onPressed: () {
                        cubit.validator();
                        cubit.getYearOfBirth();
                        cubit.getMonthOfBirth();
                        cubit.getdayOfBirth();
                        cubit.getgovernorateOfBirth();

                        cubit.getgender();
                        if (cubit.validatorType == '') {
                          navigateToScreen(context, InfoScrean());

                        } else if(cubit.validatorType.isNotEmpty){
                          cubit.alertDialog(context);
                        }
                      },
                      child: Text('Analyse user data'))
                ],
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
