// Copyright (c) DEFI, LDA
// SPDX-License-Identifier: Apache-2.0

#[allow(unused_use, unused_const, unused_variable, unused_field, unused_let_mut)]
module blizzard::blizzard_events;

use std::type_name::{Self, TypeName};

// === Structs ===

public struct StartSuperAdminTransfer has copy, drop {
    new_admin: address,
    start: u64,
}

public struct FinishSuperAdminTransfer(address) has copy, drop;

public struct NewAdmin(address) has copy, drop;

public struct RevokeAdmin(address) has copy, drop;

public struct NewLST has copy, drop {
    lst: TypeName,
    inner_state: address,
    state: address,
    metadata: address,
    wal_epoch: u32,
}

public struct Mint has copy, drop {
    wal_value: u64,
    lst_value: u64,
    fee: u64,
    protocol_fee: u64,
    node_id: address,
    lst: TypeName,
    wal_epoch: u32,
}

public struct MintAfterVotesFinished has copy, drop {
    wal_value: u64,
    fee: u64,
    protocol_fee: u64,
    node_id: address,
    lst: TypeName,
    wal_epoch: u32,
    activation_epoch: u32,
}

public struct BurnBlizzardStakeNFT has copy, drop {
    node_id: address,
    lst: TypeName,
    wal_epoch: u32,
    activation_epoch: u32,
    wal_value: u64,
    lst_value: u64,
}

public struct BurnLst has copy, drop {
    lst: TypeName,
    wal_value: u64,
    lst_value: u64,
    fee: u64,
    protocol_fee: u64,
    wal_epoch: u32,
}

public struct Transmute has copy, drop {
    from_lst: TypeName,
    to_lst: TypeName,
    from_value: u64,
    to_value: u64,
    wal_value: u64,
    wal_epoch: u32,
    fee: u64,
    protocol_fee: u64,
}

public struct Pause(TypeName, u32) has copy, drop;

public struct Unpause(TypeName, u32) has copy, drop;

public struct NewFee has copy, drop {
    lst: TypeName,
    mint: u64,
    burn: u64,
    transmute: u64,
    protocol: u64,
    wal_epoch: u32,
}

public struct AddNode has copy, drop {
    node_id: address,
    lst: TypeName,
    wal_epoch: u32,
}

public struct RemoveNode has copy, drop {
    node_id: address,
    lst: TypeName,
    wal_epoch: u32,
}

public struct SyncExchangeRate has copy, drop {
    lst: TypeName,
    wal_epoch: u32,
    total_wal_value: u64,
    lst_value: u64,
}

public struct StakedWalAdded has copy, drop {
    node_id: address,
    lst: TypeName,
    staked_wal: address,
    activation_epoch: u32,
    value: u64,
    idx: u64,
    wal_epoch: u32,
    joined: bool,
}

public struct StakedWalRemoved has copy, drop {
    node_id: address,
    lst: TypeName,
    staked_wal: address,
    activation_epoch: u32,
    split: bool,
    principal: u64,
    total_wal_value: u64,
    wal_epoch: u32,
}