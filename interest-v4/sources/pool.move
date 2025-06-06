#[allow(unused_use, unused_variable, unused_type_parameter, unused_field)]
module interest_v4::interest_v4_pool;

use interest_v4::{
    allowed_versions,
    i256::I256,
    i32::I32,
    interest_v4_config::{Self, InterestV4Config},
    interest_v4_liquidity::InterestV4Liquidity,
    interest_v4_pool_inner::{Self, InterestV4InnerPool, FlashLoan}
};
use std::type_name::TypeName;
use sui::{
    balance::Balance,
    clock::Clock,
    coin::{CoinMetadata, Coin},
    dynamic_field as df,
    table::Table
};

// === Structs ===

public struct StateKey(u64) has copy, drop, store;

// === Public Mutative DEX Functions Start ===

public fun new<Base, Quote>(
    pool: &mut UID,
    clock: &Clock,
    base_metadata: &CoinMetadata<Base>,
    quote_metadata: &CoinMetadata<Quote>,
    sqrt_price_x64: u128,
    tick_spacing: u32,
    ctx: &mut TxContext,
) {
    abort 0
}

public fun swap<CoinIn, CoinOut>(
    pool: &mut UID,
    config: &mut InterestV4Config,
    clock: &Clock,
    coin_in: Coin<CoinIn>,
    sqrt_price_limit_x64: u128,
    ctx: &mut TxContext,
): (Coin<CoinIn>, Coin<CoinOut>) {
    abort 0
}

public fun new_liquidity<Base, Quote>(
    pool: &mut UID,
    config: &InterestV4Config,
    clock: &Clock,
    _: &mut TxContext,
): InterestV4Liquidity {
    abort 0
}

public fun add_liquidity<Base, Quote>(
    pool: &mut UID,
    config: &InterestV4Config,
    clock: &Clock,
    liquidity: &mut InterestV4Liquidity,
    base: Coin<Base>,
    quote: Coin<Quote>,
    new_positions: vector<u128>,
    liquidity_delta_table: Table<u64, u128>,
    ctx: &mut TxContext,
): (Coin<Base>, Coin<Quote>) {
    abort 0
}

public fun remove_liquidity<Base, Quote>(
    pool: &mut UID,
    config: &InterestV4Config,
    clock: &Clock,
    liquidity: &mut InterestV4Liquidity,
    liquidity_delta_table: Table<u64, u128>,
    ctx: &mut TxContext,
): (Coin<Base>, Coin<Quote>) {
    abort 0
}

public fun collect_fees<Base, Quote>(
    pool: &mut UID,
    config: &InterestV4Config,
    liquidity: &mut InterestV4Liquidity,
    ctx: &mut TxContext,
): (Coin<Base>, Coin<Quote>) {
    abort 0
}

public fun collect_reward<Base, Quote, Reward>(
    pool: &mut UID,
    config: &InterestV4Config,
    clock: &Clock,
    liquidity: &mut InterestV4Liquidity,
    ctx: &mut TxContext,
): Coin<Reward> {
    abort 0
}

public fun donate<Base, Quote>(
    pool: &mut UID,
    config: &InterestV4Config,
    base: Coin<Base>,
    quote: Coin<Quote>,
    _: &mut TxContext,
) {
    abort 0
}

public fun add_reward<Base, Quote, Reward>(
    pool: &mut UID,
    config: &InterestV4Config,
    clock: &Clock,
    reward: Coin<Reward>,
    _: &mut TxContext,
) {
    abort 0
}

// === Public Mutative DEX Functions End ===

// === View Functions Start ===

public fun quote_swap<CoinIn, CoinOut>(
    pool: &mut UID,
    config: &InterestV4Config,
    clock: &Clock,
    value_in: I256,
    sqrt_price_limit_x64: u128,
): (I256, I256) {
    abort 0
}

public fun snapshot_cumulatives_inside(
    pool: &UID,
    clock: &Clock,
    tick_lower: I32,
    tick_upper: I32,
): (I256, u256, u64) {
    abort 0
}

public fun base(pool: &UID): TypeName {
    abort 0
}

public fun quote(pool: &UID): TypeName {
    abort 0
}

public fun tick_spacing(pool: &UID): u32 {
    abort 0
}

public fun sqrt_price_x64(pool: &UID): u128 {
    abort 0
}

public fun tick(pool: &UID): I32 {
    abort 0
}

public fun liquidity(pool: &UID): u128 {
    abort 0
}

public fun rewards(pool: &UID): vector<TypeName> {
    abort 0
}

public fun observe(
    pool: &mut UID,
    clock: &Clock,
    seconds_ago: vector<u64>,
): (vector<I256>, vector<u256>) {
    abort 0
}

public fun pending_fees(pool: &mut UID, liquidity: &mut InterestV4Liquidity): (u64, u64) {
    abort 0
}

public fun pending_rewards(
    pool: &mut UID,
    clock: &Clock,
    liquidity: &mut InterestV4Liquidity,
): vector<u64> {
    abort 0
}

// === View Functions End ===

// === Dangerous accessors Start ===

public fun balance_mut<CoinType>(pool: &mut UID): &mut Balance<CoinType> {
    abort 0
}

public fun new_reward<Base, Quote, Reward>(
    pool: &mut UID,
    config: &InterestV4Config,
    clock: &Clock,
    reward: Coin<Reward>,
    rewards_per_second: u64,
    _: &mut TxContext,
) {
    abort 0
}

public fun update_emissions_per_second<Base, Quote, Reward>(
    pool: &mut UID,
    config: &InterestV4Config,
    clock: &Clock,
    emissions_per_second: u64,
    _: &mut TxContext,
) {
    abort 0
}

// === Dangerous accessors End ===

// === Flash Loan Functions Start ===

public fun flash_loan_amounts_owed(flash_loan: &FlashLoan): (u64, u64) {
    abort 0
}

public fun flash_loan<Base, Quote>(
    pool: &mut UID,
    config: &InterestV4Config,
    amount_0: u64,
    amount_1: u64,
    ctx: &mut TxContext,
): (FlashLoan, Coin<Base>, Coin<Quote>) {
    abort 0
}

public fun repay<Base, Quote>(
    pool: &mut UID,
    config: &mut InterestV4Config,
    flash_loan: FlashLoan,
    base: Coin<Base>,
    quote: Coin<Quote>,
    _: &mut TxContext,
) {
    abort 0
}

// === Flash Loan Functions End ===
