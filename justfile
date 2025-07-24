# Initialize OS Setup
init:
    just _init-{{os()}}

_init-linux:
    # Linux init

_init-macos:
    # macOS init

_init-windows:
    # Windows init

switch:
    just _switch-{{os()}}

_switch-linux:
    home-manager switch --flake .

_switch-macos:
    sudo darwin-rebuild switch --flake .
