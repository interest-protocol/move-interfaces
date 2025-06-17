// Copyright (c) DEFI, LDA
// SPDX-License-Identifier: Apache-2.0

// @dev Taken from https://github.com/Typus-Lab/sips-big_vector/tree/98b65272cb621d2e3ac48ac2dbdc2dd9046857ec/assets/sip-big_vector
#[allow(unused_use, unused_const, unused_variable, unused_field, unused_let_mut)]
module blizzard::blizzard_big_vector;

use blizzard::blizzard_errors as errors;
use sui::dynamic_field as df;

// === Structs ===

public struct BigVector<phantom Element: store> has key, store {
    id: UID,
    slice_idx: u64,
    slice_size: u32,
    length: u64,
}

public struct Slice<Element: store> has drop, store {
    idx: u64,
    vector: vector<Element>,
}

// === Public View Functions ===

public fun length<Element: store>(bv: &BigVector<Element>): u64 {
    abort 0
}

public fun slice_idx<Element: store>(bv: &BigVector<Element>): u64 {
    abort 0
}

public fun slice_size<Element: store>(bv: &BigVector<Element>): u32 {
    abort 0
}

public fun is_empty<Element: store>(bv: &BigVector<Element>): bool {
    abort 0
}

public fun get_slice_idx<Element: store>(slice: &Slice<Element>): u64 {
    abort 0
}

public fun get_slice_length<Element: store>(slice: &Slice<Element>): u64 {
    abort 0
}

#[syntax(index)]
public fun borrow<Element: store>(bv: &BigVector<Element>, i: u64): &Element {
    abort 0
}

public fun borrow_slice<Element: store>(bv: &BigVector<Element>, slice_idx: u64): &Slice<Element> {
    abort 0
}

public fun borrow_from_slice<Element: store>(slice: &Slice<Element>, i: u64): &Element {
    abort 0
}

public macro fun for_each_ref<$Element: store>($bv: &BigVector<$Element>, $f: |&$Element|) {
    abort 0
}
