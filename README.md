Testing gas consumption of Move functions calling in Sui.

```sh
sui client publish --gas-budget 100000
sui client call --package <PACKAGE> --module test --function test1 --gas-budget 100000 --args 10000
sui client call --package <PACKAGE> --module test --function test2 --gas-budget 100000 --args 10000
```
