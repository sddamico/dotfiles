---
allowed-tools: Bash(gh gist *), Bash(rm /tmp/todo*), mcp:github:get_gist, mcp:github:update_gist
description: Create a new project section in the todo list
---

# Add Project

Create a new project section with High/Medium/Low subsections.

**Gist:** `497eed5b72b2f97130f9382285dd7abc` / `todo.md`

## Arguments

The user's input after `/todo:add-project` is the project name.

## Steps

1. Fetch the gist: `get_gist({ gist_id: "497eed5b72b2f97130f9382285dd7abc" })` (MCP) or `gh gist view 497eed5b72b2f97130f9382285dd7abc --raw` (CLI)
2. Check if a project with that name already exists (case-insensitive). If so, inform the user.
3. Append a new section at the end:
   ```
   ## Project: <Name>
   ### High
   ### Medium
   ### Low
   ```
4. Update `<!-- last-updated: ... -->` timestamp
5. Write back: `update_gist({ gist_id: "...", filename: "todo.md", content: "<full content>" })` (MCP) or write to `/tmp/todo.md` then `gh gist edit 497eed5b72b2f97130f9382285dd7abc -a /tmp/todo.md && rm /tmp/todo.md` (CLI)
6. Confirm: "Created project '<name>'"
