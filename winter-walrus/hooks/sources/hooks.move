#[allow(unused_use, unused_const, unused_variable, unused_field, unused_let_mut)]
module blizzard_hooks::blizzard_hooks;

use blizzard::{blizzard_protocol::BlizzardStaking, blizzard_withdraw_ix::{Self, IX}};
use interest_math::u64;
use walrus::staking::Staking;

/// Call dev inspect on FE then rebuild the {TuskrWithdrawIXs} to save Dynamic Field reads.
/// If it is an LST with 1-2 allowed_nodes, can be called directly in the PTB.
public fun fcfs<T>(
    blizzard_staking: &mut BlizzardStaking<T>,
    walrus_staking: &mut Staking,
    lst_value: u64,
): (u64, vector<IX>) {
    abort 0
}
