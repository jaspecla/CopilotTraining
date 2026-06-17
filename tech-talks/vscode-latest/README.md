---
status: active
updated: 2026-05-13
section: "Developers"
references:
  - url: https://code.visualstudio.com/updates/v1_120
    label: "VS Code release notes: May 13, 2026 (v1.120)"
    verified: 2026-05-13
  - url: https://code.visualstudio.com/updates/v1_119
    label: "VS Code release notes: May 6, 2026 (v1.119)"
    verified: 2026-05-13
  - url: https://code.visualstudio.com/updates/v1_118
    label: "VS Code release notes: April 29, 2026 (v1.118)"
    verified: 2026-05-13
  - url: https://code.visualstudio.com/updates/v1_117
    label: "VS Code release notes: April 22, 2026 (v1.117)"
    verified: 2026-04-22
  - url: https://code.visualstudio.com/updates/v1_115
    label: "VS Code release notes: April 8, 2026 (v1.115)"
    verified: 2026-04-13
  - url: https://code.visualstudio.com/updates/v1_114
    label: "VS Code release notes: April 1, 2026 (v1.114)"
    verified: 2026-04-13
  - url: https://code.visualstudio.com/updates/v1_113
    label: "VS Code release notes: March 25, 2026 (v1.113)"
    verified: 2026-04-13
  - url: https://code.visualstudio.com/updates/v1_112
    label: "VS Code release notes: March 18, 2026 (v1.112)"
    verified: 2026-04-13
  - url: https://code.visualstudio.com/updates/v1_111
    label: "VS Code release notes: March 9, 2026 (v1.111)"
    verified: 2026-04-13
  - url: https://code.visualstudio.com/updates/v1_110
    label: "VS Code release notes: February 2026 (v1.110)"
    verified: 2026-04-13
  - url: https://code.visualstudio.com/docs/copilot/overview
    label: "GitHub Copilot in VS Code documentation"
    verified: 2026-04-13
  - url: https://code.visualstudio.com/docs/copilot/customization/agent-plugins
    label: "Agent Plugins documentation"
    verified: 2026-04-13
  - url: https://code.visualstudio.com/docs/copilot/customization/agent-skills
    label: "Agent Skills documentation"
    verified: 2026-04-13
  - url: https://code.visualstudio.com/docs/copilot/agents/background-agents
    label: "Background Agents documentation"
    verified: 2026-04-13
---

# What's New in Copilot for VS Code: v1.110 – v1.120

> **The Question This Talk Answers:**
> *"What are the most impactful new Copilot features in VS Code's recent releases, and how do I start using them today?"*

**Duration:** 45-60 minutes | **Target Audience:** Developers using GitHub Copilot in VS Code

---

## 📊 Content Fitness

| Criterion | Assessment | Notes |
|-----------|-----------|-------|
| **Relevant** | 🟢 High | Every developer using Copilot in VS Code needs to know what shipped. These features are available today and change daily workflows. |
| **Compelling** | 🟢 High | Organized by theme so practitioners see how features connect. Concrete settings and demos for each capability. |
| **Actionable** | 🟢 High | Every feature is available now in VS Code 1.110+. Settings provided inline. Enable features during or right after the talk. |

**Overall Status:** 🟢 Ready to use

---


## Eleven Releases at a Glance

> **Note:** Starting with v1.111 (March 2026), VS Code moved to **weekly stable releases**.

| Release | Date | Headline Theme |
|---------|------|----------------|
| **v1.120** | May 13, 2026 | **Agents Window (Stable preview)**, command risk assessment, terminal output compression, BYOK thinking effort, Markdown diff preview [^15] |
| **v1.119** | May 6, 2026 | **Agent-browser tab sharing**, OpenTelemetry tracing for chat, inline diffs in chat, Copilot commit attribution revert, reduced trust interruptions [^16] |
| **v1.118** | April 29, 2026 | **Remote Copilot CLI**, token efficiency (93%+ prompt cache hit), enterprise org restrictions, CLI auto model selection, Co-authored-by trailer [^17] |
| **v1.117** | April 22, 2026 | **BYOK for Enterprise** (bring your own model keys), incremental chat rendering, agent session sorting, CLI terminal profile integration [^14] |
| **v1.115** | April 8, 2026 | **VS Code Agents companion app**, terminal tools for background commands, browser tool improvements [^9] |
| **v1.114** | April 1, 2026 | Video in chat, Copy Final Response, simplified #codebase semantic search, /troubleshoot previous sessions, TypeScript 6.0 [^8] |
| **v1.113** | March 25, 2026 | **Chat Customizations editor**, configurable thinking effort, **nested subagents**, MCP in CLI/Claude agents, session forking [^7] |
| **v1.112** | March 18, 2026 | **Integrated browser debugging**, Copilot CLI Autopilot, **MCP server sandboxing**, image/binary support, **monorepo customizations** [^6] |
| **v1.111** | March 9, 2026 | **Weekly releases begin**, **Autopilot mode**, agent permissions picker, agent-scoped hooks, debug events snapshot [^5] |
| **v1.110** | February 2026 | Agent Plugins, agentic browser tools, context compaction, session forking, /create-* commands, Explore subagent [^1] |

---

## 🧠 The Shift

> **The Core Insight:** From **one AI assistant you converse with** to **a team of specialized AI agents you orchestrate across local, background, cloud, and Claude sessions — now with full autonomy via Autopilot, observable via OpenTelemetry, and manageable from a dedicated Agents Window**

---

<!-- 🎬 MAJOR SECTION: Autopilot & Agent Autonomy -->
## Autopilot & Agent Autonomy (v1.111 → v1.120)

