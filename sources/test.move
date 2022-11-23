module sui_move_inline::test {
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    struct Object has key {
        id: UID,
        value: u64,
    }

    fun create(ctx: &mut TxContext, value: u64): Object {
        Object { id: object::new(ctx), value }
    }

    entry fun test1(n: u64, ctx: &mut TxContext) {
        let r = 0;
        let k = 0;
        while (k <= n) {
            r = r + k;
            k = k + 1;
        };

        let sender = tx_context::sender(ctx);
        transfer::transfer(create(ctx, r), sender);
    }

    fun add(x: u64, y: u64): u64 {
        x + y
    }

    entry fun test2(n: u64, ctx: &mut TxContext) {
        let r = 0;
        let k = 0;
        while (k <= n) {
            r = add(r, k);
            k = k + 1;
        };

        let sender = tx_context::sender(ctx);
        transfer::transfer(create(ctx, r), sender);
    }
}
