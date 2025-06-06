#[allow(unused_const)]
module interest_v4::errors;

// === Package Constants ===

#[test_only]
const OVERFLOW: u64 = 0;

#[test_only]
const UNDERFLOW: u64 = 1;

#[test_only]
const DIVISION_BY_ZERO: u64 = 2;

#[test_only]
const INVALID_INT_TO_UINT_CONVERSION: u64 = 3;

#[test_only]
const ZERO_VALUE: u64 = 4;

#[test_only]
const FEE_OVERFLOW: u64 = 5;

#[test_only]
const SQRT_PRICE_X64_OUT_OF_BOUNDS: u64 = 6;

#[test_only]
const TICK_OVERFLOW: u64 = 7;

#[test_only]
const INSANITY_CHECK: u64 = 8;

#[test_only]
const ZERO_AMOUNT: u64 = 9;

#[test_only]
const INVALID_TICK_SPACING: u64 = 10;

#[test_only]
const OLD_OBSERVATION: u64 = 11;

#[test_only]
const ORACLE_NOT_INITIALIZED: u64 = 12;

#[test_only]
const MAX_OBSERVATIONS: u64 = 13;

#[test_only]
const INVALID_POOL: u64 = 14;

#[test_only]
const POOL_PAUSED: u64 = 15;

#[test_only]
const LIQUIDITY_INVALID_POOL: u64 = 16;

#[test_only]
const LIQUIDITY_INVALID_DESTROY: u64 = 17;

#[test_only]
const TOO_MANY_POSITIONS: u64 = 18;

#[test_only]
const INVALID_COIN_PAIR: u64 = 19;

#[test_only]
const INVALID_TICK_ORDER: u64 = 20;

#[test_only]
const TICK_OUT_OF_BOUNDS: u64 = 21;

#[test_only]
const POOL_LOCKED: u64 = 22;

#[test_only]
const INVALID_POSITION_UPDATE: u64 = 23;

#[test_only]
const INVALID_LIQUIDITY_DELTA: u64 = 24;

#[test_only]
const ZERO_SWAP_AMOUNT: u64 = 25;

#[test_only]
const INVALID_PRICE_LIMIT: u64 = 26;

#[test_only]
const INVALID_AMOUNT_0_SIGN: u64 = 27;

#[test_only]
const INVALID_AMOUNT_1_SIGN: u64 = 28;

#[test_only]
const INVALID_AMOUNT_0_VALUE: u64 = 30;

#[test_only]
const INVALID_AMOUNT_1_VALUE: u64 = 31;

#[test_only]
const FLASH_LOAN_REPAY_INVALID_0_AMOUNT: u64 = 32;

#[test_only]
const FLASH_LOAN_REPAY_INVALID_1_AMOUNT: u64 = 33;

#[test_only]
const MAX_REWARDS_REACHED: u64 = 34;

#[test_only]
const TICK_NOT_INITIALIZED: u64 = 35;

#[test_only]
const REMOVE_CURRENT_VERSION_NOT_ALLOWED: u64 = 36;

#[test_only]
const OUTDATED_PACKAGE_VERSION: u64 = 37;