The biggest evolution in recent releases is **agent autonomy**. Agents can now work completely independently, approving their own actions and iterating until tasks complete.

### Autopilot Mode (v1.111)

**Autopilot** lets agents operate fully autonomously — auto-approving tool calls, retrying on errors, and continuing until the task is complete [^5]:

```json
// Enable Autopilot mode (on by default in Insiders)
"chat.autopilot.enabled": true
```

### Permission Levels (v1.111 → v1.112)

The permissions picker in Chat view controls agent autonomy per-session [^5] [^6]:

| Permission Level | Behavior |
|-----------------|----------|
| **Default Approvals** | Uses your configured approval settings with confirmation dialogs |
| **Bypass Approvals** | Auto-approves all tool calls, auto-retries on errors |
| **Autopilot** | Full autonomy: auto-approves, auto-retries, auto-responds to questions, continues until `task_complete` |

**New in v1.112:** Copilot CLI sessions now support the same permission levels [^6].

### VS Code Agents Companion App (Preview, v1.115)

A new companion app ships alongside VS Code Insiders, built specifically for agent-native development [^9]:

- **Parallelize tasks** — Run agent sessions across multiple repos simultaneously (each in its own worktree)
- **Monitor and review** — Track session progress, view diffs inline, leave feedback, create PRs
- **Customizations carry over** — All your instructions, agents, skills, MCP servers, hooks, and themes work in the Agents app
- **No extra install** — Ships with VS Code Insiders; launch from Command Palette: **Chat: Open Agents Application**

```json
// The Agents app uses the same customization files as VS Code
// No additional configuration needed
```

### Agents Window — Stable Preview (v1.120)

The Agents Window is now available as a **stable preview** — no longer limited to Insiders [^15]:

- **Dedicated agent dashboard** — Orchestrate and manage coding agents across multiple projects from a single window
- **Session persistence** — Preferences, themes, keybindings, and extensions carry across sessions
- **Streamlined review** — Completed sessions show all edits by default; discard edits directly from the Changes panel
- **Upstream sync** — New sync button in Files panel pulls upstream changes before agent work begins
- **Remote agents** — Run agents on remote machines with full environment configuration
- **Agent harness picker** — Select which agent harness to use per session

---

<!-- 🎬 MAJOR SECTION: Agent Sessions & Orchestration -->
## Agent Sessions & Orchestration

The biggest evolution across these releases is how VS Code manages multiple agent sessions. What started as a single Chat view conversation is now a unified multi-agent platform.

### Agent Session Types

VS Code supports four agent types optimized for different workflows [^1]:

| Agent Type | Best For | Key Trait |
|-----------|---------|----------|
| **Local** | Interactive planning, exploration | Real-time in Chat view |
| **Background** | Autonomous multi-file tasks | Runs in isolated Git worktree |
| **Cloud** | Cross-repo operations at scale | GitHub-hosted infrastructure |
| **Claude** | Complex reasoning, architecture | Anthropic SDK with thinking tokens |

The session type picker lets you start in one mode and hand off to another — plan locally, then click **Continue in → Background** to let the agent implement autonomously while you continue working.

### Background Agents with Git Worktree Isolation

Background agents run in dedicated Git worktrees, preventing conflicts with your active workspace:

- Agent creates a new worktree automatically for the session
- Changes are committed per turn to the worktree — your main workspace is untouched
- Review via diff view when the agent completes; apply all, cherry-pick, or discard
- Multiple background agents can run simultaneously in separate worktrees

```json
// Copy extra files into worktrees (e.g., git-ignored config)
"git.worktreeIncludeFiles": ["config/local.json", ".env.local"]
```

**v1.110:** Background agents support `/compact` for manual context compaction, slash commands for prompts/hooks/skills, and session renaming [^1].

### Parallel Subagents & Explore (v1.110)

Agents can delegate subtasks to **subagents** that operate in their own context windows. Subagents run in parallel, significantly speeding up tasks that can be split into independent parts.

A dedicated **Explore subagent** handles all codebase research for the Plan agent [^1]. Explore is read-only, uses only search and file read tools, and runs on fast models (Claude Haiku 4.5, Gemini 3 Flash) by default.

```json
// Override the model used by Explore
"chat.exploreAgent.defaultModel": "claude-haiku-4-5"
```

### Session Management (v1.110 → v1.117)

Fork sessions with `/fork` to branch conversations without losing context. Context compaction (`/compact`) manually summarizes history when approaching context limits. Plans persist to session memory across turns [^1].

```json
"workbench.startupEditor": "agentSessionsWelcomePage"
```

### Nested Subagents (v1.113)

Subagents can now invoke other subagents, enabling complex multi-step workflows [^7]:

```json
// Enable nested subagent invocations
"chat.subagents.allowInvocationsFromSubagents": true
```

This unlocks recursive task execution — an orchestrator agent can delegate to specialist agents, which can further delegate subtasks.

### Agent Session Sorting (v1.117)

When many agent sessions accumulate, sort them by **latest activity** or **creation date** to jump back into the right context without scrolling [^14]:

- Click the sort control in the Sessions panel header
- Options: Latest Activity (default) or Creation Date
- Combines with existing search and status filters

### Remote Copilot CLI Sessions (v1.118)

Monitor and control Copilot CLI sessions remotely — from GitHub.com or a mobile device [^17]:

- Start a remote session with the `/remote` command in Copilot CLI
- Check session status, send follow-up prompts, and review outputs from any browser
- No need to stay at the machine where the session started

