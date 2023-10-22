import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:national_id/Blocs/NationalId/national_id_cubit.dart';

class TextFieldComponant extends StatefulWidget {
  final TextEditingController? controller;
  String ? hintText;

  TextFieldComponant({this.controller,this.hintText});

  @override
  State<TextFieldComponant> createState() => _TextFieldComponantState();
}

class _TextFieldComponantState extends State<TextFieldComponant> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.controller!.dispose();
  }
  bool isANumber = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
controller: widget.controller,
          keyboardType:widget.hintText=='Enter your national ID'? TextInputType.number:TextInputType.text,
        // inputFormatters: [FilteringTextInputFormatter.deny(RegExp("[0-9]+"))],

maxLength: widget.hintText=='Enter your national ID'? 14:100,


       decoration: InputDecoration(
         hintText: widget.hintText,
           errorText: isANumber ? null : "Please enter a number",
label:widget.hintText=='Enter your national ID'? Text('National ID'):Text('Name'),
         filled: true,
fillColor: Colors.white.withOpacity(0.5),
           suffixIcon: widget.hintText=='Enter your national ID'?Icon(Icons.perm_identity):Icon(Icons.drive_file_rename_outline_sharp),
           isDense: true,

           border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(10),

         )
       ),

      ),
    );
  }
}
