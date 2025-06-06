#[allow(unused_use, unused_field)]
module interest_v4::tick_bit_map;

use interest_v4::i32::{Self, I32};
use sui::table::{Self, Table};

// === Structs ===

public struct TickBitMap has store {
    inner: Table<I32, u256>,
}
