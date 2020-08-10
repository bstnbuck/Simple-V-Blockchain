![Build Status](https://github.com/bstnbuck/Simple-V-Blockchain/workflows/Simple-V-Blockchain/badge.svg)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/bstnbuck/Simple-Go-Blockchain/blob/master/LICENSE)
# Simple V Blockchain

>**Not all functions are implemented yet! This program should only show the principle of blockchains.**

The Blockchain is written in Vlang. As hash algorithm is used SHA-512.
It is also written in Go: [**Simple Go Blockchain**](https://github.com/bstnbuck/Simple-Go-Blockchain)

## Requirements
- C-Compiler
- Installed [V-Compiler](https://github.com/vlang/v)

## Usage
`git clone https://github.com/bstnbuck/Simple-V-Blockchain.git`

##### Execute:
* If you want to execute the Blockchain run the program in console with `v run .`.
* After that enter the number of leading hex-nulls the hash should have. Should like this: **4**
    => Otherwise an error will be printed and the program exits.

##### Example output:
```
Welcome to the first Blockchain written in Vlang!
Starting... How much leading hex nulls? 4
How many blocks should be generated? 1
Started: 2020-08-10 16:24:26

New Block Index:1 Timestamp:2020-08-10 16:24:26
HashPoW:0000cb96de53fa45e5f08af7efd534e8f0ea5887d73ef590d6f39486775defebdf132153d4367b4d26a1b95cc113e07c8dcd29b2e98b5a6cb31d8b8acc710d97
Text&Nonce:W5csIJld13552139115523017255
PrevHashHeader:3d590ece3c48475187330ff4de787a1a6ad36420940cbb16833236f4b8f4e33e086fea4f573c9e439e5f986894bc6603b73e7fbc983106661f9628065a670405
HashHeader:14ce401125c83a6f914df58a545595b3589ca3fe6ea36caf2095fc0856fc02453a24cb23fc9f82829653b41e77760c73998f369d1a5853a046b3a0fef65b113a
Data:
 W4wsIGtd W3osIC1d Wx4sIBpd W4AsIDVd W/ksIEBd
 W9csIHxd W+ksIBNd W7csIOBd W2EsIC5d W3ksIFBd
>> Block is valid! <<

Stopped: 2020-08-10 16:24:26
Time to make new Block: 411ms => 0sec
Count: 18976
Hashrate: 46 H/ms (Hashes per millisecond)


All Blocks generated! Press ENTER to continue...
```

### Information
* The Code is self-explanatory commented.
* The Proof-of-Work function uses a string with a incremented Nonce as hash operators.
* **Important! Since V has no garbage collection, the consumption of RAM is constantly increasing, this should be observed permanently.** I will look for a solution in the near future.

### The following is still being implemented
* Entering some transactions while executing
