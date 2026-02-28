---
allowed-tools: Bash(gh gist *), mcp:github:get_gist
description: List all project names in the todo list
---

# List Projects

Show all project names from the todo list.

**Gist:** `497eed5b72b2f97130f9382285dd7abc` / `todo.md`

## Steps

1. Fetch the gist: `get_gist({ gist_id: "497eed5b72b2f97130f9382285dd7abc" })` (MCP) or `gh gist view 497eed5b72b2f97130f9382285dd7abc --raw` (CLI)
2. Extract all `## Project: <name>` headers
3. List them with a count of open items in each

This is a read-only command — do not write back to the gist.
