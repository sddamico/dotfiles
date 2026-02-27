---
name: todo
model: haiku
allowed-tools: Bash(gh gist *), Bash(rm /tmp/todo*), mcp:github:get_gist, mcp:github:update_gist
description: Manage your shared todo list
---

# Todo List Manager

You manage a shared todo list stored in a GitHub Gist.

**Gist ID:** `497eed5b72b2f97130f9382285dd7abc`
**Gist Filename:** `todo.md`

## Tool Detection

This skill works in two environments. Detect which is available and use it consistently:

1. **GitHub MCP** (preferred — works in Claude Desktop and Claude Code): Use if `get_gist` and `update_gist` MCP tools are available.
2. **gh CLI** (fallback — Claude Code only): Use if MCP tools are not available but Bash is.

## Reading the Gist

Always fetch the latest content before every operation.

**Via GitHub MCP:**
```
get_gist({ gist_id: "497eed5b72b2f97130f9382285dd7abc" })
```

**Via gh CLI:**
```
gh gist view 497eed5b72b2f97130f9382285dd7abc --raw
```

## Writing the Gist

**Via GitHub MCP:**
```
update_gist({
  gist_id: "497eed5b72b2f97130f9382285dd7abc",
  filename: "todo.md",
  content: "<full updated markdown content>"
})
```

**Via gh CLI:**
1. Write the updated content to `/tmp/todo.md`
2. Run: `gh gist edit 497eed5b72b2f97130f9382285dd7abc -a /tmp/todo.md`
3. Run: `rm /tmp/todo.md`

## Markdown Format

The gist contains a single `todo.md` with this structure:

- `# Todo List` — title
- `<!-- last-updated: ISO-8601 -->` — timestamp updated on every write
- `## Project: <name>` — project sections
- `### High` / `### Medium` / `### Low` — priority subsections within each project
- `- [ ] Item text (YYYY-MM-DD)` — open item with creation date
- `- [x] Item text (YYYY-MM-DD)` — completed item
- Empty priority sections are always preserved (never delete a `### High/Medium/Low` line)
- "Inbox" is the default project for items without a specified project

## Commands

The user's input follows `/todo`. Interpret it naturally — strict flag syntax is not required.

| Command | Example | Description |
|---------|---------|-------------|
| `add` | `/todo add Fix login bug --project fcc-app --priority high` | Add item (defaults: Inbox, medium) |
| `list` | `/todo list --project fcc-app` | List/filter items. Can also be conversational: `/todo what's on my personal list?` |
| `done` | `/todo done grocery store` | Mark item complete by fuzzy text match |
| `undo` | `/todo undo grocery store` | Uncheck a completed item by fuzzy text match |
| `remove` | `/todo remove grocery store` | Delete an item entirely by fuzzy text match |
| `move` | `/todo move grocery store --project personal --priority high` | Move item between projects and/or priorities |
| `projects` | `/todo projects` | List all project names |
| `add-project` | `/todo add-project work` | Create a new project section with High/Medium/Low subsections |
| `show` | `/todo show` | Display the full formatted todo list |

If the input doesn't clearly match a command, infer the intent. For example:
- `/todo fix the login bug for fcc-app, high priority` → add with project=fcc-app, priority=high
- `/todo what do I need to do?` → list all open items
- `/todo I finished the grocery store task` → mark done

## Write Flow

When you need to modify the list:

1. **Always fetch the latest** gist content first (see "Reading the Gist" above)
2. Apply the requested changes to the markdown content
3. Update the `<!-- last-updated: ... -->` timestamp to the current UTC time
4. Write the updated content back (see "Writing the Gist" above)
5. Confirm the change to the user

## Rules

- **Always read before writing** — fetch the latest gist content before making any changes
- **Preserve structure** — never remove empty `### High/Medium/Low` sections or `## Project:` headers
- **Date new items** — append `(YYYY-MM-DD)` with today's date when adding items
- **Fuzzy matching** — when matching items by text (done/undo/remove/move), use case-insensitive substring matching. If multiple items match, ask the user to clarify.
- **Confirm changes** — after writing, briefly confirm what was done (e.g., "Added 'Fix login bug' to fcc-app/High")
- **Read-only commands** — `list`, `projects`, and `show` do not require writing back to the gist
- For `show`, display the full list formatted nicely in markdown
- For `list`, you can filter and summarize — show only matching/open items
