# vault.nvim
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Latest: Release](https://img.shields.io/github/release/cappyzawa/vault.nvim.svg)](https://github.com/cappyzawa/vault.nvim/releases)

utilities to operate vault

## Required
* nvim 0.4.0++
## Installation
To install using [Vim-Plug](https://github.com/junegunn/vim-plug):
```
" add this line to your .vimrc file
Plug 'cappyzawa/vault.nvim'
```
## Supported commands
|Command|Description|
|:---|:---|
|VaultPathPrefix|set your secret path's prefix.|
|VaultField|set your secret's field. default:`value`.|
|VaultRead|`vault read -field <field> <path_prefix>/<selected string>`|

## Key mappings
If `g:vault_no_default_mappings` is not set to `v:true`, this plugin also defines following default mapping.

|Map|Key|Command|
|:---:|:---:|:---|
|nmap|<Leader\>vpp|VaultPathPrefix|
|nmap|<Leader\>vf|VaultField|
|xmap|<Leader\>vr|VaultRead|
|nmap|<Leader\>vr|VaultRead|

`VaultRead` reads the secret of the selected string and displays it in the popup window.(xmap) 

When popup is open, execute `VaultRead` to close it.(nmap)


