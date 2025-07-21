local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local sn = ls.snippet_node
local d = ls.dynamic_node
local f = ls.function_node

local function get_current_date()
    return os.date('%Y-%m-%d')
end

local function get_current_filename()
    return vim.fn.expand("%:t"):match("(.+)%.[^.]+$") or vim.fn.expand("%:t")
end

ls.add_snippets("markdown", {
    s({
        trig = "metadata",
        name = "Add default metadata",
        desc = "---\nid: {{id}}\naliases:\n\t- $1\ntags:\n- $2\n---\n\n# {{title}}\n",
    }, {
        t({
            "---",
            "id: ",
        }),
        f(get_current_filename, {}),
        t({
            "",
            "aliases:",
            "\t- ",
        }),
        i(1),
        t({
            "",
            "tags:",
            "\t- ",
        }),
        i(2),
        t({
            "",
            "---",
            "",
            "",
        }),
        i(3),
        t({
            "",
            "",
        }),
    })
})

ls.add_snippets("markdown", {
    s({
        trig = "link",
        name = "Add external link from clipboard",
        desc = "[$1](clipboard)",
    }, {
        t("["),
        i(1),
        t("]("),
        d(2, function ()
            local handle = io.popen("wl-paste")
            if not handle then return sn(nil, i(1)) end
            local clip = handle:read("*a") or ""
            handle:close()
            clip = clip:gsub("%s+$", "")

            return sn(nil, i(1, clip))
        end),
        t(")"),
    })
})


ls.add_snippets("markdown", {
    s({
        trig = "image",
        name = "Paste image from clipboard",
        desc = "![[clipboard]]",
    }, {
        t("![["),
        d(2, function ()
            local handle = io.popen("wl-paste")

            if not handle then return sn(nil, i(i)) end

            local clip = handle:read("*a") or ""
            handle:close()

            clip = clip:gsub("%s+$", "")

            local pathToRemove = "/home/" .. os.getenv("USER") .. "/.docs/"
            clip = clip:gsub("^" .. pathToRemove, "../")

            return sn(nil, i(2, clip))
        end),

        t("]]"), i(1),
    }),
})

ls.add_snippets("markdown", {
    s({
        trig = "note",
        name = "Add internal link from clipboard",
        desc = "[[clipboard|$1]]",
    }, {
        t("[["),
        d(2, function ()
            local handle = io.popen("wl-paste")

            if not handle then return sn(nil, i(i)) end

            local clip = handle:read("*a") or ""
            handle:close()

            clip = clip:gsub("%s+$", "")

            local pathToRemove = "/home/" .. os.getenv("USER") .. "/.docs/"
            clip = clip:gsub("^" .. pathToRemove, "")

            return sn(nil, i(2, clip))
        end),

        t("|"), i(1), t("]]"),
    }),
})

