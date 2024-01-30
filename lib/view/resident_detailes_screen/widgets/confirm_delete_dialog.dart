import 'package:flutter/material.dart';
import 'package:hostel_management_app/utils/color_constants.dart';

class ConfirmDeletDialog extends StatelessWidget {
  const ConfirmDeletDialog({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      title: const Text(
        'Confirm Delete',
        textAlign: TextAlign.center,
      ),
      content: const Text('Are you sure you want to Delelte?'),
      actionsAlignment: MainAxisAlignment.center,
      actions: <Widget>[
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(ColorConstants.colorRed)),
          onPressed: onPressed,
          child: const Text('Delete'),
        ),
      ],
    );
  }
}