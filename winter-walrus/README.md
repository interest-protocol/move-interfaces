# Winter Walrus ❄️

Winter Walrus is a liquid staking protocol built on top of Walrus Native Staking.

## Overview

Winter Walrus is a framework to mint $WAL LSTs. Currently we support the LSTs below:

-   wWal: [native Winter Walrus LST](https://x.com/walrusLST).
-   upWal: by [Double Up](https://www.doubleup.fun/).
-   mWal: by [Studio Mirai](https://sm.xyz/)
-   pWal: by [Patara](https://patara.app/)
-   breadWal: by [Mr. Breadsmith](https://x.com/MrBreadSmith)
-   nWal by [Sui Nigeria Community](https://x.com/SuiNetworkNG)

Each LST issuer has full admin rights over it. They decide which validators to allocate to and the fees.

Winter Walrus frontend is available at [www.winterwalrus.com](https://www.winterwalrus.com/) and [open sourced on Github](https://github.com/interest-protocol/winterwalrus.com). Users experience near-instant Web2 UX with 0ms latency.

## Why?

Walrus uses a **delegated proof of Stake** for consensus. Users can natively stake WAL and receive a NFT named **StakedWal** that represents their position. The issue is that StakedWal is not fungible, you cannot use it to swap, lend or leverage.

Winter Walrus solves this issue by keeping custody of the **StakedWal** on a Shared Object to mint Liquid Staking Coins. Now users are able to interact with DeFi while earning passive staking income.

## Epoch Mechanics

Winter Walrus operates on a delegated proof-of-stake system structured into epochs, each lasting two weeks. The timing of staking within an epoch determines the rewards and type of asset received:

-   **Staking before 50% of epoch progress:** Users mint an LST and are eligible for the next epoch rewards.
-   **Staking after 50% of epoch progress:** Users receive a burnable NFT, which can be converted into the respective LST one epoch later.

## Admin Rights

Winter Walrus employs a SuperAdmin Key system:

-   **SuperAdmin Key:** Can create and remove admins.
-   **Admin (Key + Store):** Manages stake, unstake, and transmute fees.
-   **SuperAdmin Transfers:** Require a two-epoch function execution for security purposes.

## Security

Winter Walrus was audited by [MoveBit](https://www.movebit.xyz/). You can find the audit report [here](https://1728454349-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FRWtS0P2EGEpzNUGZyx31%2Fuploads%2Fvi7dgNYPSMEBYyQglM9l%2FBlizzard%20Audit%20Repor.pdf?alt=media&token=bfbab48f-19a9-4b56-94b5-44b2d6abda18).

The current Admin capabilities are held in a hardware wallet. We plan to move to a multi-signature wallet in the future.

## 👨‍💻 Developers  

### SDK

Winter Walrus has TS SDK on [npm](https://www.npmjs.com/package/@interest-protocol/blizzard-sdk). The source code for the SDK can be found [here](https://github.com/interest-protocol/sdk-monorepo/tree/main/packages/blizzard-sdk).

```bash
npm i @interest-protocol/blizzard-sdk
```

Examples on how to call every single SDK function can be found [here](https://github.com/interest-protocol/blizzard-sdk/tree/main/src/scripts/lst).

### Package and Object IDs

You can find them [here](https://interest-protocol.gitbook.io/winter-walrus/developers).

### [Move Registry CLI](https://docs.suins.io/move-registry)

```bash
# mainnet
mvr add @interest/winter-walrus --network mainnet
```

### Manual

To add this library to your project, add this to your `Move.toml`.

```toml
# goes into [dependencies] section
interest_access_control = { r.mvr = "@interest/winter-walrus" }

# add this section to your Move.toml
[r.mvr]
network = "mainnet"
```

## API Reference

**sync_exchange_rate:** Synchronizes the exchange rate for the entire staking system.
**Errors**
-   If you hit the maximum dynamic reads. Please use **sync_node_exchange_rate:**

```move
public fun sync_exchange_rate<T>(self: &mut BlizzardStaking<T>, walrus_staking: &Staking)
```

**sync_node_exchange_rate:** Synchronizes the exchange rate for a specific node.

```move
public fun sync_node_exchange_rate<T>(
    self: &mut BlizzardStaking<T>,
    walrus_staking: &Staking,
    node_id: ID,
)
```

**mint:** Mints LST tokens by staking WAL tokens to a specific node.

**Errors**
-   You are not allowed to deposit less than 1 WAL + fees.
-   Must mint **before** the epoch mid point.

```move
public fun mint<T>(
    self: &mut BlizzardStaking<T>,
    walrus_staking: &mut Staking,
    wal_coin: Coin<WAL>,
    node_id: ID,
    av: &AllowedVersions,
    ctx: &mut TxContext,
): Coin<T>
```

**mint_after_votes_finished:** Mints a burnable NFT when staking after votes are finished in the epoch.

**Errors**
-   You are not allowed to deposit less than 1 WAL + fees.
-   Must mint **after** the epoch mid point.

```move
public fun mint_after_votes_finished<T>(
    self: &mut BlizzardStaking<T>,
    walrus_staking: &mut Staking,
    wal_coin: Coin<WAL>,
    node_id: ID,
    av: &AllowedVersions,
    ctx: &mut TxContext,
): BlizzardStakeNFT
```

**burn_stake_nft:** Burns a stake NFT to convert it into LST tokens.

**Errors**
-   Must burn on the epoch after minting or later.

```move
public fun burn_stake_nft<T>(
    self: &mut BlizzardStaking<T>,
    walrus_staking: &Staking,
    nft: BlizzardStakeNFT,
    av: &AllowedVersions,
    ctx: &mut TxContext,
): Coin<T>
```

**burn_lst:** Burns LST tokens to withdraw WAL tokens and StakedWal NFTs.

**Errors**
-   Burn more than 1 LST

```move
public fun burn_lst<T>(
    self: &mut BlizzardStaking<T>,
    walrus_staking: &mut Staking,
    lst_coin: Coin<T>,
    withdraw_ixs: vector<IX>,
    av: &AllowedVersions,
    ctx: &mut TxContext,
): (Coin<T>, vector<StakedWal>)
```

**transmute:** Converts one LST type to another LST type (e.g., from any LST to WWAL).

**Errors**
-   Transmute more than 1 LST + fees.

```move
public fun transmute<T>(
    self: &mut BlizzardStaking<T>,
    wwal_staking: &mut BlizzardStaking<WWAL>,
    walrus_staking: &mut Staking,
    from_coin: Coin<T>,
    withdraw_ixs: vector<IX>,
    av: &AllowedVersions,
    ctx: &mut TxContext,
): (Coin<T>, Coin<WWAL>)
```

**to_lst_at_epoch:** Converts WAL value to LST value at a specific epoch.

```move
public fun to_lst_at_epoch<T>(
    self: &mut BlizzardStaking<T>,
    epoch: u32,
    value: u64,
    round_up: bool,
): Option<u64>
```

**to_wal_at_epoch:** Converts LST value to WAL value at a specific epoch.

```move
public fun to_wal_at_epoch<T>(
    self: &mut BlizzardStaking<T>,
    epoch: u32,
    value: u64,
    round_up: bool,
): Option<u64>
```

**allowed_nodes:** Returns the list of allowed node IDs for this LST.

```move
public fun allowed_nodes<T>(self: &mut BlizzardStaking<T>): vector<ID>
```

**staked_wal_vector_at_node:** Returns the BigVector of StakedWal NFTs at a specific node.

```move
public fun staked_wal_vector_at_node<T>(
    self: &mut BlizzardStaking<T>,
    node_id: &ID,
): &BigVector<StakedWal>
```

**fee_config:** Returns the fee configuration for this LST.

```move
public fun fee_config<T>(self: &mut BlizzardStaking<T>): &BlizzardFee
```

**new:** It creates a `ACL`and `SuperAdmin`. The SuperAdmin is sent to the `super_admin_recipient`. The `delay` is the number of epochs that must pass before the SuperAdmin can be `transferred`.

```move
public fun new<T: drop>(
    otw: &T,
    delay: u64,
    super_admin_recipient: address,
    ctx: &mut TxContext,
): ACL<T>
```

## Errors

Errors are encoded in u64 .

# Blizzard Errors Reference

| Error Code | Error Name | Description |
|------------|------------|-------------|
| 0 | `EInvalidSuperAdminTransferEpoch` | The Super admin tried to be transferred before the epoch deadline. |
| 1 | `EInvalidNewSuperAdmin` | Caller tried to start the `SuperAdmin` transfer to the dead address or to himself/herself. |
| 2 | `EInvalidAdmin` | The `Admin` is not listed in the `ACL`. |
| 3 | `EOutdatedPackageVersion` | The package is outdated. Please call the latest version |
| 4 | `ETreasuryMustHaveNoSupply` | New LSTs must have no supply. |
| 5 | `ERemoveCurrentVersionNotAllowed` | The Admin cannot remove the latest package id from the allowed versions. |
| 6 | `ENodeNotAllowed` | Walrus node is not whitelisted. |
| 7 | `EZeroWal` | Attempted to stake zero WAL tokens. |
| 8 | `EMintNftInstead` | Should mint NFT instead of LST at this point in the epoch. |
| 9 | `EBigVectorNotEmpty` | Big vector is not empty when it should be. |
| 10 | `EBigVectorIsEmpty` | Big vector is empty when it should not be. |
| 11 | `EBigVectorIndexOutOfBounds` | Attempted to access an index outside the bounds of the big vector. |
| 12 | `EMintLstInstead` | Should mint LST instead of NFT at this point in the epoch. |
| 13 | `ETooEarlyToBurnNft` | Attempted to burn NFT before the required epoch has passed. |
| 14 | `EInvalidDecimals` | Invalid decimal configuration for the token. |
| 15 | `EMismatchTypeNameJoin` | Type name mismatch when joining operations. |
| 16 | `EMismatchType` | Type mismatch in the operation. |
| 17 | `EZeroLst` | Attempted to operate with zero value LST tokens. |
| 18 | `EFeeIsTooHigh` | The specified fee exceeds the maximum allowed fee. |
| 19 | `EProtocolFeeIsTooHigh` | The protocol fee exceeds the maximum allowed protocol fee. |
| 20 | `EPaused` | The protocol is currently paused and operations are not allowed. |                                                                    |

## Changelog

### Mainnet deployment
Version 1 of the package
- 0xb1b0650a8862e30e3f604fd6c5838bc25464b8d3d827fbd58af7cb9685b832bf

## Disclaimer

This is provided on an "as is" and "as available" basis.

We do not give any warranties and will not be liable for any loss incurred through any use of this codebase.

While Interest Winter Walrus has been heavily tested, there may be parts that may exhibit unexpected emergent behavior when used with other code, or may break in future Move versions.

Please always include your own thorough tests when using Interest Winter Walrus to make sure it works correctly with your code.

## License

This package is licensed under MIT.