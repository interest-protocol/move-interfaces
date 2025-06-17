// Copyright (c) DEFI, LDA
// SPDX-License-Identifier: Apache-2.0

#[allow(unused_use, unused_const, unused_variable, unused_field, unused_let_mut)]
module blizzard::blizzard_acl;

use blizzard::{blizzard_errors as errors, blizzard_events as events};
use std::u64;
use sui::vec_set::{Self, VecSet};

// === Constants ===

// @dev Each epoch is roughly 1 day
const THREE_EPOCHS: u64 = 3;

// === Structs ===

public struct AdminWitness<phantom T>() has drop;

public struct BlizzardSuperAdmin<phantom T> has key {
    id: UID,
    new_admin: address,
    start: u64,
}

public struct BlizzardAdmin<phantom T> has key, store {
    id: UID,
}

public struct BlizzardACL<phantom T> has key {
    id: UID,
    admins: VecSet<address>,
}

// === Admin Operations ===

public fun new_admin<T>(
    acl: &mut BlizzardACL<T>,
    _: &BlizzardSuperAdmin<T>,
    ctx: &mut TxContext,
): BlizzardAdmin<T> {
    abort 0
}

public fun new_and_transfer<T>(
    acl: &mut BlizzardACL<T>,
    super_admin: &BlizzardSuperAdmin<T>,
    new_admin: address,
    ctx: &mut TxContext,
) {
    abort 0
}

public fun revoke<T>(acl: &mut BlizzardACL<T>, _: &BlizzardSuperAdmin<T>, old_admin: address) {
    abort 0
}

public fun is_admin<T>(acl: &BlizzardACL<T>, admin: address): bool {
    abort 0
}

public fun sign_in<T>(acl: &BlizzardACL<T>, admin: &BlizzardAdmin<T>): AdminWitness<T> {
    abort 0
}

public fun destroy_admin<T>(acl: &mut BlizzardACL<T>, admin: BlizzardAdmin<T>) {
    abort 0
}

// === Transfer Super Admin ===

public fun start_transfer<T>(
    super_admin: &mut BlizzardSuperAdmin<T>,
    new_admin: address,
    ctx: &mut TxContext,
) {
    abort 0
}

public fun finish_transfer<T>(mut super_admin: BlizzardSuperAdmin<T>, ctx: &mut TxContext) {
    abort 0
}

// @dev This is irreversible, the contract does not offer a way to create a new super admin
public fun destroy<T>(super_admin: BlizzardSuperAdmin<T>) {
    abort 0
}