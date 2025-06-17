// Copyright (c) DEFI, LDA
// SPDX-License-Identifier: Apache-2.0

#[allow(unused_use, unused_const, unused_variable, unused_field, unused_let_mut)]
module blizzard::blizzard_protocol;

use blizzard::{
    blizzard::BLIZZARD,
    blizzard_acl::AdminWitness,
    blizzard_allowed_versions::AllowedVersions,
    blizzard_big_vector::BigVector,
    blizzard_fee::BlizzardFee,
    blizzard_inner_protocol::{Self, BlizzardStateV1},
    blizzard_stake_nft::BlizzardStakeNFT,
    blizzard_withdraw_ix::IX
};
use std::ascii;
use std::string;
use wwal::wwal::WWAL;
use sui::{coin::{Coin, TreasuryCap, CoinMetadata}, dynamic_object_field as dof};
use wal::wal::WAL;
use walrus::{staked_wal::StakedWal, staking::Staking};

// === Structs ===

public struct Key() has copy, drop, store;

public struct BlizzardStaking<phantom T> has key {
    id: UID,
}

// === New LST Functions ===

public fun new<T>(
    walrus_staking: &Staking,
    coin_metadata: &CoinMetadata<T>,
    _: &AdminWitness<BLIZZARD>,
    coin_treasury: TreasuryCap<T>,
    super_admin_recipient: address,
    av: &AllowedVersions,
    ctx: &mut TxContext,
) {
    abort 0
}

// === Sync Function ===

public fun sync_exchange_rate<T>(self: &mut BlizzardStaking<T>, walrus_staking: &Staking) {
    abort 0
}

public fun sync_node_exchange_rate<T>(
    self: &mut BlizzardStaking<T>,
    walrus_staking: &Staking,
    node_id: ID,
) {
    abort 0
}

// === Staking Functions ===

public fun mint<T>(
    self: &mut BlizzardStaking<T>,
    walrus_staking: &mut Staking,
    wal_coin: Coin<WAL>,
    node_id: ID,
    av: &AllowedVersions,
    ctx: &mut TxContext,
): Coin<T> {
    abort 0
}

public fun mint_after_votes_finished<T>(
    self: &mut BlizzardStaking<T>,
    walrus_staking: &mut Staking,
    wal_coin: Coin<WAL>,
    node_id: ID,
    av: &AllowedVersions,
    ctx: &mut TxContext,
): BlizzardStakeNFT {
    abort 0
}

public fun burn_stake_nft<T>(
    self: &mut BlizzardStaking<T>,
    walrus_staking: &Staking,
    nft: BlizzardStakeNFT,
    av: &AllowedVersions,
    ctx: &mut TxContext,
): Coin<T> {
    abort 0
}

public fun burn_lst<T>(
    self: &mut BlizzardStaking<T>,
    walrus_staking: &mut Staking,
    lst_coin: Coin<T>,
    withdraw_ixs: vector<IX>,
    av: &AllowedVersions,
    ctx: &mut TxContext,
): (Coin<T>, vector<StakedWal>) {
    abort 0
}

// === Transmutation Functions ===

public fun transmute<T>(
    self: &mut BlizzardStaking<T>,
    wwal_staking: &mut BlizzardStaking<WWAL>,
    walrus_staking: &mut Staking,
    from_coin: Coin<T>,
    withdraw_ixs: vector<IX>,
    av: &AllowedVersions,
    ctx: &mut TxContext,
): (Coin<T>, Coin<WWAL>) {
    abort 0
}

// === View Functions ===

public fun to_lst_at_epoch<T>(
    self: &mut BlizzardStaking<T>,
    epoch: u32,
    value: u64,
    round_up: bool,
): Option<u64> {
    abort 0
}

public fun to_wal_at_epoch<T>(
    self: &mut BlizzardStaking<T>,
    epoch: u32,
    value: u64,
    round_up: bool,
): Option<u64> {
    abort 0
}

public fun allowed_nodes<T>(self: &mut BlizzardStaking<T>): vector<ID> {
    abort 0
}

