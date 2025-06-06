#[allow(unused_use, unused_variable, unused_field)]
module interest_v4::i256;

use interest_v4::i32::{Self, I32};

// === Structs ===

public struct I256(u256) has copy, drop, store;

// === Public Functions ===

public fun zero(): I256 {
    abort 0
}

public fun to_pure(self: I256): (bool, u256) {
    abort 0
}

public fun to_u32(self: I256): u32 {
    abort 0
}

public fun to_u64(self: I256): u64 {
    abort 0
}

public fun to_u256(self: I256): u256 {
    abort 0
}

public fun abs(self: I256): I256 {
    abort 0
}

public fun add(self: I256, other: I256): I256 {
    abort 0
}

public fun sub(self: I256, other: I256): I256 {
    abort 0
}

public fun mul(self: I256, other: I256): I256 {
    abort 0
}

public fun div_down(self: I256, other: I256): I256 {
    abort 0
}

public fun div_up(self: I256, other: I256): I256 {
    abort 0
}

public fun is_negative(self: I256): bool {
    abort 0
}

public fun is_positive(self: I256): bool {
    abort 0
}

public fun is_zero(self: I256): bool {
    abort 0
}

public fun eq(self: I256, other: I256): bool {
    abort 0
}

public fun lt(self: I256, other: I256): bool {
    abort 0
}

public fun gt(self: I256, other: I256): bool {
    abort 0
}

public fun lte(self: I256, other: I256): bool {
    abort 0
}

public fun gte(self: I256, other: I256): bool {
    abort 0
}

public fun negative_from_u32(value: u32): I256 {
    abort 0
}

public fun negative_from_u64(value: u64): I256 {
    abort 0
}

public fun from_u8(value: u8): I256 {
    abort 0
}

public fun from_u32(value: u32): I256 {
    abort 0
}

public fun from_u64(value: u64): I256 {
    abort 0
}

public fun from_u128(value: u128): I256 {
    abort 0
}

public fun from_u256(value: u256): I256 {
    abort 0
}

public fun value(self: I256): u256 {
    abort 0
}

public fun one(): I256 {
    abort 0
}

public fun max(): I256 {
    abort 0
}

public fun min(): I256 {
    abort 0
}

public fun negative_from_u128(value: u128): I256 {
    abort 0
}

public fun negative_from_u256(value: u256): I256 {
    abort 0
}

public fun to_u128(self: I256): u128 {
    abort 0
}

public fun flip_sign(self: I256): I256 {
    abort 0
}

public fun mod(self: I256, other: I256): I256 {
    abort 0
}

public fun wrapping_add(self: I256, other: I256): I256 {
    abort 0
}

public fun wrapping_sub(self: I256, other: I256): I256 {
    abort 0
}

public fun shr(self: I256, rhs: u8): I256 {
    abort 0
}

public fun shl(self: I256, lhs: u8): I256 {
    abort 0
}
