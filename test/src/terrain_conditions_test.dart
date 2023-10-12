// ignore_for_file: prefer_const_constructors

import 'dart:collection';

import 'package:habitat/habitat.dart';
import 'package:test/test.dart';

class _TestAttribute extends Attribute {
  _TestAttribute() : super(name: 'test', value: Value.constant(0.5));
}

void main() {
  group('$TerrainConditions', () {
    test('can be instantiated', () {
      expect(TerrainConditions(UnmodifiableMapView({})), isNotNull);
    });

    group('satisfies', () {
      test('when the value is found and in range', () {
        final conditions = TerrainConditions(
          UnmodifiableMapView({_TestAttribute(): 0.5}),
        );

        final biomeAttribute = BiomeAttribute<_TestAttribute>(range: Range());
        expect(conditions.satisfies(biomeAttribute), isTrue);
      });

      test('when the attribute type is not found', () {
        final conditions = TerrainConditions(UnmodifiableMapView({}));

        final biomeAttribute = BiomeAttribute<_TestAttribute>(range: Range());
        expect(conditions.satisfies(biomeAttribute), isTrue);
      });

      test('when the value is found and in range', () {
        final conditions = TerrainConditions(
          UnmodifiableMapView({_TestAttribute(): 0.5}),
        );

        final biomeAttribute = BiomeAttribute<_TestAttribute>(
          range: Range(max: 0.4),
        );
        expect(conditions.satisfies(biomeAttribute), isFalse);
      });
    });

    test('get attribute value', () {
      final attribute = _TestAttribute();
      final conditions = TerrainConditions(
        UnmodifiableMapView({attribute: 0.5}),
      );

      expect(conditions.attribute<_TestAttribute>(), equals(0.5));
    });

    test('are equal', () {
      final attribute = _TestAttribute();
      final conditions1 = TerrainConditions(
        UnmodifiableMapView({attribute: 0.5}),
      );
      final conditions2 = TerrainConditions(
        UnmodifiableMapView({attribute: 0.5}),
      );

      expect(conditions1, conditions2);
    });

    test('hashCode', () {
      final attribute = _TestAttribute();
      final map = UnmodifiableMapView({attribute: 0.5});
      final conditions = TerrainConditions(map);

      expect(conditions.hashCode, map.hashCode);
    });

    test('toString', () {
      final conditions = TerrainConditions(
        UnmodifiableMapView({_TestAttribute(): 0.5}),
      );

      expect(conditions.toString(), 'TerrainConditions: test=0.5');
    });
  });
}