**CLI auto model selection** (v1.118): The system picks the optimal model per prompt and marks the response with the model used [^17].

### OpenTelemetry Tracing for Chat (v1.119)

Copilot Chat sessions can now emit OpenTelemetry data for monitoring, debugging, and performance tracking [^16]. This enables organizations to:

- Trace agent session execution end-to-end
- Monitor tool call latency and success rates
- Debug agent behavior in production workflows
- Feed traces into existing observability platforms (Datadog, Grafana, etc.)

### MCP in Copilot CLI & Claude Agents (v1.113)

MCP servers configured in VS Code are now available to Copilot CLI and Claude agents [^7]. This bridges your workspace MCP configuration to all agent types:

- User-defined MCP servers work across all session types
- Workspace MCP servers (from `mcp.json`) are bridged automatically
- Session forking also works in Copilot CLI and Claude agents

```json
// Fork sessions in Copilot CLI (enabled by default in Insiders)
"github.copilot.chat.cli.forkSessions.enabled": true
```

---

<!-- 🎬 MAJOR SECTION: Agent Customization -->
## Agent Customization

### Bring Your Own Key (BYOK, v1.117)

Copilot Business and Enterprise users can now connect their own API keys for language models directly in VS Code Chat — without switching tools or losing workflow context [^14]:

**How it works:**
1. Admin enables the BYOK policy in GitHub.com Copilot settings for the organization
2. Members open the model picker → **Manage Models…** → add a provider and API key
3. All available models for that key appear as selectable options in chat

**Supported providers (built-in):** OpenAI, Anthropic, Google, Azure OpenAI, OpenRouter, Ollama, and any OpenAI-compatible endpoint.

**Extension ecosystem:** Language model providers can also contribute models through extensions using the Language Model Chat Provider API — the model list grows with the extension marketplace.

```json
// No VS Code settings needed — admin enables via GitHub.com Copilot policy
// Developers then add API keys via: Chat model picker → Manage Models…

// For custom OpenAI-compatible endpoints:
// Add endpoint URL + API key in the "Custom" provider section
```

**Key constraints:**
- Billing and rate limits are handled by the model provider — not GitHub Copilot quotas
- BYOK requires Copilot Business or Enterprise; not available on Copilot Individual
- Admin can restrict which providers org members can add

---

### Chat Customizations Editor (Preview, v1.113)

A unified UI for managing all chat customizations in one place [^7]:

- **Organized tabs** for custom instructions, prompt files, custom agents, and agent skills
- **Embedded code editor** with syntax highlighting and validation
- **AI-assisted generation** — create customizations from scratch or have AI generate them
- **Marketplace browsing** — add MCP servers and agent plugins directly

Open via: **Configure Chat (gear icon)** in Chat view, or **Chat: Open Chat Customizations** from Command Palette.

### Agent Skills

Agent Skills package domain expertise into reusable folders that agents load on-demand. Skills are **generally available and enabled by default** [^1]:

```
.github/skills/
  api-design/
    SKILL.md          # Instructions, templates, validation
  security-review/
    SKILL.md
```

Each `SKILL.md` has a description in its frontmatter — agents match skills to tasks automatically.

```json
// Skills are enabled by default
"chat.useAgentSkills": true,

// Add custom skill locations
"chat.agentSkillsLocations": {
  "~/.copilot/skills": true,
  "shared/team-skills": true
}
```

**v1.118:** Skills now have isolated execution contexts, keeping the main chat focused with clearer contextual separation [^17].

### Agent Plugins (Experimental, v1.110)

Agent Plugins are prepackaged bundles of chat customizations — skills, commands, agents, MCP servers, and hooks — installable directly from the Extensions view [^1]:

```json
// Enable agent plugins
"chat.plugins.enabled": true,

// Add additional plugin marketplaces (GitHub repos)
"chat.plugins.marketplaces": ["copilot-plugins", "awesome-copilot"],

// Register local plugin directories
"chat.plugins.paths": {"/path/to/local/plugin": true}
```

Search and install plugins with `@agentPlugins` in the Extensions view or via the **Chat: Plugins** command.

### Custom Agent Controls

Custom agents (`.agent.md` files) support powerful attributes [^1]:

- **`user-invokable: false`** — Create agents accessible only as subagents, not from the agents dropdown
- **`disable-model-invocation`** — Prevent an agent from being invoked automatically by other agents
- **`agents: ['Modify', 'Search']`** — Restrict which subagents a given agent can invoke
- **Multiple model support** — Specify fallback models in order of preference

```markdown
---
name: architect
model: ['Claude Sonnet 4.5 (copilot)', 'GPT-5 (copilot)']
tools: ['readFiles', 'codeSearch', 'agent']
agents: ['Modify', 'Search']
user-invokable: true
---

You are an experienced software architect...
```

### Organization-Wide Instructions

**Org-level custom agents** and **org-level custom instructions** let GitHub organizations enforce consistent AI guidance across all developers [^1]:

```json
// Enabled by default
"github.copilot.chat.organizationInstructions.enabled": true
```

### Enterprise Organization Restrictions (v1.118)

Organizations can now restrict access to Copilot chat and agent features unless developers are signed into GitHub with a membership in an approved organization [^17]. This is enforced via device policy, enabling tighter enterprise governance for AI tools.

### Create Agent Customizations from Chat (v1.110)

Generate agent customization files directly from conversations using `/create-*` slash commands [^1]:

- `/create-prompt` — Generate a reusable prompt file
- `/create-instruction` — Generate an instruction file for project conventions
- `/create-skill` — Extract a multi-step workflow into a skill package
- `/create-agent` — Create a specialized custom agent persona
- `/create-hook` — Create a hook configuration for lifecycle automation

