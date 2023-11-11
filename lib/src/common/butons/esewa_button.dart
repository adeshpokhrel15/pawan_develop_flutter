import 'package:flutter/material.dart';
import 'package:mechanic_baato/src/utils/managers/color_manager.dart';

class EsewaButton extends StatelessWidget {
  const EsewaButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ThirdPartyColor.esewaColor,
      ),
      onPressed: () {},
      // icon: Text(
      //   'K',
      // ),
      child: const Text('Pay with e-Sewa'),
    );
  }
}
