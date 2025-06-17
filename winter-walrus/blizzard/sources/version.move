// Copyright (c) DEFI, LDA
// SPDX-License-Identifier: Apache-2.0

#[allow(unused_use, unused_const, unused_variable, unused_field, unused_let_mut)]
module blizzard::blizzard_allowed_versions;

use blizzard::{blizzard::BLIZZARD, blizzard_acl::AdminWitness, blizzard_errors as errors};
use sui::vec_set::{Self, VecSet};

// === Structs ===

public struct BlizzardAV has key {
    id: UID,
    allowed_versions: VecSet<u64>,
}

public struct AllowedVersions(vector<u64>) has drop;

// === Public View Functions ===

public fun get_allowed_versions(self: &BlizzardAV): AllowedVersions {
    abort 0
}

// === Admin Functions ===

public fun add(self: &mut BlizzardAV, _: &AdminWitness<BLIZZARD>, version: u64) {
    abort 0
}

public fun remove(self: &mut BlizzardAV, _: &AdminWitness<BLIZZARD>, version: u64) {
    abort 0
}