After debugging an issue, use `/create-skill` to capture the procedure as reusable expertise. Natural language works too: "save this workflow as a skill".

### `/init` — Bootstrap Your Workspace for AI

The `/init` slash command analyzes your project structure and generates a tailored `copilot-instructions.md` or `AGENTS.md` file automatically [^1].

### Agent Debug Panel (Preview, v1.110 → v1.112)

The Agent Debug panel provides deep visibility into chat sessions and customization loading [^1]:

- Real-time chat events including system prompts, tool calls, and customization events
- See exactly which prompt files, skills, hooks, and agents are loaded for a session
- Chart view displays visual hierarchy of events for quick structural understanding
- Replaces the old Diagnostics chat action with richer detail

Open from Command Palette: **Developer: Open Agent Debug Panel**, or select the gear icon in Chat view → **View Agent Logs**.

**New in v1.111:** Debug events snapshot — attach `#debugEventsSnapshot` as context in chat to troubleshoot agent behavior [^5].

**New in v1.112:** Export/import debug logs for offline analysis and sharing. The `/troubleshoot` skill analyzes logs directly in conversation [^6].

### Agent-Scoped Hooks (Preview, v1.111)

Custom agent frontmatter now supports hooks that only run for that specific agent [^5]:

```markdown
---
name: security-reviewer
hooks:
  preProcess: validate-scope
  postProcess: generate-report
---
```

Enable with: `"chat.useCustomAgentHooks": true`

### Monorepo Customizations Discovery (v1.112)

In monorepo setups, VS Code now discovers customization files from parent folders up to the repository root [^6]:

```json
// Enable parent repository discovery
"chat.useCustomizationsInParentRepositories": true
```

This applies to all customization types: instructions, prompt files, custom agents, skills, and hooks. Share repository-wide guidance across all packages without opening the full monorepo.

---

<!-- 🎬 MAJOR SECTION: Claude & Anthropic Integration -->
## Claude & Anthropic Integration

### Claude Agent (v1.110)

VS Code supports the **Claude Agent SDK** directly — delegate tasks using the Anthropic agent harness with models from your GitHub Copilot subscription. Claude Agent appears as a session type alongside Local, Background, and Cloud.

Steering and queuing for mid-conversation redirects, session renaming, context window rendering with compaction, additional slash commands (`/compact`, `/agents`, `/hooks`), and significant performance improvements [^1].

### Thinking Tokens (v1.110 → v1.113)

Anthropic models show **thinking tokens** — visible reasoning that shows hypothesis formation, tool selection, and error recovery in real-time:

```json
// Choose detailed or compact thinking style
"chat.thinking.style": "detailed",

// Collapse tool sections to reduce noise
"chat.agent.thinking.collapsedTools": ["terminal", "search"],

// Auto-expand failing tool calls
"chat.tools.autoExpandFailures": true
```

**v1.113:** Configurable thinking effort directly in the model picker — no settings needed [^7]. Select a reasoning model (Claude Sonnet 4.6, GPT-5.4) and choose Low/Medium/High effort. The picker label shows the current level (e.g., "GPT-5.3-Codex · Medium").

**v1.120:** BYOK models now also support thinking effort configuration in the model picker [^15].

> **Note:** The `github.copilot.chat.anthropic.thinking.budgetTokens` and `github.copilot.chat.responsesApiReasoningEffort` settings are deprecated in favor of the model picker UI.

### Additional Claude Features

- **Tool search tool** — Helps Claude discover the most relevant tools from a large pool
- **Context editing (Experimental)** — Clears tool results and thinking tokens from previous turns
- **`getDiagnostics` tool** — Let the agent access editor and workspace problems (v1.110) [^1]
- **Custom thinking phrases** — Customize loading text during reasoning (v1.110) [^1]
- **Claude session listing via SDK** — Sessions now use official Claude agent SDK APIs (v1.113) [^7]

```json
"chat.agent.thinking.phrases": {
  "mode": "replace",
  "phrases": ["Analyzing architecture...", "Evaluating patterns..."]
}
```

---

<!-- 🎬 MAJOR SECTION: Security & Trust -->
## Security & Trust

### MCP Server Sandboxing (v1.112)

Run locally configured stdio MCP servers in a sandboxed environment on macOS and Linux [^6]:

```json
// In mcp.json - enable per-server sandboxing
{
  "servers": {
    "my-server": {
      "command": "node",
      "args": ["./server.js"],
      "sandboxEnabled": true
    }
  }
}
```

When a sandboxed server needs additional folder or domain access, VS Code prompts for permission and updates the sandbox configuration.

### Terminal Sandboxing (v1.110)

OS-level sandboxing restricts agent-executed terminal commands:

- **File system**: Read/write only within the workspace directory
- **Network**: Blocked by default; specific domains can be allowlisted
- **Supported on**: macOS (`sandbox-exec`) and Linux (Landlock/seccomp)

```json
{
  "chat.tools.terminal.sandbox.enabled": true,
  "chat.tools.terminal.sandbox.network": ["github.com", "npmjs.com"]
}
```

Trusted domains can be selected via `allowTrustedDomains` in network settings. No installation required on macOS; Linux works without ripgrep [^1].

### Command Risk Assessment (v1.120)

Terminal commands are now assessed for risk before execution [^15]. VS Code evaluates commands and provides warnings or additional context when a command could be destructive or have unintended side effects — adding a safety layer before agents or developers run potentially dangerous operations.

