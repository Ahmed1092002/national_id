import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:national_id/Blocs/NationalId/national_id_cubit.dart';

import '../screan/enter_screan.dart';

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>NationalIdCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
theme: ThemeData(

  useMaterial3: true,
textTheme: Theme.of(context).textTheme.apply(

    fontSizeDelta: 2,fontSizeFactor: 1.2),

),
        home:EnterScrean() ,
      ),
    );
  }
}