// SimpleCoin.move
// Minimal Move module example (Aptos/Sui style) defining a simple coin resource.
// NOTE: Move toolchains may require different std modules; this is illustrative.
module 0x1::SimpleCoin {
    resource struct Coin { value: u64 }

    public fun mint(account: &signer, amount: u64) {
        let coin = Coin { value: amount };
        move_to(account, coin);
    }

    public fun balance(account: &signer): u64 acquires Coin {
        if (!exists<Coin>(@Signer::address_of(account))) {
            0
        } else {
            let c = borrow_global<Coin>(@Signer::address_of(account));
            c.value
        }
    }
}
