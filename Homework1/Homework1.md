## Homework 1

_Discuss in your teams what a decentralised version of a game like monopoly would be like, if there was no software on a central server._

_Consider_

##### _1. What are the essential pieces of functionality ?_

1.1. Game rules and constants

    Although we are building a decentralized game, we need game rules. Therefore, the constructor structure can be used to define the game rules as immutable first.
    What will be the total supply, which stores will be in the game, how many houses will be there..

1.2. All players must start the game

    All players must declare that they want to start the game by calling the corresponding function in the contract. In this way, an equal amount of tokens will be taken from all of their wallets.

1.3. Rolling the dice and randomness

    When the game starts, each user will roll the dice in turn. However, since the blockchain is a deterministic system, it cannot provide randomness. Oracle can be used at this point.
    The user will have the choice after each dice.

1.4. Order of play

    Each player's move will trigger a sequential array of contracted users so that the players' rank is not disrupted.

1.5. Assets - NFT

    Since all the assets(stores, houses, etc.) in the game are unique, we can distribute them all as NFTs.

1.6. Marketplace of all assets

    We can list our assets converted to NFT in a marketplace that everyone can see, and enable other users to buy them comfortably.

##### _How could people cheat ?_

    People would try to cheat by trying to steal money or manipulating incoming dice. However, it will not be possible to mint tokens other than distributed tokens in the context of the smart contract (since the mint function will only run once at the start of each game). People can deceive each other, but it will be very difficult to deceive computer codes.
    Since the values of the rolled dice are determined by oracle, that is, data comes from outside the contract, maybe there may be a small danger in that part.

##### _How could you prevent them from cheating ?_

    The only way to do this is to not leave any security bugs in the smart contract.

_This is just a general discussion, there is no need to write any code or do any detailed design_
