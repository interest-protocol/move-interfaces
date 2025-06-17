// Copyright (c) DEFI, LDA
// SPDX-License-Identifier: Apache-2.0

#[allow(unused_use, unused_const, unused_variable, unused_field, unused_let_mut)]
module blizzard::blizzard_stake_nft;

use blizzard::{blizzard_errors as errors, blizzard_metadata::BlizzardMetadata};
use std::{ascii::String, type_name::{Self, TypeName}};
use sui::{display, package};
use walrus::staked_wal::StakedWal;

// === Structs ===

public struct BlizzardStakeNFT has key {
    id: UID,
    inner: StakedWal,
    symbol: String,
    type_name: TypeName,
    activation_epoch: u32,
    value: u64,
}

public struct BLIZZARD_STAKE_NFT() has drop;

// === Public Functions ===

public fun join(self: &mut BlizzardStakeNFT, other: BlizzardStakeNFT) {
    abort 0
}

public fun split(self: &mut BlizzardStakeNFT, amount: u64, ctx: &mut TxContext): BlizzardStakeNFT {
    abort 0
}

public fun keep(self: BlizzardStakeNFT, ctx: &mut TxContext) {
    abort 0
}

public fun split_and_keep(self: &mut BlizzardStakeNFT, amount: u64, ctx: &mut TxContext) {
    abort 0
}
