#[allow(unused_use, unused_field)]
module interest_v4::position;

use interest_v4::{i256::I256, i32::I32};

// === Structs ===

public struct Position has copy, drop, store {
    liquidity: u128,
    fee_growth_inside_0_last_x64: u128,
    fee_growth_inside_1_last_x64: u128,
    tick_lower: I32,
    tick_upper: I32,
    rewards_growth_inside_x64: vector<u128>,
}
