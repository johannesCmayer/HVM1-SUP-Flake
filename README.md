# HVM1 Flake
This repo provides an easy way to use an HVM1 version from the dup_labels branch. Note that HVM1 is deprecated in favor of [HVM2](https://github.com/HigherOrderCO/HVM/tree/main) and [bend](https://github.com/HigherOrderCO/Bend). The only reason to use it is to experiment with lazy SUP nodes. See 
- [Fast Discrete Program Search with HVM Superpositions (SUP nodes) - finding ADD-CARRY](https://gist.github.com/VictorTaelin/d5c318348aaee7033eb3d18b0b0ace34)
- [Solving SAT via interaction net superpositions](https://gist.github.com/VictorTaelin/9061306220929f04e7e6980f23ade615)

Usage:
1. Install Nix.
2. Get a shell with hvm1 with SUP labels available via `nix shell github:johannesCmayer/HVM1-SUP-Flake`.
3. Use hvm, e.g. `hvm1 run -t 1 "(+ 2 3)"`

`-t 1` makes HVM use a single thread (There is a bug in the parallizer of HVM).

See the [HVM1 guide](https://github.com/HigherOrderCO/HVM1/blob/dup_labels/guide/HOW.md) for more (have GPT read it and then try to understand the source code [here](https://gist.github.com/VictorTaelin/d5c318348aaee7033eb3d18b0b0ace34) by asking questions).