### Auto-Approval & YOLO Mode (v1.110)

Auto-approval enables agents to run approved commands without confirmation [^1]:

| Release | New Auto-Approved Commands |
|---------|---------------------------|
| v1.110 | `/autoApprove` and `/yolo` slash commands for global auto-approve toggle |

```json
"chat.tools.terminal.enableAutoApprove": true,
"chat.tools.terminal.autoApproveWorkspaceNpmScripts": true
```

**New in v1.110:** Toggle auto-approve directly from chat with `/autoApprove` or `/yolo` (and disable with `/disableAutoApprove` or `/disableYolo`) [^1].

### Terminal Tool Improvements (v1.110 → v1.119)

- **Richer command details** — Inline syntax highlighting for Python/Node/Ruby, working directory display, command intent description on hover
- **Output streaming** — Long-running commands auto-expand to show progress; quick commands stay collapsed
- **Interactive input** — Embedded terminals support direct typing for confirmation prompts
- **Timeout property** — Required on all terminal tool calls; prevents hung processes
- **Background management** — `awaitTerminal` and `killTerminal` tools for proper lifecycle control
- **Collapsible terminal calls** — Terminal output displayed as collapsible sections to reduce noise (v1.110) [^1]
- **Prevent auto-suspend** — VS Code asks the OS not to suspend while chat requests run (v1.110) [^1]
- **Interactive terminal access** (v1.119) — Agents have read/write access to open terminals for advanced automation [^16]
- **Terminal output compression** (v1.120) — Large terminal outputs are automatically compressed to reduce context window usage [^15]

---

<!-- 🎬 MAJOR SECTION: Chat UX & Productivity -->
## Chat UX & Productivity

### Agent-Browser Tab Sharing (v1.119)

Agents can now discover and request access to integrated browser tabs for real-time validation [^16]:

- **Explicit sharing required** — Agents know how many tabs are open but cannot access them until you approve
- **Multiple sharing methods** — Context picker, drag-and-drop, or accept agent requests
- **Agent-initiated requests** — Agents can request to share a specific tab when they need to interact with it
- **Tab reuse suggestions** — If an agent tries to open a new tab on the same domain as an existing one, VS Code prompts to reuse the current tab

This enables agents to verify code changes live, reload pages, and confirm fixes without leaving the chat workflow.

### Inline Diffs in Chat (v1.119)

Code changes made in agent sessions are now visible as diffs directly in the chat thread [^16], making it easier to review what agents changed without switching to a separate diff view.

### Markdown Diff Preview (v1.120)

When reviewing diffs for Markdown files, VS Code can now show formatted content side-by-side — not just raw syntax [^15]. This improves Markdown authoring and review workflows significantly.

### Incremental Chat Rendering (Experimental, v1.117)

Chat responses now stream block-by-block instead of in large chunks, making responses feel significantly more fluid and interactive [^14]:

```json
{
  // Enabled by default in v1.117+
  "chat.experimental.incrementalRendering.enabled": true,

  // Animation style: fade (default), rise, blur, scale, slide, reveal, none
  "chat.experimental.incrementalRendering.animationStyle": "fade",

  // Buffering: off (default — fastest), word, paragraph
  "chat.experimental.incrementalRendering.buffering": "off"
}
```

**Tradeoff:** Lower buffering (`off`) renders fastest but may show incomplete words mid-stream. Use `word` or `paragraph` buffering for cleaner visual updates at the cost of slightly more latency.

### Copilot CLI — Launch from Any Terminal Profile (v1.117)

Copilot CLI can now be launched from any configured terminal profile — not just the default shell [^14]. This means PowerShell users on macOS and bash users on Windows can invoke the CLI without switching profiles.

Long-running background commands also now push notifications directly into the chat panel for easier tracking without context-switching to the terminal.

### Integrated Browser Debugging (v1.112)

Debug web apps end-to-end without leaving VS Code [^6]:

- Set breakpoints, step through code, inspect variables in an integrated browser
- Supports most Chrome and Edge configurations
- Self-signed certificate bypass for local development

```json
"workbench.browser.enableChatTools": true
```

**New in v1.115:** Browser agent tools have better labels with links to target tabs, long-running script support, and reduced duplicate tab opening [^9].

### Agentic Browser Tools (Experimental, v1.110 → v1.119)

Agents can now autonomously interact with the integrated browser to validate web app changes while building them [^1]:

- **Page navigation**: `openBrowserPage`, `navigatePage`
- **Page content**: `readPage`, `screenshotPage`
- **User interaction**: `clickElement`, `hoverElement`, `dragElement`, `typeInPage`, `handleDialog`
- **Custom automation**: `runPlaywrightCode`

Pages opened by agents run in private, in-memory sessions. Explicitly share a page to give the agent temporary access.

### Terminal Tools Improvements (v1.115)

New capabilities for agents to interact with background terminals [^9]:

- **`send_to_terminal` tool** — Send input to background terminals (passwords, confirmations)
- **Background notifications** — Agents are notified when background commands complete or need input

```json
// Enable background terminal notifications (experimental)
"chat.tools.terminal.backgroundNotifications": true
```

### Simplified Workspace Search (v1.114)

The `#codebase` tool is now purely semantic — no more fuzzy text search fallback [^8]:

- Consistent, high-quality semantic search results
- Unified index management (no more local vs remote distinction)
- VS Code builds and manages indexes automatically on demand
- Workspaces that had local indexes will need reindexing

### /troubleshoot for Previous Sessions (v1.114)

Diagnose chat issues from any previous session, not just the current one [^8]:

```
/troubleshoot #session
```

