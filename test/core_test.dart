import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:eapp_jittery_core/eapp_jittery_core.dart';

void main() {
  group('Jittery Core - Component Styles', () {
    test('should create JitteryButtonStyle with all properties', () {
      final style = JitteryButtonStyle(
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        borderRadius: 8.0,
      );

      expect(style.backgroundColor, Colors.blue);
      expect(style.textColor, Colors.white);
      expect(style.borderRadius, 8.0);
    });

    test('should create JitteryTextFieldStyle with all properties', () {
      final style = JitteryTextFieldStyle(
        backgroundColor: Colors.grey,
        textColor: Colors.black,
        borderRadius: 12.0,
      );

      expect(style.backgroundColor, Colors.grey);
      expect(style.textColor, Colors.black);
      expect(style.borderRadius, 12.0);
    });
  });

  group('Jittery Core - Abstract Interfaces', () {
    test('should have JitteryComponentComposer interface', () {
      // Verify the abstract class exists
      expect(JitteryComponentComposer, isNotNull);
    });

    test('should have JitteryTileComposer interface', () {
      // Verify the abstract class exists
      expect(JitteryTileComposer, isNotNull);
    });

    test('should have JitteryButton interface', () {
      // Verify the abstract class exists
      expect(JitteryButton, isNotNull);
    });

    test('should have JitteryTextField interface', () {
      // Verify the abstract class exists
      expect(JitteryTextField, isNotNull);
    });

    test('should have JitteryCard interface', () {
      // Verify the abstract class exists
      expect(JitteryCard, isNotNull);
    });
  });

  group('Jittery Core - Design Kit Contracts', () {
    test('resolves design-kit metadata for built-in kits', () {
      final carbon = DesignKitRegistry.resolveMetadata('carbon');
      final epnCarbon = DesignKitRegistry.resolveMetadata('epn-carbon');
      final level = DesignKitRegistry.resolveMetadata('level');

      expect(carbon.id, 'carbon');
      expect(carbon.family, 'carbon');
      expect(carbon.sourcePackage, '@carbon/themes');
      expect(carbon.conformanceLevel, DesignKitConformanceLevel.tokenComplete);

      expect(epnCarbon.id, 'epn-carbon');
      expect(epnCarbon.parentKitId, 'carbon');
      expect(epnCarbon.hasBrandOverrides, isTrue);

      expect(level.id, 'level');
      expect(level.aliases, contains('default'));

      final pureCarbon = DesignTokens.resolveForContract(
        'carbon',
        Brightness.light,
      );
      final brandedCarbon = DesignTokens.resolveForContract(
        'epn-carbon',
        Brightness.light,
      );

      expect(pureCarbon.accent, const Color(0xFF0F62FE));
      expect(brandedCarbon.accent, const Color(0xFF6F4FA1));
      expect(DesignKitRegistry.resolveId('ibm-carbon'), 'carbon');
      expect(DesignKitRegistry.resolveId('unknown-kit'), 'level');
    });

    test('exposes typed token groups without breaking legacy getters', () {
      final tokens = CarbonTokens(Brightness.light);

      expect(tokens.backgroundPrimary, tokens.colors.background);
      expect(tokens.contentPrimary, tokens.colors.textPrimary);
      expect(tokens.accent, tokens.colors.interactive);
      expect(tokens.bodyMedium, tokens.type.bodyMedium);
      expect(tokens.spacing.spacing05, 16);
      expect(tokens.spacing.spacing08, 32);
      expect(tokens.layout.gridColumns, 16);
      expect(tokens.states.focus, tokens.focus);
      expect(tokens.accent, const Color(0xFF0F62FE));
      expect(tokens.backgroundPrimary, const Color(0xFFFFFFFF));
    });

    test('exposes explicit Carbon theme variants', () {
      final white = CarbonThemeWhite();
      final g10 = CarbonThemeG10();
      final g90 = CarbonThemeG90();
      final g100 = CarbonThemeG100();
      final epn = EpnCarbonTokens(Brightness.light);

      expect(white.backgroundPrimary, const Color(0xFFFFFFFF));
      expect(g10.backgroundPrimary, const Color(0xFFF4F4F4));
      expect(g90.backgroundPrimary, const Color(0xFF262626));
      expect(g100.backgroundPrimary, const Color(0xFF161616));
      expect(epn.accent, const Color(0xFF6F4FA1));
      expect(epn.focusBorder, const Color(0xFF6F4FA1));
    });

    test('resolves default component specs by id, alias, and EIC code', () {
      final button = ComponentSpecRegistry.resolve('primary-button');
      final table = ComponentSpecRegistry.resolve('eic1032');
      final grid = ComponentSpecRegistry.resolve('grid');
      final actionSet = ComponentSpecRegistry.resolve('action-set');
      final pageShell = ComponentSpecRegistry.resolve('content-region');

      expect(button?.primitive, 'button');
      expect(
        button?.supportedStates,
        contains(ComponentInteractionState.focus),
      );

      expect(table?.primitive, 'data-table');
      expect(table?.sourceUrl.toString(), contains('data-table'));

      expect(grid?.primitive, 'layout-grid');
      expect(grid?.sourceUrl.toString(), contains('2x-grid'));

      expect(actionSet?.primitive, 'action-set');
      expect(
        actionSet?.supportedStates,
        contains(ComponentInteractionState.hover),
      );

      expect(pageShell?.primitive, 'page-shell');
      expect(pageShell?.sourceUrl.toString(), contains('2x-grid'));
    });

    test('records fallback reports for non-pixel-approved components', () {
      DesignFallbackReporter.clear();

      DesignFallbackReporter.report(
        const DesignFallbackReport(
          designKitId: 'carbon',
          componentId: 'EIC1024',
          fallbackKitId: 'level',
          reason: 'Carbon list-row composer not implemented yet',
        ),
      );

      expect(DesignFallbackReporter.reports, hasLength(1));
      expect(DesignFallbackReporter.reports.single.designKitId, 'carbon');
      expect(DesignFallbackReporter.reports.single.fallbackKitId, 'level');
    });
  });
}
