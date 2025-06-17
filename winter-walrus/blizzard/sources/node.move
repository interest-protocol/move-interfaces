// Copyright (c) DEFI, LDA
// SPDX-License-Identifier: Apache-2.0

#[allow(unused_use, unused_const, unused_variable, unused_field, unused_let_mut)]
module blizzard::blizzard_node;

use blizzard::{
    blizzard_big_vector::{Self, BigVector},
    blizzard_constants,
    blizzard_events,
    blizzard_withdraw_ix::EpochValue
};
use sui::table::{Self, Table};
use walrus::{staked_wal::StakedWal, staking::Staking as WalrusStaking};

// === Structs ===

public struct BlizzardNode has store {
    node_id: ID,
    staked_wal_vector: BigVector<StakedWal>,
    epoch_table: Table<u32, u64>,
    last_synced_epoch: u32,
    last_synced_wal_value: u64,
}