import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../main.dart';
import '../../../app/routes.dart';
import '../../../core/common.dart';
import '../../../data/settings/authenticate.dart';
import '../../widgets/paisa_big_button_widget.dart';

class BiometricPage extends StatefulWidget {
  const BiometricPage({super.key});

  @override
  State<BiometricPage> createState() => _BiometricPageState();
}

class _BiometricPageState extends State<BiometricPage> {
  @override
  void initState() {
    super.initState();
    checkBiometrics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: PaisaBigButton(
            onPressed: () {
              checkBiometrics();
            },
            title: context.loc.authenticate,
          ),
        ),
      ),
      appBar: AppBar(),
      body: Column(
        children: [
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              MdiIcons.lock,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Text(
            context.loc.paisaLocked,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    MdiIcons.fingerprint,
                    size: 72,
                  ),
                  Text(
                    context.loc.biometricMessage,
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> checkBiometrics() async {
    final localAuth = getIt.get<Authenticate>();

    final bool canCheckBiometrics = await localAuth.canCheckBiometrics();

    if (canCheckBiometrics) {
      final bool result = await localAuth.authenticateWithBiometrics();
      if (result) {
        if (context.mounted) context.go(landingPath);
      } else {
        //SystemNavigator.pop();
      }
    }
  }
}
