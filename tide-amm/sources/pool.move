#[allow(unused_variable, unused_field, unused_type_parameter)]
module tide_amm::tide_amm;

use interest_access_control::access_control::AdminWitness;
use pyth::price_info::PriceInfoObject;
use std::type_name::TypeName;
use sui::{clock::Clock, coin::{CoinMetadata, Coin}, table::Table};

// === Structs ===

public struct TIDE_AMM() has drop;

public struct BalanceKey<phantom CoinType>() has copy, drop, store;

public struct TidePool has key {
    id: UID,
    x: TypeName,
    y: TypeName,
    virtual_x_liquidity: u256,
    blacklist: Table<address, bool>,
    fee_x: u256,
    fee_y: u256,
    decimals_x: u256,
    decimals_y: u256,
    /// seconds
    max_age: u64,
    max_deviation_percentage: u256,
    x_y_paused: bool,
    y_x_paused: bool,
    version: u64,
    feed_x: address,
    feed_y: address,
}

public struct Registry has key {
    id: UID,
    pools: vector<address>,
}
// === Public Functions ===

public fun balances<X, Y>(pool: &TidePool): (u64, u64) {
    abort
}

public fun virtual_balances<X, Y>(
    pool: &TidePool,
    clock: &Clock,
    price_info_object_x: &PriceInfoObject,
    price_info_object_y: &PriceInfoObject,
): (u256, u256) {
    abort
}

/// @returns (amount_in, amount_out, fee)
/// amount_in is the amount of CoinIn added to the pool. The pool does not necessarily consume all desired_amount_in.
/// amount_out is the amount of CoinOut received.
/// fee is the fee paid to the pool in CoinOut.
public fun quote<CoinIn, CoinOut>(
    pool: &mut TidePool,
    clock: &Clock,
    price_info_object_x: &PriceInfoObject,
    price_info_object_y: &PriceInfoObject,
    desired_amount_in: u64,
): (u64, u64, u64) {
    abort
}

public fun swap<CoinIn, CoinOut>(
    pool: &mut TidePool,
    clock: &Clock,
    price_info_object_x: &PriceInfoObject,
    price_info_object_y: &PriceInfoObject,
    coin_in: Coin<CoinIn>,
    ctx: &mut TxContext,
): (Coin<CoinIn>, Coin<CoinOut>) {
    abort
}

// === Manager Role Functions ===

public fun set_virtual_x_liquidity(
    pool: &mut TidePool,
    virtual_x_liquidity: u256,
    admin_witness: &AdminWitness<TIDE_AMM>,
    _: &mut TxContext,
) {
    abort
}

public fun set_fee_x(
    pool: &mut TidePool,
    fee_x: u256,
    admin_witness: &AdminWitness<TIDE_AMM>,
    _: &mut TxContext,
) {
    abort
}

public fun set_fee_y(
    pool: &mut TidePool,
    fee_y: u256,
    admin_witness: &AdminWitness<TIDE_AMM>,
    _: &mut TxContext,
) {
    abort
}

public fun set_pause_x_y(
    pool: &mut TidePool,
    pause: bool,
    admin_witness: &AdminWitness<TIDE_AMM>,
    _: &mut TxContext,
) {
    abort
}

public fun set_pause_y_x(
    pool: &mut TidePool,
    pause: bool,
    admin_witness: &AdminWitness<TIDE_AMM>,
    _: &mut TxContext,
) {
    abort
}

public fun add_to_blacklist(
    pool: &mut TidePool,
    address: address,
    admin_witness: &AdminWitness<TIDE_AMM>,
    _: &mut TxContext,
) {
    abort
}

public fun remove_from_blacklist(
    pool: &mut TidePool,
    address: address,
    admin_witness: &AdminWitness<TIDE_AMM>,
    _: &mut TxContext,
) {
    abort
}

// === Owner Role Functions ===

public fun new<X, Y>(
    registry: &mut Registry,
    x_metadata: &CoinMetadata<X>,
    y_metadata: &CoinMetadata<Y>,
    virtual_x_liquidity: u256,
    feed_x: address,
    feed_y: address,
    admin_witness: &AdminWitness<TIDE_AMM>,
    ctx: &mut TxContext,
): TidePool {
    abort
}

public fun share(pool: TidePool) {
    transfer::share_object(pool);
}

public fun set_max_age(
    pool: &mut TidePool,
    max_age: u64,
    admin_witness: &AdminWitness<TIDE_AMM>,
    _: &mut TxContext,
) {
    abort
}

public fun set_max_deviation_percentage(
    pool: &mut TidePool,
    max_deviation_percentage: u256,
    admin_witness: &AdminWitness<TIDE_AMM>,
    _: &mut TxContext,
) {
    abort
}

public fun deposit<X, Y>(
    pool: &mut TidePool,
    coin_x: Coin<X>,
    coin_y: Coin<Y>,
    admin_witness: &AdminWitness<TIDE_AMM>,
    _: &mut TxContext,
) {
    abort
}

public fun withdraw<X, Y>(
    pool: &mut TidePool,
    amount_x: u64,
    amount_y: u64,
    admin_witness: &AdminWitness<TIDE_AMM>,
    ctx: &mut TxContext,
): (Coin<X>, Coin<Y>) {
    abort
}
