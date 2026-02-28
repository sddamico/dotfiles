---
allowed-tools: Bash(gh gist *), mcp:github:get_gist
description: List todo items, optionally filtered by project or priority
---

# List Todo Items

List open items from the shared todo list, with optional filtering.

**Gist:** `497eed5b72b2f97130f9382285dd7abc` / `todo.md`

## Arguments

The user's input after `/todo:list` is an optional filter:
- A project name (e.g., `fcc-app`, `personal`, `inbox`)
- A priority (e.g., `high`)
- Both (e.g., `fcc-app high`)
- If empty, show all open items grouped by project

## Steps

1. Fetch the gist: `get_gist({ gist_id: "497eed5b72b2f97130f9382285dd7abc" })` (MCP) or `gh gist view 497eed5b72b2f97130f9382285dd7abc --raw` (CLI)
2. Parse and filter items based on user input (case-insensitive matching on project names)
3. Display only open items (`- [ ]`), grouped by project and priority
4. If no items match, say so

This is a read-only command — do not write back to the gist.
