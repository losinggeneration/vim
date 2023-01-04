vim.g["deoplete#enable_at_startup"] = 1

-- go options
vim.g["deoplete.sources.go.gocode_binary"] = vim.env.HOME .. "/Programs/bin/gocode"
vim.g["deoplete.sources.go.sort_class"] = {"package", "func", "type", "var", "const"}
vim.g["deoplete.sources.go.pointer"] = 1
vim.g["deoplete.sources.go.use_cache"] = 1
vim.g["deoplete.sources.go.json_directory"] = vim.env.HOME .. "/.deoplete/cache/go"
vim.g["deoplete.sources.go.cgo"] = 0

-- rust options
vim.g["deoplete.sources#rust.racer_binary"] = vim.env.HOME .. "/.cargo/bin/racer"
vim.g["deoplete.sources.rust.rust_source_path"] = "/usr/src/rust/src"
