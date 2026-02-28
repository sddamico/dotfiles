---
allowed-tools: Bash(gh gist *), Bash(rm /tmp/todo*), mcp:github:get_gist, mcp:github:update_gist
description: Delete a todo item entirely by fuzzy text match
---

# Remove Todo

Permanently delete an item from the list.

**Gist:** `497eed5b72b2f97130f9382285dd7abc` / `todo.md`

## Arguments

The user's input after `/todo:remove` is a fuzzy text match for the item to delete.

## Steps

1. Fetch the gist: `get_gist({ gist_id: "497eed5b72b2f97130f9382285dd7abc" })` (MCP) or `gh gist view 497eed5b72b2f97130f9382285dd7abc --raw` (CLI)
2. Find items matching the text (case-insensitive substring, searches both open and completed)
3. If multiple matches, ask the user to clarify
4. Remove the entire line for the matched item
5. Preserve empty `### High/Medium/Low` sections — never delete section headers
6. Update `<!-- last-updated: ... -->` timestamp
7. Write back: `update_gist({ gist_id: "...", filename: "todo.md", content: "<full content>" })` (MCP) or write to `/tmp/todo.md` then `gh gist edit 497eed5b72b2f97130f9382285dd7abc -a /tmp/todo.md && rm /tmp/todo.md` (CLI)
8. Confirm: "Removed '<item>'"
