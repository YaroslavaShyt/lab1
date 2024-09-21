import 'package:flutter/material.dart';

class PrintAndSaveButtonsRow extends StatelessWidget {
  const PrintAndSaveButtonsRow({
    required this.onPrintButtonPressed, 
    required this.onSaveButtonPressed,
    super.key,});

final VoidCallback onSaveButtonPressed;
final VoidCallback onPrintButtonPressed;



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
       
       _buildButton(isSaveButton: true),
       _buildButton(isSaveButton: false)
      ],),
    );
  }

  Widget _buildButton({required bool isSaveButton}){
    return  GestureDetector(
          onTap: isSaveButton ? onSaveButtonPressed : onPrintButtonPressed,
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10)
            ),
            child:  Icon(isSaveButton ? Icons.save : Icons.print, color: Colors.white, size: 30,),
          ),
        );
  }
}