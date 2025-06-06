#[allow(unused_use, unused_variable, unused_field)]
module interest_v4::i32;

// === Structs ===

public struct I32(u32) has copy, drop, store;

// === Public Functions ===

public fun zero(): I32 {
    abort 0
}

public fun one(): I32 {
    abort 0
}

public fun to_pure(self: I32): (bool, u32) {
    abort 0
}

public fun to_u32(self: I32): u32 {
    abort 0
}

public fun to_u64(self: I32): u64 {
    abort 0
}

public fun is_negative(self: I32): bool {
    abort 0
}

public fun is_positive(self: I32): bool {
    abort 0
}

public fun is_zero(self: I32): bool {
    abort 0
}

public fun negative_from_u32(value: u32): I32 {
    abort 0
}

public fun negative_from_u64(value: u64): I32 {
    abort 0
}

public fun from_u32(value: u32): I32 {
    abort 0
}

public fun from_u64(value: u64): I32 {
    abort 0
}

public fun eq(self: I32, other: I32): bool {
    abort 0
}

public fun lt(self: I32, other: I32): bool {
    abort 0
}

public fun gt(self: I32, other: I32): bool {
    abort 0
}

public fun lte(self: I32, other: I32): bool {
    abort 0
}

public fun gte(self: I32, other: I32): bool {
    abort 0
}

public fun value(self: I32): u32 {
    abort 0
}

public fun max(): I32 {
    abort 0
}

public fun min(): I32 {
    abort 0
}

public fun from_u8(value: u8): I32 {
    abort 0
}

public fun from_u128(value: u128): I32 {
    abort 0
}

public fun negative_from_u128(value: u128): I32 {
    abort 0
}

public fun to_u128(self: I32): u128 {
    abort 0
}

public fun to_u256(self: I32): u256 {
    abort 0
}

public fun abs(self: I32): I32 {
    abort 0
}

public macro fun clamp($self: I32, $min: I32, $max: I32): I32 {
    abort 0
}

public fun add(self: I32, other: I32): I32 {
    abort 0
}

public fun sub(self: I32, other: I32): I32 {
    abort 0
}

public fun mul(self: I32, other: I32): I32 {
    abort 0
}

public fun div_down(self: I32, other: I32): I32 {
    abort 0
}

public fun div_up(self: I32, other: I32): I32 {
    abort 0
}

public fun mod(self: I32, other: I32): I32 {
    abort 0
}

public fun wrapping_add(self: I32, other: I32): I32 {
    abort 0
}

public fun wrapping_sub(self: I32, other: I32): I32 {
    abort 0
}

public fun shr(self: I32, rhs: u8): I32 {
    abort 0
}

public fun shl(self: I32, lhs: u8): I32 {
    abort 0
}
