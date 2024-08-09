Usage:
1. Install nix.
2. Get a shell with hvm1 with `nix shell github:johannesCmayer/HVM1-SUP-Flake`.
3. Use hvm, e.g. `hvm1 run -t 1 "(+ 2 3)"`

`-t 1` makes HVM use a single thread (There is a bug in the parallizer of HVM).
