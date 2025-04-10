import 'package:biometrics_feature/presentation/provider/biometrics_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final biometricsState = ref.watch(biometricsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Biometrics Authentication'),
      ),
      body: Center(
        child:
             Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Biometrics Status:',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 16),
                Text('Available: ${biometricsState.isAvailable}'),
                Text('Enabled: ${biometricsState.isEnabled}'),
                Text('Available Types: ${biometricsState.availableTypes.join(", ")}'),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: biometricsState.isAvailable && biometricsState.isEnabled
                      ? () =>  ref.read(biometricsProvider.notifier).authenticate(context)
                      : null,
                  child: const Text('Authenticate'),
                ),
              ],
            ),


      ),
    );
  }
}