public fun staked_wal_vector_at_node<T>(
    self: &mut BlizzardStaking<T>,
    node_id: &ID,
): &BigVector<StakedWal> {
    abort 0
}

public fun fee_config<T>(self: &mut BlizzardStaking<T>): &BlizzardFee {
    abort 0
}

// === Admin Functions ===

public fun claim_fees<T>(
    self: &mut BlizzardStaking<T>,
    _: &AdminWitness<T>,
    av: &AllowedVersions,
    ctx: &mut TxContext,
): (Coin<WAL>, Coin<T>) {
    abort 0
}

public fun claim_protocol_fees<T>(
    self: &mut BlizzardStaking<T>,
    _: &AdminWitness<BLIZZARD>,
    av: &AllowedVersions,
    ctx: &mut TxContext,
): (Coin<WAL>, Coin<T>) {
    abort 0
}

public fun pause<T>(
    self: &mut BlizzardStaking<T>,
    _: &AdminWitness<T>,
    av: &AllowedVersions,
    _ctx: &mut TxContext,
) {
    abort 0
}

public fun unpause<T>(
    self: &mut BlizzardStaking<T>,
    _: &AdminWitness<T>,
    av: &AllowedVersions,
    _ctx: &mut TxContext,
) {
    abort 0
}

public fun forceful_pause<T>(
    self: &mut BlizzardStaking<T>,
    _: &AdminWitness<BLIZZARD>,
    av: &AllowedVersions,
    _ctx: &mut TxContext,
) {
    abort 0
}

public fun set_mint_fee<T>(
    self: &mut BlizzardStaking<T>,
    _: &AdminWitness<T>,
    fee: u64,
    av: &AllowedVersions,
    _ctx: &mut TxContext,
) {
    abort 0
}

public fun set_burn_fee<T>(
    self: &mut BlizzardStaking<T>,
    _: &AdminWitness<T>,
    fee: u64,
    av: &AllowedVersions,
    _ctx: &mut TxContext,
) {
    abort 0
}

public fun set_transmute_fee<T>(
    self: &mut BlizzardStaking<T>,
    _: &AdminWitness<T>,
    fee: u64,
    av: &AllowedVersions,
    _ctx: &mut TxContext,
) {
    abort 0
}

public fun set_protocol_fee<T>(
    self: &mut BlizzardStaking<T>,
    _: &AdminWitness<BLIZZARD>,
    fee: u64,
    av: &AllowedVersions,
    _ctx: &mut TxContext,
) {
    abort 0
}

public fun add_node<T>(
    self: &mut BlizzardStaking<T>,
    _: &AdminWitness<T>,
    node_id: ID,
    av: &AllowedVersions,
    ctx: &mut TxContext,
) {
    abort 0
}

public fun remove_node<T>(
    self: &mut BlizzardStaking<T>,
    _: &AdminWitness<T>,
    node_id: ID,
    av: &AllowedVersions,
    ctx: &mut TxContext,
) {
    abort 0
}

public fun update_name<T>(
    self: &mut BlizzardStaking<T>,
    metadata: &mut CoinMetadata<T>,
    _: &AdminWitness<T>,
    name: string::String,
    av: &AllowedVersions,
    _ctx: &mut TxContext,
) {
    abort 0
}

public fun update_symbol<T>(
    self: &mut BlizzardStaking<T>,
    metadata: &mut CoinMetadata<T>,
    _: &AdminWitness<T>,
    symbol: ascii::String,
    av: &AllowedVersions,
    _ctx: &mut TxContext,
) {
    abort 0
}

public fun update_description<T>(
    self: &mut BlizzardStaking<T>,
    metadata: &mut CoinMetadata<T>,
    _: &AdminWitness<T>,
    description: string::String,
    av: &AllowedVersions,
    _ctx: &mut TxContext,
) {
    abort 0
}

public fun update_icon_url<T>(
    self: &mut BlizzardStaking<T>,
    metadata: &mut CoinMetadata<T>,
    _: &AdminWitness<T>,
    url: ascii::String,
    av: &AllowedVersions,
    _ctx: &mut TxContext,
) {
    abort 0
}

