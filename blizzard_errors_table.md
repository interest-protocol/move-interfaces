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
| 20 | `EPaused` | The protocol is currently paused and operations are not allowed. | 