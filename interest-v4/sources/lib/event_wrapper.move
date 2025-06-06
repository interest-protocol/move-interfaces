#[allow(unused_use)]
module interest_v4::event_wrapper;

use sui::event;

// === Structs ===

public struct InterestV4Event<Event: copy + drop>(Event) has copy, drop;

