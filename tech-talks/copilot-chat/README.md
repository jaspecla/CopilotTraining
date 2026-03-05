---
status: archived
updated: 2026-02-01
section: "Copilot Surfaces"
references:
  - url: https://code.visualstudio.com/docs/copilot/chat/copilot-chat-context
    label: "Copilot Chat context management"
    verified: 2026-02-01
  - url: https://code.visualstudio.com/docs/copilot/copilot-chat
    label: "Copilot Chat interface overview"
    verified: 2026-02-01
  - url: https://code.visualstudio.com/docs/copilot/reference/copilot-vscode-features#_chat-tools
    label: "Chat tools reference"
    verified: 2026-02-01
  - url: https://code.visualstudio.com/docs/copilot/reference/workspace-context
    label: "Workspace context and semantic search"
    verified: 2026-02-01
---

# Copilot Chat: Context Mastery for AI Collaboration

> **The Question This Talk Answers:**
> *"How do I get relevant, codebase-specific answers from Copilot instead of generic responses?"*

**Duration:** 45 minutes | **Target Audience:** Developers / Engineering Teams

---

## 📊 Content Fitness

| Criterion | Assessment | Notes |
|-----------|-----------|-------|
| **Relevant** | 🟢 High | Every developer using Copilot Chat needs to understand context mechanisms to get quality responses |
| **Compelling** | 🟢 High | Transforms chat from "sometimes helpful" to "consistently productive" with the same AI model—difference is context mastery |
| **Actionable** | 🟢 High | Immediate application—start using #file, @workspace, #codebase in your next chat session; see improvements within minutes |

**Overall Status:** 🟢 Ready to use

---

## 📽️ Slide Generation Mapping

### Slide Sequence (Generated Automatically)

1. **Title/Logo Slide** ← H1 title + subtitle
2. **Question/Objective Slide** ← "The Question This Talk Answers"
3. **Table of Contents Slide** ← Auto-generated from 🎬 sections
4. **Problem Slide** ← "The Problem"
5. **Solution Overview** ← "The Solution"
6. **Key Artifacts** ← Context mechanisms inventory
7. **Mental Model Shift** ← Move-Toward/Away/Against patterns
8. **When to Use Decision Tree** ← Context selection guide
9. **Context Mechanisms** ← 🎬 Section 1 (3-4 slides)
10. **Chat Architecture** ← 🎬 Section 2 (2-3 slides)
11. **VS Code 1.109 Features** ← 🎬 Section 3 (3-4 slides)
12. **Context Strategy** ← 🎬 Section 4 (2-3 slides)
13. **Use Cases** ← Real-World Use Cases (1-2 slides)
14. **Actionable Outcomes** ← What You Can Do Today
15. **Related Patterns** ← Related Patterns
16. **Official Documentation** ← 📚 section
17. **End Slide** ← Auto-generated

### Major Sections (TOC Entries)

```markdown
<!-- 🎬 MAJOR SECTION: Context Mechanisms -->
<!-- 🎬 MAJOR SECTION: Chat Architecture -->
<!-- 🎬 MAJOR SECTION: VS Code 1.109 Enhancements -->
<!-- 🎬 MAJOR SECTION: Context Strategy -->
```

---

## The Problem

### Key Points

- **Generic responses from incomplete context**
  AI without context answers in a vacuum—textbook syntax examples, not solutions that fit your codebase patterns

- **Quality proportional to context**
  The difference between "Here's generic SQL" and "Based on your schema in `database/schema.sql`, here's the migration..."

- **Manual context management is cognitive overhead**
  Developers shouldn't spend mental energy deciding which files to include for every interaction

- **Context window limitations at scale**
  Large codebases exceed model token limits—strategic context selection becomes essential as projects grow

### Narrative

When developers first use GitHub Copilot Chat, they often get generic or irrelevant responses. They ask "How do I add a character to the database?" and receive textbook SQL syntax instead of code that fits their schema, API patterns, and validation rules. This isn't a flaw in the AI—it's a context problem.

Copilot responds based on what it knows. Without explicit context about your specific files, architecture, and codebase structure, it answers generically—like asking a consultant for advice without showing them your system. The quality of AI responses is directly proportional to the quality and relevance of context you provide.

