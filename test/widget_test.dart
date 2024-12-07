import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:florales/main.dart';
import 'package:mockito/mockito.dart';
import 'package:florales/services/auth_service.dart';

class MockAuthService extends Mock implements AuthService {}

void main() {
  group('MyApp Widget Tests', () {
    testWidgets('Login button test', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Verifica que el título existe
      expect(find.text('Juegos Florales UPT'), findsOneWidget);
      expect(find.text('2024 - II'), findsOneWidget);

      // Verifica que el botón de inicio de sesión existe
      expect(find.text('Iniciar sesión con Microsoft'), findsOneWidget);
      expect(find.byIcon(Icons.login), findsOneWidget);
    });

    testWidgets('Theme configuration test', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      final MaterialApp app = tester.widget(find.byType(MaterialApp));
      expect(app.theme?.colorScheme.primary, Colors.blue);
      expect(app.theme?.colorScheme.secondary, Colors.orange);
      expect(app.title, 'Juegos Florales UPT 2024 - II');
    });

    testWidgets('Animation test', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pump();

      // Verifica la existencia del FadeTransition
      expect(find.byType(FadeTransition), findsOneWidget);

      // Verifica la animación
      await tester.pump(const Duration(milliseconds: 750));
      final FadeTransition fadeTransition =
          tester.widget(find.byType(FadeTransition));
      expect(fadeTransition.opacity.value, greaterThan(0));
    });

    testWidgets('Layout structure test', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // Verifica la estructura del layout
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(Container), findsOneWidget);
      expect(find.byType(SafeArea), findsOneWidget);
      expect(find.byType(Stack),
          findsNWidgets(2)); // Cambiado de findsOneWidget a findsNWidgets(2)
      expect(find.byType(Hero), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });
  });
}
