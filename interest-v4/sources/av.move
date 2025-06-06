#[allow(unused_use, unused_field, unused_variable, unused_const)]
module interest_v4::allowed_versions;

use interest_access_control::access_control::AdminWitness;
use interest_v4::interest_v4::INTEREST_V4;
use sui::vec_set::{Self, VecSet};

// === Constants ===

const VERSION: u64 = 1;

const STATE_V1: u64 = 1;

// === Structs ===

public struct InterestV4AV has key {
    id: UID,
    allowed_versions: VecSet<u64>,
}

public struct AllowedVersions(vector<u64>) has drop;

// === Public View Functions ===

public fun get_allowed_versions(self: &InterestV4AV): AllowedVersions {
    abort 0
}

// === Admin Functions ===

public fun add(self: &mut InterestV4AV, _: &AdminWitness<INTEREST_V4>, version: u64) {
    abort 0
}

public fun remove(self: &mut InterestV4AV, _: &AdminWitness<INTEREST_V4>, version: u64) {
    abort 0
}
