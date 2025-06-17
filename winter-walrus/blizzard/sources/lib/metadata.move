// Copyright (c) DEFI, LDA
// SPDX-License-Identifier: Apache-2.0

#[allow(unused_use, unused_const, unused_variable, unused_field, unused_let_mut)]
module blizzard::blizzard_metadata;

use std::{ascii::String as ASCIIString, string::String as UTF8String};
use sui::{coin::CoinMetadata, url::Url};

// === Structs ===

public struct BlizzardMetadata has copy, drop, store {
    name: UTF8String,
    symbol: ASCIIString,
    description: UTF8String,
    icon_url: Option<Url>,
    decimals: u8,
}