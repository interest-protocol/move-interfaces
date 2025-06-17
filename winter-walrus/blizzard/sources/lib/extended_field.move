// Copyright (c) DEFI, LDA
// SPDX-License-Identifier: Apache-2.0

// @dev Copy from https://github.com/MystenLabs/walrus-docs/blob/main/contracts/walrus/sources/utils/extended_field.move
#[allow(unused_use, unused_const, unused_variable, unused_field, unused_let_mut)]
module blizzard::blizzard_extended_field;

use sui::dynamic_field as df;

public struct ExtendedField<phantom T: store> has key, store { id: UID }

public struct Key() has copy, drop, store;

public fun new<T: store>(value: T, ctx: &mut TxContext): ExtendedField<T> {
    abort 0
}

public fun borrow<T: store>(field: &ExtendedField<T>): &T {
    abort 0
}

public fun borrow_mut<T: store>(field: &mut ExtendedField<T>): &mut T {
    abort 0
}

public fun swap<T: store>(field: &mut ExtendedField<T>, value: T): T {
    abort 0
}

public fun destroy<T: store>(field: ExtendedField<T>): T {
    abort 0
}
