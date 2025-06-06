#[allow(unused_use, unused_field)]
module interest_v4::swap_math;

use interest_v4::{fee::Fee, i256::I256, sqrt_price_math};

// === Structs ===

public struct SwapStep has copy, drop, store {
    sqrt_ratio_next_x69: u128,
    amount_in: u64,
    amount_out: u64,
    protocol_fee: u64,
}
