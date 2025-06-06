#[allow(unused_use, unused_field)]
module interest_v4::oracle;

use interest_v4::{i256::{Self, I256}, i32::I32};
use sui::table::{Self, Table};

// === Structs ===

public struct Observation has copy, drop, store {
    timestamp: u64,
    tick_cumulative: I256,
    seconds_per_liquidity_cumulative_x_64: u256,
    initialized: bool,
}

public struct Oracle has store {
    inner: Table<u64, Observation>,
}