The challenge: most developers don't realize there are multiple context mechanisms available, each optimized for different scenarios. They either provide no explicit context (getting generic answers) or manually attach too many files (overwhelming the context window). Mastering context mechanisms transforms Copilot from "sometimes helpful autocomplete" into a consistently productive development partner.

---

## The Solution: Context Mechanisms in GitHub Copilot Chat

### What It Does

GitHub Copilot Chat provides multiple context mechanisms that work together to give the AI exactly what it needs to understand your codebase and generate relevant responses. These mechanisms range from automatic (files you're currently viewing) to explicit (#file, @workspace, #codebase) to external (#fetch for documentation).

### Key Capabilities

- **Implicit Context**: Automatic inclusion of active file, selected text, and visible errors—zero-effort baseline context
- **Explicit File Context (#file)**: Direct file references when you know exactly what the AI needs to see
- **Workspace Discovery (@workspace)**: Project-wide understanding for architectural questions and navigation
- **Semantic Search (#codebase)**: Intent-based discovery when you don't know which files contain what you need
- **External Documentation (#fetch)**: Current, authoritative framework documentation pulled into conversation
- **Visual Context**: Drag-and-drop images for UI mockups, error screenshots, architecture diagrams

### Architecture Overview

The chat system operates in two modalities: **Sidebar Chat** for persistent multi-turn conversations with full context accumulation, and **Inline Chat** for quick editor-integrated edits with automatic current-file context. Both share the same underlying context mechanisms but optimize for different workflows.

Context selection happens via **#-mentions** (explicit context items) and **@-mentions** (specialized agents). The system automatically manages token budgets, displaying a context window indicator that shows usage breakdown by category. When context limits are approached, conversations are automatically summarized to preserve room for new interactions.

VS Code 1.109 introduced **auto model selection**, eliminating manual model choosing—the system picks the best available model based on your subscription tier, organizational policies, and current availability.

**Official Documentation:**
- 📖 [Manage Context for AI](https://code.visualstudio.com/docs/copilot/chat/copilot-chat-context) — Complete guide to context mechanisms
- 📖 [Copilot Chat in VS Code](https://code.visualstudio.com/docs/copilot/copilot-chat) — Chat interface overview and getting started
- 📖 [Chat Tools Reference](https://code.visualstudio.com/docs/copilot/reference/copilot-vscode-features#_chat-tools) — Full list of #-mentions and @-mentions

---

## 📦 Key Artifacts

**This talk demonstrates working context patterns through practical examples** that show each mechanism in action.

### Primary Artifacts

*Shown inline with detailed explanation in the major sections*

- **Context mechanism examples** — Practical prompts demonstrating #file, @workspace, #codebase, #fetch usage patterns
- **Context decision guide table** — When-to-use matrix mapping scenarios to optimal context mechanisms
- **Context window monitoring** — Real-time token usage tracking and conversation management strategies

### Supporting Resources

*Available for reference*

- **[VS Code Documentation](https://code.visualstudio.com/docs/copilot/chat/copilot-chat-context)** — Complete reference for all context features
- **[Workspace Context Guide](https://code.visualstudio.com/docs/copilot/reference/workspace-context)** — Deep dive into indexing and semantic search

---

## 🎯 Mental Model Shift

> **The Core Insight:** From "I talk to an AI" to "I provide context, the AI provides codebase-specific solutions"

### Move Toward (Embrace These Patterns)

- ✅ **Start Broad, Then Narrow**: Use @workspace for discovery → #codebase for specific patterns → #file for targeted edits → Efficient token usage, relevant results
- ✅ **Layer Context Strategically**: Begin with implicit (active file) → Add explicit (#file) → Use semantic search (#codebase) when uncertain → Let the tool discover, don't guess
- ✅ **External Documentation as Context**: Pull current API docs with #fetch rather than relying on training data → Accurate, up-to-date answers aligned with latest framework versions
- ✅ **Monitor Context Budget**: Watch the context window indicator, start new sessions when approaching limits → Prevent conversation summarization during critical work

### Move Away From (Retire These Habits)

- ⚠️ **Guessing Which Files to Include**: Manually attaching files without using #codebase to discover → Wasted time, incomplete context, missed relevant code
- ⚠️ **Ignoring Context Window Limits**: Long conversations without monitoring token usage → Unexpected summarization, loss of earlier conversation context
- ⚠️ **Generic Questions Without Context**: "How do I add a field?" instead of "#file:models/user.ts How do I add an email field?" → Generic answers requiring translation to your codebase

### Move Against (Active Resistance Required)

- 🛑 **Context Overload**: Attaching 10+ files to every prompt "just in case" → Exceeds token limits, dilutes signal with noise, slower responses
- 🛑 **Assuming AI Knows Your Codebase**: Asking domain-specific questions without any explicit context → Forces AI to guess, generates incorrect assumptions about your architecture

> **Example Transformation:** Before: "How do I add authentication?" (gets generic OAuth tutorial). After: "@workspace What authentication patterns exist? #codebase Where is user validation configured? #fetch https://docs.example.com/auth/latest" (gets codebase-specific implementation plan referencing your existing auth service, validation middleware, and current best practices).

---

## When to Use This Pattern

### Decision Tree

```
Q: What context mechanism should I use?
├─ "I know exactly which file/folder contains what I need"
│  → Use: #file:path/to/file or drag from Explorer
│  └─ Best for: Targeted edits, reviewing specific implementations
│
├─ "I need to understand the overall project structure"
│  → Use: @workspace
│  └─ Best for: Onboarding, architectural questions, finding patterns
│
├─ "I'm looking for something specific but don't know where it is"
│  → Use: #codebase [search query]
│  └─ Best for: "Where is X configured?", "Show me all Y patterns"
│
├─ "I need current documentation for a framework/API"
│  → Use: #fetch [documentation URL]
│  └─ Best for: Framework upgrades, ensuring latest best practices
│
└─ "I have a UI mockup or error screenshot"
   → Drag image to Chat view
   └─ Best for: Implementing designs, debugging visual issues
```

### Use This Pattern When

- You need codebase-specific answers, not generic programming advice
- Complex projects where manual file discovery is time-consuming
- Working with frameworks and you want current, not stale, documentation
- Onboarding new team members who need architectural understanding

### Don't Use This Pattern When

- Simple, generic programming questions better suited for web search
- Closed/proprietary codebases where indexing is unavailable (use #file instead)
- Extremely small projects (1-5 files) where manual context is trivial

### Comparison with Related Features

| Aspect | Copilot Chat (This Talk) | Copilot Inline Suggestions | Copilot for Pull Requests |
|--------|-------------------------|---------------------------|---------------------------|
| **Best For** | Understanding, planning, refactoring | Autocomplete while typing | PR descriptions, review analysis |
| **Context Control** | Full explicit control | Editor context only | PR diff + conversation |
| **Use Case** | "How does auth work?" | "Complete this function" | "Summarize these changes" |
| **Setup Time** | Immediate | Immediate | Requires PR workflow |

---

<!-- 🎬 MAJOR SECTION: Context Mechanisms -->

<!-- 🎬 MAJOR SECTION: Context Mechanisms -->
## Core Context Mechanisms

*Understanding explicit and implicit context to get relevant AI responses*

### Implicit Context (Automatic)

VS Code automatically includes baseline context without any effort:

- ✅ Currently selected text in the active editor
- ✅ The active file name and path
- ✅ Active file contents (in inline chat)
- ✅ Visible errors and diagnostics

**When to rely on implicit context:**
- Working on the current file with a clear selection
- Quick inline edits and refactoring within one file
- Context is obvious from what's visible in the editor

### Explicit Context: #file

Reference specific files when you know exactly what Copilot needs to see:

```
Without context:
"What database tables exist in this project?"

With file context:
"What database tables exist? #file:backend/database/schema.sql"
```

**Multiple files:**
```
"How do the character routes connect to the database?
#file:backend/routes/characters.js
#file:backend/database/connection.js"
```

**When to use #file:**
- You know exactly which file contains the relevant information
- Cross-referencing between specific files for integration understanding
- Reviewing or understanding specific implementation details

### Explicit Context: @workspace

Project-wide understanding when you need the big picture:

```
@workspace What is the overall architecture of this application?
What technologies are used?
```

**What @workspace does:**
- Searches your entire codebase using available indexing
- Finds relevant files automatically based on your question
- Provides project-specific responses grounded in your actual code

**When to use @workspace:**
- New to a codebase—understanding structure and conventions
- Broad architectural questions spanning multiple areas
- Finding patterns across the project (e.g., "How is error handling done?")

### Explicit Context: #codebase

Semantic search when you don't know which file contains what you need:

```
#codebase Where is authentication configured?
```

```
#codebase Show me all the API routes related to characters
```

**What #codebase does:**
- Searches semantically (by meaning, not just exact keywords)
- Finds files even without knowing exact names or locations
- More targeted than @workspace for specific technical queries

**VS Code 1.109 Update:** External indexing now available for non-GitHub workspaces—local projects get the same fast semantic search that GitHub repositories have always had.

### Explicit Context: #fetch

Reference external documentation for current, authoritative information:

```
How should I structure React components?
#fetch https://react.dev/learn/thinking-in-react
```

```
What are the latest Express.js best practices for error handling?
#fetch https://expressjs.com/en/guide/error-handling.html
```

**When to use #fetch:**
- Need current framework documentation (training data may be outdated)
- Referencing APIs that have changed recently
- Ensuring responses align with official guidance, not generic patterns

**Privacy note:** VS Code prompts for confirmation before accessing external URLs. You can configure auto-approval for trusted domains.

### Visual Context: Images

Drag-and-drop images onto the Chat view for visual understanding:

```
[Drag image of a UI mockup]
"Create a React component that matches this design"
```

```
[Screenshot of error message]
"What's causing this error and how do I fix it?"
```

**When to use images:**
- Implementing UI from mockups or design files
- Debugging visual issues or error dialogs
- Explaining complex diagrams or system architectures

### Context Decision Guide

| When you... | Use... | Example |
|-------------|--------|---------|
| Know the exact file | `#file:path/to/file` | `#file:src/components/Header.jsx What does this do?` |
| Need project overview | `@workspace` | `@workspace What's the folder structure?` |
| Looking for something specific | `#codebase` | `#codebase Where is error handling configured?` |
| Need current external docs | `#fetch <URL>` | `#fetch https://react.dev How to handle state?` |
| Have a UI mockup/error screenshot | Drag image to chat | [image] "Implement this design" |
| Working on the current file | Nothing! (implicit) | File is auto-included in inline chat |

---

<!-- 🎬 MAJOR SECTION: Chat Architecture -->
## Chat Architecture: Understanding the Interface

*Two modalities, auto model selection, and context window visibility*

### Two Chat Modalities

**Sidebar Chat (Chat View):**
- Persistent conversation history across sessions
- Multi-turn conversations with context accumulation
- Access to all context mechanisms (#-mentions, @-mentions, images)
- Best for: Exploratory work, planning, complex discussions, learning codebases

**Inline Chat (Editor-Integrated):**
- Quick, contextual edits directly in the editor
- Automatically includes current file and selection
- Lightweight UX for refactoring, documentation, quick fixes
- New in VS Code 1.109: Revamped contextual rendering (`inlineChat.renderMode`)

**Choosing between them:**
- Use **Sidebar Chat** when: Planning features, asking "how does X work?", multi-file refactoring
- Use **Inline Chat** when: Quick edits, adding comments, refactoring a single function

### Auto Model Selection

GitHub Copilot automatically selects the best available model based on:
- Your subscription tier (Free, Pro, Pro+, Enterprise)
- Model availability and current load
- Organizational policies (if applicable)

**Key benefits:**
- No manual model selection required
- Pro+ subscribers get 10% discount on premium requests when using Auto
- Enterprises can enforce model policies across teams

**When to override:** Custom agents can specify preferred models for specialized workflows.

### Context Window Visibility

New in VS Code 1.109: The chat input area shows a **context window indicator** with real-time token usage:

- **Visual fill bar**: Shows proportion of context window currently in use
- **Hover for breakdown**: See token count by category (conversation history, attached files, tools, etc.)
- **Per-model limits**: Context window size changes based on selected model (GPT-4: 128K, Claude Opus: 200K)

**Why this matters:** When the context window fills up, VS Code automatically summarizes the conversation. Start a new session if you want to reset context entirely and avoid summarization during critical work.

---

<!-- 🎬 MAJOR SECTION: VS Code 1.109 Enhancements -->
## VS Code 1.109 Chat UX Enhancements

*January 2026 release brought significant improvements to chat experience*

### Anthropic Models with Thinking Tokens

Claude models now surface thinking tokens for visibility into reasoning:

- **Configurable thinking styles**: `chat.thinking.style` (detailed or compact)
- **Interleaved thinking**: See model reasoning between tool calls (`chat.agent.thinking.terminalTools`)
- **Auto-expand failures**: Failing tool calls show more context automatically (`chat.tools.autoExpandFailures`)
- **Visual enhancements**: Scrollable thinking content, shimmer animations

**What this means:** You can now see *why* Claude made specific decisions during complex tasks—valuable for debugging unexpected agent behavior.

### Mermaid Diagrams in Chat

Chat responses can render interactive diagrams with the `renderMermaidDiagram` tool:

- **Pan and zoom**: Alt/Option + mouse wheel
- **Click to zoom**: Alt/Option + click (add Shift to zoom out)
- **Open in editor**: Full-sized view for larger diagrams
- **Copy source**: Right-click to copy Mermaid source code

**Use cases:** Flowcharts, sequence diagrams, architecture visualizations—especially useful for explaining complex system relationships.

### Ask Questions Tool (Experimental)

When something is unclear, the agent can ask clarifying questions with interactive UI:

- **Interactive prompts**: Single/multi-select options, free text input
- **Keyboard navigation**: Up/Down arrows, number keys for quick selection
- **Catches ambiguity early**: Prevents misunderstandings before code generation
- **Enable**: `chat.askQuestions.enabled`

**Example:** Agent asks "Should this API be synchronous or asynchronous?" with options rather than guessing.

### Plan Agent Enhancements

The built-in Plan agent now follows a structured 4-phase workflow:

1. **Discovery** — Autonomously explores codebase, finds relevant files
2. **Alignment** — Pauses to ask clarifying questions before committing
3. **Design** — Drafts comprehensive implementation plan with steps and code snippets
4. **Refinement** — Adds verification criteria and documents decisions

**Quick access**: Use `/plan` command in chat to invoke directly.

### Inline Chat UX Revamp (Preview)

Two new experimental features for lighter, more contextual editing:

- **Easier triggering**: `inlineChat.affordance` makes it easier to trigger when selecting text
- **Lightweight rendering**: `inlineChat.renderMode` for cleaner contextual display

### Terminal Command Improvements

Terminal tool output now shows richer details:

- **Syntax highlighting** for inline Node, Python, Ruby
- **Working directory** shown in title
- **Command intent description** on hover
- **Output streaming**: Auto-expands for long-running commands
- **Interactive input**: Embedded terminals are fully interactive

**Why this matters:** Understanding *what* agents are running in terminals and *why* builds trust and catches mistakes early.

---

<!-- 🎬 MAJOR SECTION: Context Strategy -->
## Best Practices: Context Strategy Patterns

*Proven approaches for effective context management*

### Context Layering Strategy

**Start broad, then narrow:**
1. Use `@workspace` to understand overall structure first
2. Identify relevant areas with `#codebase` semantic search
3. Focus with specific `#file` references for targeted work
4. Add external docs with `#fetch` as needed for current best practices

**Example progression:**
```
1. @workspace What's the authentication architecture?
   → Discover: JWT tokens in auth/ directory, middleware in api/middleware/

2. #codebase Show me JWT token validation logic
   → Find: auth/jwt-validator.ts, middleware/auth-middleware.ts

3. #file:auth/jwt-validator.ts #file:middleware/auth-middleware.ts
   How do I add expiration checking?
   → Targeted implementation guidance

4. #fetch https://jwt.io/introduction
   → Ensure response aligns with current JWT best practices
```

### Context Efficiency

**Avoid context overload:**
- Don't include every file "just in case"—be strategic and targeted
- Let Copilot discover with `@workspace` or `#codebase` first before manually attaching
- Use the context window indicator to monitor usage
- Start a new session when approaching token limits rather than forcing summarization

**Leverage persistent context:**
- Instructions files (`.github/copilot-instructions.md`) are auto-loaded for every conversation
- Agent definitions provide domain-specific context automatically
- Skills package reusable expertise that agents can invoke when needed

### Conversation Management

**Multi-turn conversations:**
- Context accumulates within a session—build on previous exchanges
- Start new sessions for unrelated topics to avoid confusion
- Use `/compact` to compress history in long sessions (experimental)

**Session types (new in 1.109):**
- **Local sessions**: Interactive work in your current workspace
- **Background agents**: Parallel tasks running independently
- **Cloud agents**: Large-scale operations with expanded compute
- Seamlessly switch between types using session type picker

---

## Real-World Use Cases

### Use Case 1: Onboarding to a New Codebase

**The Problem:** New developer joins team, needs to understand a 50K-line React application with unfamiliar state management patterns. Manual code reading would take weeks.

**The Solution:** Progressive context discovery using chat mechanisms.

**Implementation:**
```
1. @workspace What is the overall architecture?
   → Response: React + Redux Toolkit, API layer in services/,
   component structure in features/

2. #codebase How is global state managed?
   → Finds: store/configureStore.ts, 8 slice files

3. #file:store/configureStore.ts Explain this store configuration
   → Detailed walkthrough of middleware, dev tools, persistence

4. #codebase Show me an example feature using this pattern
   → Points to features/user-profile/ as reference implementation
```

**Outcome:** New developer productive in 2 days instead of 2 weeks—understands architecture, patterns, and can start contributing to similar features.

---

### Use Case 2: Implementing OAuth Provider

**The Problem:** Add Microsoft OAuth support to existing authentication system. Existing code has Google and GitHub OAuth, but no documentation on how to add new providers.

**The Solution:** Historical pattern discovery + current documentation.

**Implementation:**
```
#codebase Show me existing OAuth implementations
→ Finds: auth/providers/google-oauth.ts, auth/providers/github-oauth.ts

#file:auth/providers/google-oauth.ts
#file:auth/providers/github-oauth.ts
What pattern do these follow for adding a new provider?
→ Explains common interface, token refresh handling, multi-tenant config

#fetch https://learn.microsoft.com/en-us/entra/identity-platform/v2-oauth2-auth-code-flow
How do I adapt this pattern for Microsoft OAuth using this documentation?
→ Generates provider implementation following existing patterns with
  current Microsoft API best practices
```

**Outcome:** Implementation in 2 hours instead of 8 hours. Code follows existing patterns, includes token refresh edge cases from historical context, uses current Microsoft API (not outdated examples from training data).

---

### Use Case 3: Debugging Production Error

**The Problem:** Production error: "Cannot read property 'id' of undefined" in checkout flow. Codebase has 200+ files—finding root cause manually would take hours.

**The Solution:** Error screenshot + semantic search + file context.

**Implementation:**
```
[Drag screenshot of error stack trace to Chat view]
#codebase Find the checkout flow code
→ Identifies: checkout/cart-checkout.ts, payment/process-payment.ts

#file:checkout/cart-checkout.ts
#file:payment/process-payment.ts
Based on this error, what's causing the undefined 'id' access?
→ Identifies: Payment object missing user.id when guest checkout
   Suggests: Add null check before accessing user.id property
```

**Outcome:** Bug found in 15 minutes, fix deployed within the hour. Visual error context + semantic search + targeted file analysis prevented hours of manual debugging.

---

## ✅ What You Can Do Today

**Immediate Actions (15 minutes):**
- [ ] Open Copilot Chat and try each context mechanism: `#file`, `@workspace`, `#codebase`, `#fetch`
- [ ] Enable experimental features: `chat.askQuestions.enabled` and `inlineChat.affordance`
- [ ] Watch the context window indicator as you add files—see token usage in real-time

**Short-Term Implementation (1 hour):**
- [ ] Set up `.github/copilot-instructions.md` for persistent project context—[guide here](https://code.visualstudio.com/docs/copilot/customization/custom-instructions)
- [ ] Experiment with the `/plan` command for complex feature planning
- [ ] Try dragging an image (UI mockup or error screenshot) to chat and asking for implementation/debugging

**Advanced Exploration (2-4 hours):**
- [ ] Create custom agents that build on context mastery—[custom agents guide](https://code.visualstudio.com/docs/copilot/customization/custom-agents)
- [ ] Set up organization-wide instructions if you're an enterprise user—[enterprise guide](https://code.visualstudio.com/docs/copilot/customization/custom-instructions#_organization-level-instructions)
- [ ] Layer customizations: Instructions → Prompts → Agents → Skills for compounding effectiveness

**Next Steps After Completion:**
1. ✅ Master the context mechanisms through daily use (1-2 weeks of practice)
2. 📖 Learn to troubleshoot when things don't work: [Copilot Chat Internals](../copilot-chat-internals/)
3. 🚀 Build domain-specific agents: [Custom Agents Workshop](../../workshop/06-custom-agents/)
4. 📊 Track your efficiency improvements: Time to answer vs. accuracy of responses

---

## Related Patterns

### Complementary Features

- **[Copilot Chat Internals](../copilot-chat-internals/)** — Debug View, troubleshooting failed prompts, understanding what Copilot actually sees
- **[Custom Agents](../../workshop/06-custom-agents/)** — Building specialized agents that leverage context mechanisms for domain-specific workflows
- **[Custom Instructions](../../workshop/01-instructions/)** — Persistent context that applies to every chat session automatically
- **[Context Engineering Foundations](../context-engineering-foundations/)** — Deep dive into prompt engineering and context optimization strategies

### Decision Flow

**If this talk doesn't fit your needs:**

```
Q: What's your actual goal?
├─ "I understand context but chat isn't working as expected"
│  → See: Copilot Chat Internals (Debug View, troubleshooting)
│
├─ "I want to build specialized agents for my domain"
│  → See: Custom Agents Workshop
│
├─ "I need to customize Copilot for my team's codebase"
│  → See: Custom Instructions Workshop
│
└─ "I want advanced prompt engineering techniques"
   → See: Context Engineering Foundations
```

See [DECISION-GUIDE.md](../DECISION-GUIDE.md) for complete navigation help.

---

## 📚 Official Documentation

**Primary Documentation:**
- 📖 **[Manage Context for AI](https://code.visualstudio.com/docs/copilot/chat/copilot-chat-context)** — Complete guide to context mechanisms, #-mentions, @-mentions, and best practices
- 📖 **[Copilot Chat in VS Code](https://code.visualstudio.com/docs/copilot/copilot-chat)** — Chat interface overview, getting started, and feature reference
- 📖 **[Chat Tools Reference](https://code.visualstudio.com/docs/copilot/reference/copilot-vscode-features#_chat-tools)** — Full list of #-mentions and @-mentions with detailed descriptions

**Additional Resources:**
- 🎓 [Workspace Context](https://code.visualstudio.com/docs/copilot/reference/workspace-context) — How workspace indexing works (remote vs. local vs. basic)
- 🎓 [Getting Started with Copilot Chat](https://docs.github.com/en/copilot/using-github-copilot/asking-github-copilot-questions-in-your-ide) — GitHub's guide to chat features
- 📹 [January 2026 Release Notes (v1.109)](https://code.visualstudio.com/updates/v1_109) — Chat UX enhancements, agent session management, customization features

**GitHub Resources:**
- 🐙 [GitHub Copilot Documentation](https://docs.github.com/en/copilot) — Complete Copilot feature reference across platforms

---

## 🎭 Behind the Scenes

*For those who want to understand the deeper mechanics*

### How Context Window Management Works

When you send a chat message:

1. **Token Budget Calculation**: VS Code calculates available tokens based on selected model (GPT-4: 128K, Claude Opus: 200K)
2. **Context Prioritization**: System allocates tokens in order: system prompt → user prompt → attached files → conversation history
3. **Overflow Handling**: If context exceeds limit, conversation history is summarized to free space
4. **Token Tracking**: Context window indicator shows real-time usage breakdown by category

**Why This Matters:** Understanding token allocation helps you avoid losing important context. Start new sessions before hitting limits during critical work.

### Workspace Indexing Types

The same `#codebase` syntax triggers different indexing strategies based on your workspace:

| Workspace Type | Indexing Strategy | Search Speed | Setup Required |
|----------------|-------------------|--------------|----------------|
| **GitHub repo** | Remote index on GitHub servers | Instant | None (automatic) |
| **Local workspace (1.109+)** | External indexing via VS Code service | ~30s first time, instant after | Auto-enabled |
| **Large local workspace** | Basic local algorithms | 2-5 seconds | None |

**Performance tip:** For non-GitHub workspaces, the initial index build (first `#codebase` query) takes 1-3 minutes depending on repo size. Subsequent queries are near-instant.

### Auto Model Selection Logic

When you use "Auto" model selection:

1. **Check subscription tier**: Free/Pro/Pro+/Enterprise determines available models
2. **Check organizational policies**: Enterprise admins can restrict models
3. **Check current availability**: Some models may be at capacity
4. **Select best available**: Prioritizes latest/most capable within your tier

**Override options:** Custom agents can specify preferred models in `.agent.md` frontmatter—useful for specialized workflows (e.g., vision models for UI work).
