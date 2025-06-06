#[allow(unused_use, unused_field)]
module interest_v4::interest_v4_pool_inner;

use interest_v4::{
    fee::Fee,
    i256::{Self, I256},
    i32::{Self, I32},
    interest_v4_config::InterestV4Config,
    interest_v4_events,
    interest_v4_liquidity::{Self, InterestV4Liquidity},
    oracle::{Self, Oracle},
    position::Position,
    sqrt_price_math,
    tick::{Self, TickMap},
    tick_bit_map::{Self, TickBitMap}
};
use std::type_name::{Self, TypeName};
use sui::{
    balance::{Self, Balance},
    clock::Clock,
    coin::Coin,
    dynamic_field as df,
    table::Table,
    vec_map::{Self, VecMap}
};

// === Structs ===

public struct FlashLoan {
    pool: address,
    amount_0_owed: u64,
    amount_1_owed: u64,
    balance_0_before: u64,
    balance_1_before: u64,
}

public struct SwapCache has copy, drop, store {
    fee_protocol: Fee,
    liquidity_start: u128,
    timestamp: u64,
    tick_cumulative: I256,
    seconds_per_liquidity_cumulative_x64: u256,
    computed_latest_observation: bool,
}

public struct SwapState has copy, drop, store {
    amount_specified_remaining: I256,
    amount_calculated: I256,
    sqrt_price_x64: u128,
    tick: I32,
    fee_growth_global_x64: u128,
    protocol_fee: u64,
    liquidity: u128,
}

public struct StepComputations has copy, drop, store {
    sqrt_price_start_x64: u128,
    tick_next: I32,
    initialized: bool,
    sqrt_price_next_x64: u128,
    amount_in: u64,
    amount_out: u64,
    protocol_fee: u64,
}

public struct ModifyLiquidityAccumulator has copy, drop, store {
    positions: vector<Position>,
    amount_0: I256,
    amount_1: I256,
    tokens_owed_0: u64,
    tokens_owed_1: u64,
}

public struct RewardInfo has copy, drop, store {
    last_update_time: u64,
    emissions_per_second: u64,
    reward: TypeName,
    reward_growth_global_x64: u128,
    available_rewards: u64,
    index: u64,
}

public struct RewardBalanceKey(TypeName) has copy, drop, store;

public struct BalanceKey(TypeName) has copy, drop, store;

public struct InterestV4InnerPool has key, store {
    id: UID,
    pool: address,
    config: address,
    base: TypeName,
    quote: TypeName,
    tick_spacing: I32,
    max_liquidity_per_tick: u128,
    sqrt_price_x64: u128,
    tick: I32,
    observation_index: u64,
    observation_cardinality: u64,
    observation_cardinality_next: u64,
    fee_growth_global_0_x64: u128,
    fee_growth_global_1_x64: u128,
    liquidity: u128,
    rewards: vector<TypeName>,
    reward_info_map: VecMap<TypeName, RewardInfo>,
    tick_map: TickMap,
    tick_bit_map: TickBitMap,
    oracle: Oracle,
    unlocked: bool,
}
