require("octo").setup({})

vim.keymap.set("n", "<space>tr", [[:lua require("octo.reviews").show_review_threads()<cr>]])
