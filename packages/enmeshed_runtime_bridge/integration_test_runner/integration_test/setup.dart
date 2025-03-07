import 'package:enmeshed_runtime_bridge/enmeshed_runtime_bridge.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:logger/logger.dart';

import 'dummy_app.dart' as dummy_app;
import 'mock_event_bus.dart';

Future<EnmeshedRuntime> setup() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  dummy_app.main();

  final eventBus = MockEventBus();
  // reset event bus before each test to get rid of old events
  setUp(() => eventBus.reset());

  final runtime = EnmeshedRuntime(
    runtimeConfig: (
      baseUrl: "https://pilot.enmeshed.eu",
      clientId: "CLTABGeWdEeM9TzUvvIm",
      clientSecret: "2J2HaASIDNKAu7M7ZcCcAURsRsqGP1",
      applicationId: 'eu.enmeshed.test',
      useAppleSandbox: const bool.fromEnvironment('app_useAppleSandbox'),
      databaseFolder: './database',
    ),
    logger: Logger(printer: SimplePrinter(colors: false), level: Level.warning),
    eventBus: eventBus,
  );
  await runtime.run();

  return runtime;
}
