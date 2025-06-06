#[allow(unused_use, unused_field, unused_variable)]
module interest_v4::interest_v4_config;

use interest_access_control::access_control::AdminWitness;
use interest_v4::{fee::{Self, Fee}, interest_v4::INTEREST_V4, interest_v4_events};
use std::type_name::{Self, TypeName};
use sui::{balance::{Self, Balance}, coin::{CoinMetadata, Coin}, dynamic_field as df};

// === Structs ===

public struct BalanceKey(TypeName) has copy, drop, store;

public struct InterestV4Config has key {
    id: UID,
    pool: address,
    base_protocol_fee: Fee,
    quote_protocol_fee: Fee,
    flash_loan_base_fee: Fee,
    flash_loan_quote_fee: Fee,
    paused: bool,
}

// === Admin Functions ===

public fun set_base_protocol_fee(
    self: &mut InterestV4Config,
    new_fee: u128,
    _: &AdminWitness<INTEREST_V4>,
) {
    abort 0
}

public fun set_quote_protocol_fee(
    self: &mut InterestV4Config,
    new_fee: u128,
    _: &AdminWitness<INTEREST_V4>,
) {
    abort 0
}

public fun set_flash_loan_base_fee(
    self: &mut InterestV4Config,
    new_fee: u128,
    _: &AdminWitness<INTEREST_V4>,
) {
    abort 0
}

public fun set_flash_loan_quote_fee(
    self: &mut InterestV4Config,
    new_fee: u128,
    _: &AdminWitness<INTEREST_V4>,
) {
    abort 0
}

public fun collect<Base, Quote>(
    self: &mut InterestV4Config,
    _: &AdminWitness<INTEREST_V4>,
    ctx: &mut TxContext,
): (Coin<Base>, Coin<Quote>) { abort 0 }

public fun pause(self: &mut InterestV4Config, _: &AdminWitness<INTEREST_V4>) {
    abort 0
}

public fun unpause(self: &mut InterestV4Config, _: &AdminWitness<INTEREST_V4>) {
    abort 0
}
