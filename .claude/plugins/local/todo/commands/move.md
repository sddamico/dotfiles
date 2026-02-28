---
allowed-tools: Bash(gh gist *), Bash(rm /tmp/todo*), mcp:github:get_gist, mcp:github:update_gist
description: Move a todo item between projects and/or priorities
---

# Move Todo

Move an item to a different project and/or priority.

**Gist:** `497eed5b72b2f97130f9382285dd7abc` / `todo.md`

## Arguments

The user's input after `/todo:move` includes:
- Item text (fuzzy match)
- Target project and/or priority (e.g., `--project personal --priority high`)

## Steps

1. Fetch the gist: `get_gist({ gist_id: "497eed5b72b2f97130f9382285dd7abc" })` (MCP) or `gh gist view 497eed5b72b2f97130f9382285dd7abc --raw` (CLI)
2. Find the item by fuzzy text match (case-insensitive substring)
3. If multiple matches, ask the user to clarify
4. Remove the item from its current location
5. Add it under the target project/priority (create project section if it doesn't exist)
6. Preserve empty section headers
7. Update `<!-- last-updated: ... -->` timestamp
8. Write back: `update_gist({ gist_id: "...", filename: "todo.md", content: "<full content>" })` (MCP) or write to `/tmp/todo.md` then `gh gist edit 497eed5b72b2f97130f9382285dd7abc -a /tmp/todo.md && rm /tmp/todo.md` (CLI)
9. Confirm: "Moved '<item>' to <project>/<priority>"
