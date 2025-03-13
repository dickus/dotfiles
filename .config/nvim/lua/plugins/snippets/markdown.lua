local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local sn = ls.snippet_node
local d = ls.dynamic_node

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
            local handle = io.popen("xclip -o -selection clipboard")
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
            local handle = io.popen("xclip -o -selection clipboard 2>/dev/null")

            if not handle then return sn(nil, i(i)) end

            local clip = handle:read("*a") or ""
            handle:close()

            clip = clip:gsub("%s+$", "")

            local pathToRemove = "/home/" .. os.getenv("USER") .. "/.docs/"
            clip = clip:gsub("^" .. pathToRemove, "")

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
            local handle = io.popen("xclip -o -selection clipboard 2>/dev/null")

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