This triggers a session picker to select from previous chat sessions for analysis.

### Image & Video Support (v1.112 → v1.114)

- **Image/binary file support** (v1.112) — Agents can read images and binary files (hexdump format) [^6]
- **Image carousel** (v1.112) — View agent-generated images in a dedicated viewer [^6]
- **Video preview** (v1.114) — Chat image carousel now supports video playback [^8]

```json
"chat.imageCarousel.enabled": true,
"imageCarousel.explorerContextMenu.enabled": true
```

### Copy Final Response (v1.114)

Copy only the final Markdown response, excluding tool calls and process details [^8]. Right-click in chat → **Copy Final Response**.

### Tools for Usages and Rename (v1.110)

New `usages` and `rename` tools leverage existing LSP capabilities for precise code navigation and refactoring [^1]. Agents should pick these up automatically, but you can hint with `#rename` or `#usages`.

### Mermaid Diagrams in Chat

Chat responses can render interactive Mermaid diagrams — flowcharts, sequence diagrams, and more. Pan, zoom, and open in a full-sized editor.

### Ask Questions Tool (v1.110)

Instead of making assumptions, the agent can present clarifying questions with single/multi-select options, free text, and recommended answers. The **Plan agent** uses this in a structured 4-phase workflow: Discovery → Alignment → Design → Refinement.

The tool is built into VS Code core. Send steering messages without dismissing questions first. Keyboard navigation with Alt+N/Alt+P [^1].

### Token Efficiency & Context Window (v1.110 → v1.118)

A context window indicator in the chat input area shows token usage breakdown by category on hover.

Manual context compaction with `/compact` summarizes conversation history to free up space. Add instructions like `/compact focus on database decisions`. Available for local, background, and Claude sessions [^1].

**v1.118 — Major token efficiency improvements** ahead of usage-based billing [^17]:
- **Prompt caching** now hits over 93% cache reuse with strategic cache breakpoints
- **Cache-stable system prompts** reduce redundant token consumption
- **Improved tool list handling** saves up to 20% more tokens per session
- **Background compaction** runs automatically to manage long-running sessions

### Copilot Memory (Preview)

Persistent context across sessions — the agent can store and recall important information like preferences, conventions, and project context:

```json
"github.copilot.chat.copilotMemory.enabled": true
```

Plans created by the Plan agent persist to session memory and stay available across turns, including after context compaction [^1].

### Chat Session Insights (v1.118)

VS Code can now generate standup reports, tips, and answer questions about past chat activity [^17] — turning chat history into practical reports for team updates or retrospective insight.

### Copilot Commit Attribution (v1.118 → v1.119)

**v1.118:** Git commits made with Copilot assistance include a "Co-authored-by: Copilot" trailer by default via `git.addAICoAuthor` [^17].

**v1.119:** Following community feedback, this was **reverted to opt-in** — the trailer is no longer appended by default [^16].

### Integrated Browser (Preview)

A full integrated browser replaces the limited Simple Browser. Sign into websites, use DevTools, send elements to chat for AI assistance:

```json
"workbench.browser.openLocalhostLinks": true,
"simpleBrowser.useIntegratedBrowser": true
```

### Reduced Trust Interruptions (v1.119)

Fewer prompts for network access or temporary folder usage [^16], streamlining workflows and allowing agents to operate with fewer interruptions.

### Chat UX Improvements (v1.110)

- **Redesigned model picker** — Organized sections (Auto, Featured, Recent, Other), search box, rich hover with model capabilities [^1]
- **Contextual tips** — Feature discovery suggestions based on your usage patterns (`chat.tips.enabled`) [^1]
- **Inline chat hover mode** — New lightweight UI via `inlineChat.renderMode` [^1]
- **Inline chat affordance** — Easier access to inline chat via `inlineChat.affordance` (editor or gutter) [^1]
- **Edit mode deprecated** — Agent mode now handles everything; edit mode hidden by default [^1]

---

## 🧠 Mental Model Shift

> **The Core Insight:** From **one AI assistant you converse with** to **a team of autonomous AI agents you orchestrate — with Autopilot, observable via OpenTelemetry, manageable from the Agents Window, and optimized for token efficiency**

### Move Toward ✅

- ✅ **Autopilot mode**: Let agents work autonomously; enable Autopilot for complex multi-step tasks
- ✅ **Agents Window**: Manage agent sessions across repos from a dedicated window (now in Stable preview)
- ✅ **Multi-session workflows**: Plan locally → implement in background → review worktree diff → merge selectively
- ✅ **Domain-specific Skills**: Capture team expertise once in `SKILL.md` files; agents apply it automatically
- ✅ **Visible reasoning**: Use thinking effort picker (Low/Medium/High) on complex tasks
- ✅ **Sandboxed autonomy**: Enable Autopilot with MCP server sandboxing and command risk assessment for safe operation
- ✅ **Organization consistency**: Org-level agents, instructions, and enterprise restrictions enforce standards across teams
- ✅ **Agent Plugins**: Install prepackaged customizations from Extensions view for instant capability boosts
- ✅ **Browser debugging**: Let agents debug web apps autonomously — share specific browser tabs for live validation
- ✅ **Token awareness**: Leverage prompt caching (93%+ hit rate) and background compaction ahead of usage-based billing
- ✅ **Observability**: Enable OpenTelemetry tracing for agent sessions to monitor and debug AI workflows

### Move Away From ⚠️

