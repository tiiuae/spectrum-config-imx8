# SPDX-License-Identifier: MIT
# SPDX-FileCopyrightText: 2022 Unikie
# SPDX-FileCopyrightText: 2022 Tero Tervala <tero.tervala@unikie.com>

# This file is built to populate the binary cache.

{ pkgs ? import <nixpkgs> {} }:

{
  #doc = import ./Documentation { inherit pkgs; };

  live = import ./imx8qm/default.nix;
}
