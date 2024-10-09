return {
    "saghen/blink.cmp",
    lazy = false,
    dependencies = "rafamadriz/friendly-snippets",

    build = "cargo build --release",

    opts = {
        highlight = {
            use_nvim_cmp_as_default = true,
        },
        nerd_font_variant = 'normal',
        accept = {
            auto_brackets = {
                enabled = true
            }
        },
        trigger = {
            signature_help = {
                enabled = true
            }
        }
    }
}
