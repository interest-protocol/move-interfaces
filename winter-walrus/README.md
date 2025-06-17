# Winter Walrus ❄️

Winter Walrus is a liquid staking protocol built on top of Walrus Protocol Native Staking.

## Overview

Winter Walrus is a liquid staking standard built on the Walrus Protocol, enabling users to stake $WAL, and mint a variety of LSTs: 

-   wWal: native Winter Walrus LST.
-   upWal: by [Double Up](https://www.doubleup.fun/).
-   mWal: by [Studio Mirai](https://sm.xyz/)
-   pWal: by [Patara](https://patara.app/)
-   breadWal: by [Mr. Breadsmith](https://x.com/MrBreadSmith)
-   nWal by [Sui Nigeria Community](https://x.com/SuiNetworkNG)

Each LST issuer has full admin rights over it. They decide which validators to allocate to and the fees.

Winter Walrus frontend is available at [www.winterwalrus.com](https://www.winterwalrus.com/) and [open sourced on Github](https://github.com/interest-protocol/winterwalrus.com). Users experience near-instant Web2 UX with 0ms latency. The platform introduces liquid staking tokens to the Walrus ecosystem and a unique staking mechanism governed by epochs.

## Why?

Walrus uses a *delegated proof of Stake* for consensus. Users can natively stake WAL and receive a NFT named *StakedWal* that represents their position. The issue is that StakedWal is not fungible, you cannot use it to swap, lend or leverage.

Winter Walrus solves this issue by keeping custody of the *StakedWal* on a Shared Object to mint Liquid Staking Coins. Now users are able to interact with DeFi while earning passive staking income.

## Epoch Mechanics

Winter Walrus operates on a delegated proof-of-stake system structured into epochs, each lasting two weeks. The timing of staking within an epoch determines the rewards and type of asset received:

-   *Staking before 50% of epoch progress:* Users mint an LST.
-   *Staking after 50% of epoch progress:* Users receive a burnable NFT, which can be converted into the respective LST one epoch later.

## Admin Rights

Winter Walrus employs a SuperAdmin Key system:

-   *SuperAdmin Key:* Can create and remove admins.
-   *Admin (Key + Store):* Manages stake, unstake, and transmute fees.
-   *SuperAdmin Transfers:* Require a two-epoch function execution for security purposes.

## Security

Winter Walrus was audited by [MoveBit](https://www.movebit.xyz/). You can find the audit report [here](https://1728454349-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FRWtS0P2EGEpzNUGZyx31%2Fuploads%2Fvi7dgNYPSMEBYyQglM9l%2FBlizzard%20Audit%20Repor.pdf?alt=media&token=bfbab48f-19a9-4b56-94b5-44b2d6abda18).

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

ACL objects require a `One Time Witness` for security reasons. You can read more about OTWs [here](https://move-book.com/programmability/witness-pattern.html?highlight=one%20time#one-time-witness).

## API Reference

**new:** It creates a `ACL`and `SuperAdmin`. The SuperAdmin is sent to the `super_admin_recipient`. The `delay` is the number of epochs that must pass before the SuperAdmin can be `transferred`.

```move
public fun new<T: drop>(
    otw: &T,
    delay: u64,
    super_admin_recipient: address,
    ctx: &mut TxContext,
): ACL<T>
```

**default:** It calls `new` with default arguments. The delay is set to 3 epochs and the `SuperAdmin` is sent to the `ctx.sender`.

```move
public  fun  default<T: drop>(otw: &T, ctx: &mut TxContext): ACL<T>
```

**new_admin:** It allows the `SuperAdmin` to create an `Admin`.

```move
public  fun  new_admin<T: drop>(acl: &mut ACL<T>, _: &SuperAdmin<T>, ctx: &mut TxContext): Admin<T>
```

**add_role:** It allows the `SuperAdmin` to create a role for an `Admin` using its address.

```move
public  fun  add_role<T: drop>(acl: &mut ACL<T>, _: &SuperAdmin<T>, admin: address, role: u8)
```

**remove_role:** It allows the `SuperAdmin` to remove a role from an `Admin` using its address.

```move
public  fun  remove_role<T: drop>(acl: &mut ACL<T>, _: &SuperAdmin<T>, admin: address, role: u8)
```

**revoke:** It allows the `SuperAdmin` to remove a an `Admin`. This operation removes an `Admin` from the `ACL` shared object. It will prevent the removed `Admin` from issuing an `AdminWitness`.

```move
public  fun  revoke<T: drop>(acl: &mut ACL<T>, _: &SuperAdmin<T>, to_revoke: address)
```

**sign_in:** It allows an `Admin` to prove its access rights by issuing an `AdminWitness` with its roles.

```move
public  fun  sign_in<T: drop>(acl: &ACL<T>, admin: &Admin<T>): AdminWitness<T>
```

**destroy_admin:** It allows an `Admin` to revoke its rights and delete the object for a Sui rebate.

```move
public  fun  destroy_admin<T: drop>(acl: &mut ACL<T>, admin: Admin<T>)
```

**destroy_super_admin:** It allows a `SuperAdmin` to revoke its rights and delete the object for a Sui rebate. **Please note, this is irreversible.**

```move
public  fun  destroy_super_admin<T: drop>(super_admin: SuperAdmin<T>)
```

**start_transfer:** It initiates the SuperAdmin transfer process.

```move
public fun start_transfer<T: drop>(
    super_admin: &mut SuperAdmin<T>,
    new_super_admin: address,
    ctx: &mut TxContext,
)
```

**finish_transfer:** It transfers the `SuperAdmin` to the recipient set at `start_transfer`. It can only be called after the `delay` period.

```move
public  fun  finish_transfer<T: drop>(mut super_admin: SuperAdmin<T>, ctx: &mut TxContext)
```

**assert_has_role:** It asserts that an `AdminWitness` has a `role`.

```move
public  fun  assert_has_role<T: drop>(witness: &AdminWitness<T>, role: u8)
```

**admin_address:** Returns the address of the `Admin`.

```move
public  fun  admin_address<T: drop>(admin: &Admin<T>): address
```

**is_admin:** Checks if the address is an `Admin`.

```move
public  fun  is_admin<T: drop>(acl: &ACL<T>, admin: address): bool
```

**has_role:** Checks if the address is an `Admin` has the `role`.

```move
public  fun  has_role<T: drop>(acl: &ACL<T>, admin: address, role: u8): bool
```

**permissions:** Returns all the roles of an `Admin`. It is tracked via bit map.

```move
public  fun  permissions<T: drop>(acl: &ACL<T>, admin: address): Option<u128>
```

## Errors

Errors are encoded in u64 .

# Blizzard Errors Reference

| Error Code | Error Name | Description |
|------------|------------|-------------|
| 0 | `EInvalidSuperAdminTransferEpoch` | The Super admin tried to be transferred before the epoch deadline. |
| 1 | `EInvalidNewSuperAdmin` | Caller tried to start the `SuperAdmin` transfer to the dead address or to himself/herself. |
| 2 | `EInvalidAdmin` | The `Admin` is not listed in the `ACL`. |
| 3 | `EOutdatedPackageVersion` | Caller tried to start the `SuperAdmin` transfer to the dead address or to himself/herself. |
| 4 | `ETreasuryMustHaveNoSupply` | The maximum allowed role is 127u8. |
| 5 | `ERemoveCurrentVersionNotAllowed` | The `Admin` does not have a specific role. |
| 6 | `ENodeNotAllowed` | Node is not allowed to perform the requested operation. |
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
| 17 | `EZeroLst` | Attempted to operate with zero LST tokens. |
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