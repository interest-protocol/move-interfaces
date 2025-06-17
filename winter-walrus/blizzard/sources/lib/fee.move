// Copyright (c) DEFI, LDA
// SPDX-License-Identifier: Apache-2.0

#[allow(unused_use, unused_const, unused_variable, unused_field, unused_let_mut)]
module blizzard::blizzard_fee;

use blizzard::{blizzard_constants as constants, blizzard_errors as errors};
use interest_bps::bps::{Self, BPS};

// === Structs ===

public struct BlizzardFee has copy, drop, store {
    mint: BPS,
    burn: BPS,
    transmute: BPS,
    protocol: BPS,
}

// === Public View Functions ===

public fun mint(self: &BlizzardFee): BPS {
    self.mint
}

public fun burn(self: &BlizzardFee): BPS {
    self.burn
}

public fun transmute(self: &BlizzardFee): BPS {
    self.transmute
}

public fun protocol(self: &BlizzardFee): BPS {
    self.protocol
}