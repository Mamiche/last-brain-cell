# Last Brain Cell (BRAIN)

An ERC-20 meme coin contract for EVM-compatible networks.

## Token properties

- Name: `Last Brain Cell`
- Symbol: `BRAIN`
- Decimals: 18
- Fixed supply: 1,000,000,000 BRAIN
- All tokens are minted once to the non-zero `initialHolder` passed to the constructor.
- No owner, post-deployment minting, transfer tax, blacklist, or upgrade mechanism.

The contract does not deploy itself, select a network, provide liquidity, or make any claim
about the token's value. Review the deployment address and network carefully before deploying.

## Requirements

- [Foundry](https://book.getfoundry.sh/getting-started/installation)
- Git

## Install and test

```sh
git clone --recurse-submodules https://github.com/Mamiche/last-brain-cell.git
cd last-brain-cell
forge test
```

OpenZeppelin Contracts v5.4.0 is included as a pinned Git submodule under `lib/openzeppelin-contracts`.

## Build

```sh
forge build
```

## Deploy

Compile and review the contract, configure your wallet and RPC endpoint securely, then deploy
`LastBrainCell` with the intended initial holder address using your preferred Foundry deployment
workflow. This repository intentionally contains no private keys, RPC credentials, or automated
mainnet deployment script.
