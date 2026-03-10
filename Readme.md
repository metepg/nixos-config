# Remember to

1. Copy hardware config:

```
cp /etc/nixos/hardware-configuration.nix nixos-config/hosts/nixosman/hardware-configuration.nix
```

2. Add config.local to .ssh/config.local with Hetzner stuff

3. Build

```
sudo nixos-rebuild switch -- flake .#nixosman
```

## Reboot and

IDE
 `Settings -> Terminal -> Override IDE shortcuts OFF`

Vimium 

```
unmap i 
map i focusInput
```

## Aliases

testit = test changes
buildit = build changes

## Making changes

1. git add <file> (need this because of how flakes works)
2. testit
3. buildit
