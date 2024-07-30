import 'package:app_replica_mach/src/presentation/screens/widgets/home/home_piggy_bank_account_widget.dart';
import 'package:flutter/material.dart';

import 'home_account_widget.dart';

class SlidingWidget extends StatelessWidget {
  const SlidingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView(
        children: const [
          AccountWidget(),
          PiggyBankAccountWidget(),
        ],
      ),
    );
  }
}
