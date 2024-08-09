# HVM1 Flake
This repo provides an easy way to use an HVM1 version from the dup_labels branch. The purpose is to easily replicate [Fast Discrete Program Search with HVM Superpositions (SUP nodes) - finding ADD-CARRY](https://gist.github.com/VictorTaelin/d5c318348aaee7033eb3d18b0b0ace34).

Usage:
1. Install Nix.
2. Get a shell with hvm1 with `nix shell github:johannesCmayer/HVM1-SUP-Flake`.
3. Use hvm, e.g. `hvm1 run -t 1 "(+ 2 3)"`

`-t 1` makes HVM use a single thread (There is a bug in the parallizer of HVM).
