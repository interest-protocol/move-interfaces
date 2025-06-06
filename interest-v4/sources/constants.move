#[allow(unused_const)]
module interest_v4::constants;

// === Package Constants ===

#[test_only]
const MAX_U8: u8 = 255;

#[test_only]
const MAX_U16: u16 = 65535;

#[test_only]
const MAX_U32: u32 = 4294967295;

#[test_only]
const MAX_U64: u64 = 18446744073709551615;

#[test_only]
const MAX_U128: u128 = 340282366920938463463374607431768211455;

#[test_only]
const MAX_U256: u256 =
    115792089237316195423570985008687907853269984665640564039457584007913129639935;

#[test_only]
const MAX_I32: u32 = 0x7FFFFFFF;

#[test_only]
const MIN_I32: u32 = 0x80000000;

#[test_only]
const MAX_I128: u128 = 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;

#[test_only]
const MIN_I128: u128 = 0x80000000000000000000000000000000;

#[test_only]
const MAX_I256: u256 = 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;

#[test_only]
const MIN_I256: u256 = 0x8000000000000000000000000000000000000000000000000000000000000000;

#[test_only]
const LESS: u8 = 0;

#[test_only]
const EQUAL: u8 = 1;

#[test_only]
const GREATER: u8 = 2;

#[test_only]
const MIN_SQRT_PRICE_X64: u128 = 4295048016;

#[test_only]
const MAX_SQRT_PRICE_X64: u128 = 79226673515401279992447579061;

#[test_only]
const Q64: u256 = 0x10000000000000000;

#[test_only]
const MAX_TICK: u32 = 443636;

#[test_only]
const DEFAULT_REWARDS_VECTOR: vector<u64> = vector[0, 0, 0, 0, 0];

#[test_only]
const MAX_ORACLE_OBSERVATIONS: u64 = 65535;

#[test_only]
const TWO_POW_64: u256 = 0x10000000000000000;

#[test_only]
const INITIAL_ADMIN_DELAY: u64 = 3;

#[test_only]
const MAX_POSITIONS: u64 = 200;

#[test_only]
const MAX_REWARDS: u64 = 5;
