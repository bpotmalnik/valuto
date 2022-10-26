// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:accounts_repository/accounts_repository.dart';
// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccountsRepository', () {
    test('can be instantiated', () {
      expect(AccountsRepository(), isNotNull);
    });
  });
}