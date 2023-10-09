// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'use_http_request.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$useRequestHash() => r'26b0553a76f83ae36f69cace607c5f6ec0417e36';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [useRequest].
@ProviderFor(useRequest)
const useRequestProvider = UseRequestFamily();

/// See also [useRequest].
class UseRequestFamily extends Family<AsyncValue<dynamic>> {
  /// See also [useRequest].
  const UseRequestFamily();

  /// See also [useRequest].
  UseRequestProvider call(
    RequestOptions requestOptions,
  ) {
    return UseRequestProvider(
      requestOptions,
    );
  }

  @override
  UseRequestProvider getProviderOverride(
    covariant UseRequestProvider provider,
  ) {
    return call(
      provider.requestOptions,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'useRequestProvider';
}

/// See also [useRequest].
class UseRequestProvider extends AutoDisposeProvider<AsyncValue<dynamic>> {
  /// See also [useRequest].
  UseRequestProvider(
    RequestOptions requestOptions,
  ) : this._internal(
          (ref) => useRequest(
            ref as UseRequestRef,
            requestOptions,
          ),
          from: useRequestProvider,
          name: r'useRequestProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$useRequestHash,
          dependencies: UseRequestFamily._dependencies,
          allTransitiveDependencies:
              UseRequestFamily._allTransitiveDependencies,
          requestOptions: requestOptions,
        );

  UseRequestProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.requestOptions,
  }) : super.internal();

  final RequestOptions requestOptions;

  @override
  Override overrideWith(
    AsyncValue<dynamic> Function(UseRequestRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UseRequestProvider._internal(
        (ref) => create(ref as UseRequestRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        requestOptions: requestOptions,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<AsyncValue<dynamic>> createElement() {
    return _UseRequestProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UseRequestProvider &&
        other.requestOptions == requestOptions;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, requestOptions.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UseRequestRef on AutoDisposeProviderRef<AsyncValue<dynamic>> {
  /// The parameter `requestOptions` of this provider.
  RequestOptions get requestOptions;
}

class _UseRequestProviderElement
    extends AutoDisposeProviderElement<AsyncValue<dynamic>> with UseRequestRef {
  _UseRequestProviderElement(super.provider);

  @override
  RequestOptions get requestOptions =>
      (origin as UseRequestProvider).requestOptions;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
