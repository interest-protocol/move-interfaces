#[allow(unused_use, unused_const)]
module interest_v4::tick_range;

use interest_v4::i32::{Self, I32};

// === Constants ===

const TICK_UPPER_VALUE_SHIFT: u8 = 32;
const TICK_LOWER_FLAG_BIT: u8 = 64;
const TICK_UPPER_FLAG_BIT: u8 = 65;

