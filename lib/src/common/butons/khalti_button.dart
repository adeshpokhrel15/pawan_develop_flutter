import 'package:flutter/material.dart';
import 'package:mechanic_baato/src/utils/managers/color_manager.dart';

class KhaltiButton extends StatelessWidget {
  const KhaltiButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ThirdPartyColor.khaltiColor,
      ),
      onPressed: () {},
      // icon: Text(
      //   'K',
      // ),
      child: const Text('Pay with Kahlti'),
    );
  }
}
