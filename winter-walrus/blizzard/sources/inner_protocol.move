// Copyright (c) DEFI, LDA
// SPDX-License-Identifier: Apache-2.0

#[allow(unused_use, unused_const, unused_variable, unused_field, unused_let_mut)]
module blizzard::blizzard_inner_protocol;

use blizzard::{
    blizzard_acl,
    blizzard_allowed_versions::AllowedVersions,
    blizzard_big_vector::BigVector,
    blizzard_constants as constants,
    blizzard_errors as errors,
    blizzard_events,
    blizzard_extended_field::{Self, ExtendedField},
    blizzard_fee::{Self, BlizzardFee},
    blizzard_historic_rate::{Self, HistoricRate},
    blizzard_metadata::{Self, BlizzardMetadata},
    blizzard_node::{Self, BlizzardNode},
    blizzard_stake_nft::{Self, BlizzardStakeNFT},
    blizzard_treasury::{Self, BlizzardTreasury},
    blizzard_withdraw_ix::IX
};
use interest_bps::bps::BPS;
use wwal::wwal::WWAL;
use sui::{
    balance::{Self, Balance},
    coin::{Coin, TreasuryCap, CoinMetadata},
    vec_map::{Self, VecMap},
    vec_set::{Self, VecSet}
};
use wal::wal::WAL;
use walrus::{staked_wal::StakedWal, staking::Staking};
use std::string;
use std::ascii;

// === Structs ===

public struct FeeBalances<phantom T> has store {
    fee: Balance<T>,
    protocol: Balance<T>,
}

public struct BlizzardStateV1<phantom T> has key, store {
    id: UID,
    paused: bool,
    wal_fees: FeeBalances<WAL>,
    lst_fees: FeeBalances<T>,
    historic_rate: HistoricRate,
    treasury: BlizzardTreasury<T>,
    total_wal_value: u64,
    allowed_nodes: VecSet<ID>,
    nodes: ExtendedField<VecMap<ID, BlizzardNode>>,
    last_synced_epoch: u32,
    metadata: ExtendedField<BlizzardMetadata>,
    fee_config: BlizzardFee,
}