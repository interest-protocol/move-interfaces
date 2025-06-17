// Copyright (c) DEFI, LDA
// SPDX-License-Identifier: Apache-2.0

#[allow(unused_use, unused_const, unused_variable, unused_field, unused_let_mut)]
module blizzard::blizzard_exchange_rate;

use interest_math::u128::{mul_div_down, mul_div_up};

// === Structs ===

public struct ExchangeRate has copy, drop, store {
    lst: u128,
    wal: u128,
}

