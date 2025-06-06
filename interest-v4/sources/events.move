#[allow(unused_use, unused_field)]
module interest_v4::interest_v4_events;

use interest_v4::i32::I32;
use std::type_name::{Self, TypeName};

// === Structs ===

public struct NewPool has copy, drop {
    pool: address,
    config: address,
    state: address,
    base: TypeName,
    quote: TypeName,
    tick: I32,
    tick_spacing: u32,
    sqrt_price_x64: u128,
}

public struct Swap has copy, drop {
    pool: address,
    coin_in: TypeName,
    coin_out: TypeName,
    amount_in: u64,
    extra_in: u64,
    amount_out: u64,
    sqrt_price_x64: u128,
    liquidity: u128,
    tick: I32,
    fee_growth_global_0_x64: u128,
    fee_growth_global_1_x64: u128,
    protocol_fees: u64,
}

public struct NewFlashLoanFees has copy, drop {
    pool: address,
    base_fee: u128,
    quote_fee: u128,
}

public struct NewProtocolFees has copy, drop {
    pool: address,
    base: u128,
    quote: u128,
}

public struct AddLiquidity<RewardInfoMap: copy + drop> has copy, drop {
    pool: address,
    base: u64,
    quote: u64,
    liquidity: u128,
    fee_growth_global_0_x64: u128,
    fee_growth_global_1_x64: u128,
    reward_infos: RewardInfoMap,
}

public struct RemoveLiquidity<RewardInfoMap: copy + drop> has copy, drop {
    pool: address,
    base: u64,
    quote: u64,
    liquidity: u128,
    fee_growth_global_0_x64: u128,
    fee_growth_global_1_x64: u128,
    reward_infos: RewardInfoMap,
}

public struct Donate has copy, drop {
    pool: address,
    base: u64,
    quote: u64,
    liquidity: u128,
    fee_growth_global_0_x64: u128,
    fee_growth_global_1_x64: u128,
}

public struct CollectFees has copy, drop {
    pool: address,
    base: u64,
    quote: u64,
    base_coin: TypeName,
    quote_coin: TypeName,
}

public struct TickUpdate<T: copy + drop> has copy, drop {
    pool: address,
    tick: T,
}

public struct ClearTick has copy, drop {
    pool: address,
    tick: I32,
}

public struct Paused(address) has copy, drop;

public struct UnPaused(address) has copy, drop;

public struct FlashLoanRepay has copy, drop {
    pool: address,
    amount_0_borrowed: u64,
    amount_1_borrowed: u64,
    amount_0_repaid: u64,
    amount_1_repaid: u64,
    fee_amount_0: u64,
    fee_amount_1: u64,
    protocol_fee_amount_0: u64,
    protocol_fee_amount_1: u64,
}

public struct NewReward<RewardInfo: copy + drop> has copy, drop {
    pool: address,
    reward_info: RewardInfo,
}

public struct UpdateReward<RewardInfo: copy + drop> has copy, drop {
    pool: address,
    reward_info: RewardInfo,
}

public struct CollectReward<RewardInfo: copy + drop> has copy, drop {
    pool: address,
    reward_info: RewardInfo,
    reward_value: u64,
}
