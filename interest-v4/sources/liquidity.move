#[allow(unused_use, unused_field)]
module interest_v4::interest_v4_liquidity;

use interest_v4::{i32::I32, position::{Self, Position}, tick::TickMap};

// === Structs ===

public struct InterestV4Liquidity has store {
    pool: address,
    liquidity: u128,
    positions: vector<Position>,
    tokens_owed_0: u64,
    tokens_owed_1: u64,
    rewards_owed: vector<u64>,
    tick_spacing: I32,
}
