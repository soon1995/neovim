require("mkdnflow").setup({
  mappings = {
    -- MkdnNewListItem = { "i", "<CR>" },
    -- MkdnNewListItemAboveInsert = false,
    MkdnIncreaseHeading = { "n", "-" },
    MkdnDecreaseHeading = { "n", "+" },
    MkdnDestroyLink = { "n", "<M-q>" },
    MkdnTagSpan = { "v", "<M-t>" },
    MkdnCreateLinkFromClipboard = { { "n", "v" }, "<leader>p" }, -- see MkdnEnter
    MkdnYankAnchorLink = { "n", "yaa" },
    MkdnYankFileAnchorLink = { "n", "yfa" },
    MkdnTableNextCell = { "i", "<Tab>" },
    MkdnTablePrevCell = { "i", "<S-Tab>" },
    MkdnFoldSection = false,
    MkdnUnfoldSection = false,
  },
})
