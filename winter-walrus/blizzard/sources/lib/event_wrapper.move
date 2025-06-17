// Copyright (c) DEFI, LDA
// SPDX-License-Identifier: Apache-2.0

#[allow(unused_use, unused_const, unused_variable, unused_field, unused_let_mut)]
module blizzard::blizzard_event_wrapper;

use sui::event::emit;

// === Structs ===

public struct BlizzardEvent<T: copy + drop>(T) has copy, drop;
