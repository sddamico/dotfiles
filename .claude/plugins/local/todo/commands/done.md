---
allowed-tools: Bash(gh gist *), Bash(rm /tmp/todo*), mcp:github:get_gist, mcp:github:update_gist
description: Mark a todo item as complete by fuzzy text match
---

# Mark Todo Done

Mark an open item as complete.

**Gist:** `497eed5b72b2f97130f9382285dd7abc` / `todo.md`

## Arguments

The user's input after `/todo:done` is a fuzzy text match for the item to complete.

## Steps

1. Fetch the gist: `get_gist({ gist_id: "497eed5b72b2f97130f9382285dd7abc" })` (MCP) or `gh gist view 497eed5b72b2f97130f9382285dd7abc --raw` (CLI)
2. Find open items (`- [ ]`) matching the text (case-insensitive substring)
3. If multiple matches, ask the user to clarify
4. Change `- [ ]` to `- [x]` for the matched item
5. Update `<!-- last-updated: ... -->` timestamp
6. Write back: `update_gist({ gist_id: "...", filename: "todo.md", content: "<full content>" })` (MCP) or write to `/tmp/todo.md` then `gh gist edit 497eed5b72b2f97130f9382285dd7abc -a /tmp/todo.md && rm /tmp/todo.md` (CLI)
7. Confirm: "Completed '<item>'"