- ⚠️ **Single long conversations**: Context overflow degrades quality; use subagents, session handoffs, and `/compact` instead
- ⚠️ **Manual approval fatigue**: Use Bypass Approvals or Autopilot instead of clicking "allow" 50 times
- ⚠️ **Per-developer customization**: Use Chat Customizations editor for unified management
- ⚠️ **Separate tool configs**: Monorepo discovery shares customizations automatically
- ⚠️ **Ignoring token costs**: With usage-based billing approaching, leverage prompt caching and compaction

### Move Against 🛑

- 🛑 **Unsandboxed Autopilot**: Never enable Autopilot without MCP/terminal sandboxing
- 🛑 **Context dumping**: Never paste an entire codebase — use `#codebase` semantic search, subagents, and targeted context

---

## ✅ What You Can Do Today

**Immediate (5 minutes):**
- [ ] Update VS Code to v1.120+
- [ ] Check BYOK availability: ask your Copilot Enterprise admin to enable the "Bring Your Own Language Model Key" policy
- [ ] Try Autopilot: enable `"chat.autopilot.enabled": true`, then select Autopilot in permissions picker
- [ ] Try `/init` to bootstrap workspace instructions for your project
- [ ] Use the thinking effort picker in model selector (Low/Medium/High)
- [ ] Try `/fork` to branch a conversation for exploring alternatives
- [ ] Check `git.addAICoAuthor` setting — now opt-in after the v1.119 revert

**Short-Term (30 minutes):**
- [ ] If BYOK is enabled for your org, add a provider via model picker → Manage Models… and compare responses
- [ ] Tune incremental rendering animation: try `"chat.experimental.incrementalRendering.animationStyle": "rise"` vs `"fade"`
- [ ] Open Chat Customizations editor (gear icon in Chat view) to explore unified management
- [ ] Enable terminal sandboxing: `"chat.tools.terminal.sandbox.enabled": true`
- [ ] Enable MCP server sandboxing in `mcp.json` with `"sandboxEnabled": true`
- [ ] Create your first Agent Skill in `.github/skills/` for a common team pattern
- [ ] Use `/compact` to manually compact a long conversation
- [ ] Try `/troubleshoot #session` to diagnose a previous chat session
- [ ] Share a browser tab with an agent to validate a web change live

**Explore Further (1 hour):**
- [ ] Try the Agents Window (now in Stable preview) for multi-project agent orchestration
- [ ] Enable nested subagents: `"chat.subagents.allowInvocationsFromSubagents": true`
- [ ] Enable monorepo customization discovery: `"chat.useCustomizationsInParentRepositories": true`
- [ ] Enable background terminal notifications: `"chat.tools.terminal.backgroundNotifications": true`
- [ ] Use `/create-skill` to extract a debugging workflow from a conversation
- [ ] Try integrated browser debugging with `"workbench.browser.enableChatTools": true`
- [ ] Enable Copilot Memory: `"github.copilot.chat.copilotMemory.enabled": true`
- [ ] Set up OpenTelemetry tracing for agent sessions if your org uses an observability platform
- [ ] Try remote Copilot CLI: start a session with `/remote` and monitor from GitHub.com

---

## Key Settings Reference

Quick reference for all settings mentioned in this talk:

```json
{
  // Agent Sessions & Orchestration
  "git.worktreeIncludeFiles": [],
  "chat.exploreAgent.defaultModel": "claude-haiku-4-5",

  // Agent Customization
  "chat.useAgentSkills": true,
  "chat.agentSkillsLocations": {},
  "chat.customAgentInSubagent.enabled": true,
  "github.copilot.chat.organizationInstructions.enabled": true,
  "chat.plugins.enabled": true,
  "chat.plugins.marketplaces": [],

  // Claude & Anthropic (thinking effort now in model picker UI)
  "chat.thinking.style": "detailed",
  "chat.tools.autoExpandFailures": true,
  "chat.agent.thinking.phrases": {},

  // Autopilot & Autonomy (v1.111+)
  "chat.autopilot.enabled": true,

  // Security & Trust
  "chat.tools.terminal.sandbox.enabled": true,
  "chat.tools.terminal.sandbox.network": [],
  "chat.tools.terminal.enableAutoApprove": true,
  "chat.tools.terminal.autoApproveWorkspaceNpmScripts": true,

  // Monorepo & Customization (v1.112+)
  "chat.useCustomizationsInParentRepositories": true,
  "chat.subagents.allowInvocationsFromSubagents": true,
  "chat.useCustomAgentHooks": true,

  // BYOK & Model Management (v1.117+) — no settings; admin enables via GitHub.com
  // Add providers via: Chat model picker → Manage Models…

  // Incremental Rendering (v1.117)
  "chat.experimental.incrementalRendering.enabled": true,
  "chat.experimental.incrementalRendering.animationStyle": "fade",
  "chat.experimental.incrementalRendering.buffering": "off",

  // Commit Attribution (v1.118 default, v1.119 opt-in)
  "git.addAICoAuthor": false,

  // Productivity
  "github.copilot.chat.copilotMemory.enabled": true,
  "workbench.browser.openLocalhostLinks": true,
  "workbench.browser.enableChatTools": true,
  "github.copilot.chat.githubMcpServer.enabled": true,
  "chat.tips.enabled": true,
  "chat.imageCarousel.enabled": true,
  "chat.tools.terminal.backgroundNotifications": true,
  "inlineChat.renderMode": "hover",
  "inlineChat.affordance": "editor"
}
```

---

## Related Patterns

