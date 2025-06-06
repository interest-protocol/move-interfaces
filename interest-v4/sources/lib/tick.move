#[allow(unused_use, unused_field)]
module interest_v4::tick;

use interest_v4::{i256::{Self, I256}, i32::I32, interest_v4_events};
use sui::linked_table::{Self, LinkedTable};

// === Structs ===

public struct TickMap has store {
    pool: address,
    inner: LinkedTable<I32, Tick>,
}

public struct Tick has copy, drop, store {
    value: I32,
    liquidity_gross: u128,
    liquidity_net: I256,
    fee_growth_outside_0_x64: u128,
    fee_growth_outside_1_x64: u128,
    tick_cumulative_outside: I256,
    seconds_per_liquidity_outside_x64: u256,
    seconds_outside: u64,
    reward_growths_outside_x64: vector<u128>,
    initialized: bool,
}
