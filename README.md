# HVM1 SUP Flake
This repo provides an easy way to use an HVM1 version from the dup_labels branch. Note that HVM1 is deprecated in favor of [HVM2](https://github.com/HigherOrderCO/HVM/tree/main) and [bend](https://github.com/HigherOrderCO/Bend). The only reason to use it is to experiment with lazy SUP nodes. See 
- [Fast Discrete Program Search with HVM Superpositions (SUP nodes) - finding ADD-CARRY](https://gist.github.com/VictorTaelin/d5c318348aaee7033eb3d18b0b0ace34)
- [Solving SAT via interaction net superpositions](https://gist.github.com/VictorTaelin/9061306220929f04e7e6980f23ade615)

Usage:
1. [Install Nix](https://nixos.org/download/).
2. Get a shell with hvm1 with SUP labels available via `nix --experimental-features 'nix-command flakes' shell github:johannesCmayer/HVM1-SUP-Flake`.
3. Use HVM, e.g. `hvm1 run -t 1 "(+ 2 3)"` or `hvm1 run -d true -t 1 "(+ 2 3)"` to see all reduction steps.

Try the example on the first page of [An Algorithm for Optimal Lambda Calculus Reduction](https://dl.acm.org/doi/10.1145/96709.96711) to see the optimal reduction with dup nodes in action:
```
hvm1 run -d true -t 1 "((λg (g(g(λx x))))
                        (λh ((λf (f(f(λz z))))
                             (λw (h(w(λy y)))))))"
```

To run the finding ADD-CARRY code do:
```shell
wget 'https://gist.githubusercontent.com/VictorTaelin/d5c318348aaee7033eb3d18b0b0ace34/raw/5055c1e17c54675d32a35245892a234333f8f194/fast_dps_add_carry.hvm1'
hvm1 run -c true -t 1 -f fast_dps_add_carry.hvm1 "Main"
```

`-t 1` makes HVM use a single thread (There is a bug in the parallizer of HVM).

See the [HVM1 guide](https://github.com/HigherOrderCO/HVM1/blob/dup_labels/guide/HOW.md) for more (have GPT read it and then try to understand the source code [here](https://gist.github.com/VictorTaelin/d5c318348aaee7033eb3d18b0b0ace34) by asking questions).
