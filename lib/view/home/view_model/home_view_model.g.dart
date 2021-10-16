// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  Computed<bool>? _$isLevelNegativeComputed;

  @override
  bool get isLevelNegative =>
      (_$isLevelNegativeComputed ??= Computed<bool>(() => super.isLevelNegative,
              name: '_HomeViewModelBase.isLevelNegative'))
          .value;

  final _$modeAtom = Atom(name: '_HomeViewModelBase.mode');

  @override
  int get mode {
    _$modeAtom.reportRead();
    return super.mode;
  }

  @override
  set mode(int value) {
    _$modeAtom.reportWrite(value, super.mode, () {
      super.mode = value;
    });
  }

  final _$levelAtom = Atom(name: '_HomeViewModelBase.level');

  @override
  int get level {
    _$levelAtom.reportRead();
    return super.level;
  }

  @override
  set level(int value) {
    _$levelAtom.reportWrite(value, super.level, () {
      super.level = value;
    });
  }

  final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase');

  @override
  void setSelectedMode(int mod) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.setSelectedMode');
    try {
      return super.setSelectedMode(mod);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic incrementLevel() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.incrementLevel');
    try {
      return super.incrementLevel();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic decrementLevel() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.decrementLevel');
    try {
      return super.decrementLevel();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
mode: ${mode},
level: ${level},
isLevelNegative: ${isLevelNegative}
    ''';
  }
}
