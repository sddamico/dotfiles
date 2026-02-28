---
allowed-tools: Bash(gh gist *), mcp:github:get_gist
description: Display the full formatted todo list
---

# Show Todo List

Display the entire todo list formatted nicely.

**Gist:** `497eed5b72b2f97130f9382285dd7abc` / `todo.md`

## Steps

1. Fetch the gist: `get_gist({ gist_id: "497eed5b72b2f97130f9382285dd7abc" })` (MCP) or `gh gist view 497eed5b72b2f97130f9382285dd7abc --raw` (CLI)
2. Display the full list formatted in markdown, preserving the project/priority structure

This is a read-only command — do not write back to the gist.
