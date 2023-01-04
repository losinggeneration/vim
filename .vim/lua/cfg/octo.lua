require("octo").setup()

vim.keymap.set("n", "<space>tr", [[:lua require("octo.reviews.thread-panel").show_review_threads()<cr>]])