- **[Copilot Chat](../copilot-chat/)** — Deep dive on context mechanisms and chat architecture
- **[Copilot CLI](../copilot-cli/)** — Command-line Copilot experience
- **[Custom Agents & Skills](../copilot-primitives/)** — Comprehensive guide to agent customization primitives
- **[Terminal Sandboxing](../terminal-sandboxing/)** — Deep dive on sandboxing configuration
- **[Copilot Memory](../copilot-memory/)** — Detailed exploration of persistent context

See [DECISION-GUIDE.md](../DECISION-GUIDE.md) for complete navigation help.

---

## 📖 References

[^1]: **[VS Code Release Notes: February 2026 (v1.110)](https://code.visualstudio.com/updates/v1_110)** — Agent Plugins, agentic browser tools, context compaction, session forking, /create-* commands, Explore subagent

[^4]: **[GitHub Copilot in VS Code Documentation](https://code.visualstudio.com/docs/copilot/overview)** — Comprehensive guide to Copilot features, agent types, and customization

[^5]: **[VS Code Release Notes: March 9, 2026 (v1.111)](https://code.visualstudio.com/updates/v1_111)** — Weekly releases begin, Autopilot mode, agent permissions picker, agent-scoped hooks, debug events snapshot

[^6]: **[VS Code Release Notes: March 18, 2026 (v1.112)](https://code.visualstudio.com/updates/v1_112)** — Integrated browser debugging, Copilot CLI Autopilot, MCP server sandboxing, image/binary support, monorepo customizations

[^7]: **[VS Code Release Notes: March 25, 2026 (v1.113)](https://code.visualstudio.com/updates/v1_113)** — Chat Customizations editor, configurable thinking effort, nested subagents, MCP in CLI/Claude agents, session forking

[^8]: **[VS Code Release Notes: April 1, 2026 (v1.114)](https://code.visualstudio.com/updates/v1_114)** — Video in chat, Copy Final Response, simplified #codebase semantic search, /troubleshoot previous sessions, TypeScript 6.0

[^9]: **[VS Code Release Notes: April 8, 2026 (v1.115)](https://code.visualstudio.com/updates/v1_115)** — VS Code Agents companion app, terminal tools for background commands, browser tool improvements

[^14]: **[VS Code Release Notes: April 22, 2026 (v1.117)](https://code.visualstudio.com/updates/v1_117)** — BYOK (Bring Your Own Key) for Copilot Business/Enterprise, incremental chat rendering, agent session sorting, Copilot CLI from any terminal profile

[^17]: **[VS Code Release Notes: April 29, 2026 (v1.118)](https://code.visualstudio.com/updates/v1_118)** — Remote Copilot CLI, token efficiency (93%+ prompt cache hit), enterprise org restrictions, CLI auto model selection, Co-authored-by trailer

[^16]: **[VS Code Release Notes: May 6, 2026 (v1.119)](https://code.visualstudio.com/updates/v1_119)** — Agent-browser tab sharing, OpenTelemetry tracing for chat, inline diffs in chat, commit attribution revert, reduced trust interruptions

[^15]: **[VS Code Release Notes: May 13, 2026 (v1.120)](https://code.visualstudio.com/updates/v1_120)** — Agents Window (Stable preview), command risk assessment, terminal output compression, BYOK thinking effort, Markdown diff preview

[^10]: **[Agent Plugins Documentation](https://code.visualstudio.com/docs/copilot/customization/agent-plugins)** — Installing and creating agent plugin bundles

[^11]: **[Agent Skills Documentation](https://code.visualstudio.com/docs/copilot/customization/agent-skills)** — Creating and using Agent Skills in VS Code

[^12]: **[Custom Agents Documentation](https://code.visualstudio.com/docs/copilot/customization/custom-agents)** — Defining custom agents with `.agent.md` files

[^13]: **[Background Agents Documentation](https://code.visualstudio.com/docs/copilot/agents/background-agents)** — Using background agents with Git worktree isolation

---

## 🎭 Behind the Scenes

### Weekly Releases (v1.111+)

Starting with v1.111 (March 9, 2026), VS Code transitioned to **weekly stable releases** instead of monthly. This enables faster feature delivery and bug fixes, but means staying current requires more frequent updates [^5].

### Usage-Based Billing (June 2026)

GitHub Copilot is shifting to usage-based billing on June 1, 2026. The token efficiency improvements in v1.118 (93%+ prompt caching, background compaction) directly address this by reducing per-session token consumption [^17].

### Engineering Highlights

- **TypeScript 6.0.3 patch** (v1.117): Resolves import-related bugs introduced in 6.0 [^14]
- **TypeScript-Go (tsgo)**: VS Code now defaults to TSGo for development, with built-in extensions compiling in under a second [^1]
- **Extension bundling with esbuild**: Most built-in extensions migrated from webpack to esbuild for faster builds [^1]
- **Kitty graphics protocol**: Terminal now supports high-fidelity image rendering (v1.110) [^1]
- **Edit mode deprecated**: Hidden by default in v1.110 [^1]
- **Autopilot architecture** (v1.111): Autopilot builds on the existing bypass-approvals flow with a new state machine for autonomous operation — retry on failure, auto-respond to tool results, and completion detection [^5]
- **VS Code Agents app** (v1.115): The standalone companion app shares VS Code's core runtime, enabling parallel agent sessions without consuming IDE resources [^9]
- **Agents Window in Stable** (v1.120): Moved from Insiders-only to Stable preview, signaling agent-driven development is ready for mainstream adoption [^15]
- **TypeScript 6.0 support** (v1.114): Full semantic support for new TS 6.0 features including improved type inference [^8]
- **Simplified #codebase** (v1.114): Pure semantic search replaces fuzzy fallback, reducing false positives for large codebases [^8]
