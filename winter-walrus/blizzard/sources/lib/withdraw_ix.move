// Copyright (c) DEFI, LDA
// SPDX-License-Identifier: Apache-2.0

#[allow(unused_use, unused_const, unused_variable, unused_field, unused_let_mut)]
module blizzard::blizzard_withdraw_ix;

// === Structs ===

public struct EpochValue has copy, drop, store {
    epoch: u32,
    value: u64,
}

public struct IX has copy, drop, store {
    node_id: ID,
    epoch_values: vector<EpochValue>,
}

// === Public Functions ===

public fun new_epoch_value_vector(epochs: vector<u32>, values: vector<u64>): vector<EpochValue> {
    abort 0
}

public fun new_ix(node_id: ID, epoch_values: vector<EpochValue>): IX {
    abort 0
}