// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AuthViewmodel)
final authViewmodelProvider = AuthViewmodelProvider._();

final class AuthViewmodelProvider
    extends $NotifierProvider<AuthViewmodel, AsyncValue<UserModel>?> {
  AuthViewmodelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authViewmodelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authViewmodelHash();

  @$internal
  @override
  AuthViewmodel create() => AuthViewmodel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<UserModel>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<UserModel>?>(value),
    );
  }
}

String _$authViewmodelHash() => r'e79f2a836a9aa12faeb907888cd06eadf753139e';

abstract class _$AuthViewmodel extends $Notifier<AsyncValue<UserModel>?> {
  AsyncValue<UserModel>? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<UserModel>?, AsyncValue<UserModel>?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<UserModel>?, AsyncValue<UserModel>?>,
              AsyncValue<UserModel>?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
