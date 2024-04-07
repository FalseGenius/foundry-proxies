## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**


Implements ERC1967Proxy provided by openzeppelin.

## Documentation

https://book.getfoundry.sh/

## Usage - Libraries to Install

**forge install OpenZeppelin/openzeppelin-contracts-upgradeable**
**forge install OpenZeppelin/openzeppelin-contracts**
**forge install Cyfrin/foundry-devops --no-commit**

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
