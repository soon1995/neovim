lint: lint-lua

lint-lua:
	luacheck .

style: style-lua

style-lua:
	stylua --config-path .stylua.toml .
