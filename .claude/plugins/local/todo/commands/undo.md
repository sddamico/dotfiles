---
allowed-tools: Bash(gh gist *), Bash(rm /tmp/todo*), mcp:github:get_gist, mcp:github:update_gist
description: Uncheck a completed todo item by fuzzy text match
---

# Undo Todo

Re-open a completed item.

**Gist:** `497eed5b72b2f97130f9382285dd7abc` / `todo.md`

## Arguments

The user's input after `/todo:undo` is a fuzzy text match for the item to re-open.

## Steps

1. Fetch the gist: `get_gist({ gist_id: "497eed5b72b2f97130f9382285dd7abc" })` (MCP) or `gh gist view 497eed5b72b2f97130f9382285dd7abc --raw` (CLI)
2. Find completed items (`- [x]`) matching the text (case-insensitive substring)
3. If multiple matches, ask the user to clarify
4. Change `- [x]` to `- [ ]` for the matched item
5. Update `<!-- last-updated: ... -->` timestamp
6. Write back: `update_gist({ gist_id: "...", filename: "todo.md", content: "<full content>" })` (MCP) or write to `/tmp/todo.md` then `gh gist edit 497eed5b72b2f97130f9382285dd7abc -a /tmp/todo.md && rm /tmp/todo.md` (CLI)
7. Confirm: "Re-opened '<item>'"
