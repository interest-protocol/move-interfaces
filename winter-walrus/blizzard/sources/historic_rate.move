// Copyright (c) DEFI, LDA
// SPDX-License-Identifier: Apache-2.0

#[allow(unused_use, unused_const, unused_variable, unused_field, unused_let_mut)]
module blizzard::blizzard_historic_rate;

use blizzard::blizzard_exchange_rate::ExchangeRate;
use sui::table::{Self, Table};

// === Structs ===

public struct HistoricRate has key, store {
    id: UID,
    exchange_rate: Table<u32, ExchangeRate>,
    initial_epoch: u32,
}