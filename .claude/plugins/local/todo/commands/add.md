---
allowed-tools: Bash(gh gist *), Bash(rm /tmp/todo*), mcp:github:get_gist, mcp:github:update_gist
description: Add a new todo item with optional project and priority
---

# Add Todo Item

Add a new item to the shared todo list.

**Gist:** `497eed5b72b2f97130f9382285dd7abc` / `todo.md`

## Arguments

The user's input after `/todo:add` is the item text. It may also include:
- A project name (e.g., `--project fcc-app` or just mentioning the project naturally)
- A priority (e.g., `--priority high` or `high priority`)
- Defaults: project = "Inbox", priority = "Medium"

## Steps

1. Fetch the gist: `get_gist({ gist_id: "497eed5b72b2f97130f9382285dd7abc" })` (MCP) or `gh gist view 497eed5b72b2f97130f9382285dd7abc --raw` (CLI)
2. Parse the item text, project, and priority from the user's input
3. Find the matching `## Project: <name>` section and `### <Priority>` subsection
4. If the project doesn't exist, create it with High/Medium/Low subsections
5. Append `- [ ] <item text> (YYYY-MM-DD)` with today's date
6. Update `<!-- last-updated: ... -->` to current UTC time
7. Write back: `update_gist({ gist_id: "...", filename: "todo.md", content: "<full content>" })` (MCP) or write to `/tmp/todo.md` then `gh gist edit 497eed5b72b2f97130f9382285dd7abc -a /tmp/todo.md && rm /tmp/todo.md` (CLI)
8. Confirm: "Added '<item>' to <project>/<priority>"
