![Build Status](https://github.com/bstnbuck/Simple-V-Blockchain/workflows/Simple-V-Blockchain/badge.svg)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/bstnbuck/Simple-Go-Blockchain/blob/master/LICENSE)
# Simple V Blockchain

>**Entering some transactions while executing now works! This program should only show the principle of blockchains.**

The Blockchain is written in Vlang. As hash algorithm is used SHA-512.
It is also written in Go: [**Simple Go Blockchain**](https://github.com/bstnbuck/Simple-Go-Blockchain)

## Requirements
- Installed [V-Compiler](https://github.com/vlang/v)

## Usage & Build
* Clone the Repo: `git clone https://github.com/bstnbuck/Simple-V-Blockchain.git`
* Build with optional Garbage-Collector: ``` v -prod -gc boehm .```

##### Execute the Blockchain:
* If you want to execute the Blockchain run the program in console.
* After that enter the number of leading hex-nulls the hash should have. Should look like this: **4**
    => Otherwise an error will be printed and the program exits.

###### Example output:
```
Welcome to the first Blockchain written in Vlang!
Starting... How much leading hex nulls? 4
How many blocks should be generated? 2
Started: 2020-08-30 20:32:20

New Block Index:1 Timestamp:2020-08-30 20:32:20
HashPoW:000004de82aa861c494fc9d28bca98035fc829eec8c78b807cc73dead2d1e4b3086d856554781a1eba245fc6356db6ca472e0769fd0e65338eb6c9662551d5f5
Text&Nonce:W5EsII9d10693428218265332150
PrevHashHeader:e21b0b95ceca64fd49a17b04507e34ab77896855cffe5122c195d818d9ca393aedcc4d5644a2001cabd4ddcc2d57a88100b335d6ab90b01bb6ed7e9700b33804
BlockHash:56d73c8ba17aee888430c838d275f2cd41486378466a1edb972b02b23cb1f2479ea828249bb17e467bcb554ec6fa831aefe983da1e5e8b6aaced4700f12a5c5a
Data:
New Transaction Timestamp:2020-08-30 20:26:00
 From:W38sILJd To:W78sIBNd
 Transfer:1.96292
New Transaction Timestamp:2020-08-30 20:26:00
 From:W78sIKBd To:W1AsID1d
 Transfer:12.9919
New Transaction Timestamp:2020-08-30 20:26:00
 From:WwosIJ1d To:W6ksIJRd
 Transfer:31.3365
New Transaction Timestamp:2020-08-30 20:26:00
 From:W0EsIBld To:WwwsIFpd
 Transfer:32.717
New Transaction Timestamp:2020-08-30 20:26:00
 From:W9AsIHFd To:W9ksIDFd
 Transfer:75.9

>> Block is valid! <<

Stopped: 2020-08-30 20:32:20
Time to make new Block: 161ms => 0sec
Count: 7826
Hashrate: 48 H/ms (Hashes per millisecond)

All Blocks generated! Press ENTER to continue...
```

##### Execute addTransaction:
* If you want to make Transactions switch into addTransaction and run the program in console with `v run .`.
    => Enter the number of Transactions you want wo generate.

###### Example output:
```
Starting... Generate transactions automatically? [1] = automatically, [99] = Stop
1
[AUTO] How many Transactions should be generated?
10
[AUTO] Finished! Any more? [1] = yes [2] = no
2
Press ENTER to continue...
```

### Information
* The Proof-of-Work function uses a string with a incremented Nonce as hash operators.
* **Important! Since V has no garbage collection, the consumption of RAM is constantly increasing, this should be observed permanently.** I will look for a solution in the near future.
