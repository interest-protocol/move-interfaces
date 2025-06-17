// Copyright (c) DEFI, LDA
// SPDX-License-Identifier: Apache-2.0

module wwal::wwal;

use sui::{coin::create_currency, url::new_unsafe_from_bytes};

// === Structs ===

public struct WWAL() has drop;

// === Initializer ===

fun init(witness: WWAL, ctx: &mut TxContext) {
    let (treasury, metadata) = create_currency(
        witness,
        9,
        b"wWAL",
        b"❄️WAL",
        b"A Liquid Staking Wal Coin",
        option::some(
            new_unsafe_from_bytes(
                b"https://interestprotocol.infura-ipfs.io/ipfs/QmPLCVWv7citJSc813NbcbZnRSXAEJ4BWVKq4zK8pPVEWq",
            ),
        ),
        ctx,
    );

    transfer::public_transfer(treasury, ctx.sender());
    transfer::public_share_object(metadata);
}

// === Test Only Functions ===

#[test_only]
public fun init_for_test(ctx: &mut TxContext) {
    init(WWAL(), ctx);
}
