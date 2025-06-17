// Copyright (c) DEFI, LDA
// SPDX-License-Identifier: Apache-2.0

#[allow(unused_use, unused_const, unused_variable, unused_field, unused_let_mut)]
module blizzard::blizzard_treasury;

use blizzard::blizzard_errors as errors;
use sui::{coin::TreasuryCap, dynamic_object_field as dof};

// === Structs ===

public struct Key() has copy, drop, store;

public struct BlizzardTreasury<phantom T> has key, store {
    id: UID,
}