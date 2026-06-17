# agentic_sdlc / preferences

Author taste, framing choices, and editorial decisions for agentic SDLC talks.

---

## agentic-workflows: Path A/B/C framing as primary audience hook (2026-05-05)

`schema_version: 1` | `date: 2026-05-05`

**Lead with paths, not features.** The deck opens with "Which problem is yours?" (Path A: triage, Path B: reporting, Path C: orchestration) before introducing architecture. This immediately anchors every audience member in a use case they recognize — avoid opening with platform/compiler architecture.

**"Find your cell" is the Section 3 tagline.** The 3×3 Path×Maturity matrix is the deck's central intellectual contribution. Every audience member should leave knowing their current cell and their next cell.

**Flagship use cases per path (for CoreQuestionSlide and openers):**
- Path A: Issue Triage → PR Review → Dependency Audit
- Path B: Weekly Health Report → Release Notes → Research Digest  
- Path C: CI Failure Diagnosis → ChatOps Commands → Multi-Agent Orchestration

**arcToc arc:** "Why It Matters → Architecture & Safety → Patterns by Path → Your Path Forward" — this left-to-right progression from motivation to mechanism to use case to action is the intended audience journey.

**Zero direct writes** is the key trust-building stat. Lead with it in BeforeAfterSlide metrics and ThankYouSlide cards — it is what distinguishes this from naive AI automation.

---

## agentic-sdlc opener: maturity model framing (2026-04-24)

`schema_version: 1` | `date: 2026-04-24`

**Lead with the constraint-ladder.** The arc is: each section surfaces a new bottleneck — coordination → review capacity → CI speed → trust → measurement. Name it in transitions: "You've solved X; now Y is the wall."

**"L3 is the launchpad"** is the closing thesis. Platform without adoption stalls at L3. Adoption without platform never reaches L5. Both must advance — and L3 is where they first compound. Use this as the ThankYouSlide stat card anchor.

**Cold open candidate (strong for exec-heavy rooms):** "Your agents can write 15 features/day. Your SDLC can only absorb 3." Opens with the gap, then the talk rebuilds the SDLC to close it. Test in rehearsal.

**TocSlide (4 sections, not 5):** Implementation Roadmap is Section 5 but uses `partNumber=4` (purple) — TocSlide limit is 4 items. "Trust Manufacturing" and "Implementation Roadmap" share Section 4 coloring.

---


`schema_version: 1` | `date: 2026-04-12`

Applied across all content slides (9, 10, 12-14, 16-17, 19-20) of enterprise-patterns.md. Consistent pattern worth reusing for other amber-themed decks:

**Header icons:** `<div class="flex items-center gap-2">` wrapping an emoji + section label. Two-column slides get one emoji per column header.

**Chip tags for identifiers:** `<code class="px-1.5 py-0.5 bg-amber-900/60 border border-amber-700/50 rounded text-amber-300">identifier</code>` inline within prose. Use for file names, config keys, API names.

**Expanded footer (replaces single callout bar):**
```html
<div class="mt-3 space-y-2">
  <!-- Row 1: 3-column stat tiles -->
  <div class="grid grid-cols-3 gap-2">
    <div class="p-2 bg-amber-900/20 rounded border border-amber-700/30 text-center">
      <div class="text-amber-300 font-bold text-sm">STAT</div>
      <div class="text-gray-400 text-xs">label</div>
    </div>
    <!-- repeat × 3 -->
  </div>
  <!-- Row 2: single callout bar -->
  <div class="p-2 bg-slate-800/60 rounded border border-slate-600/40 text-xs text-slate-300">
    💡 <span class="text-amber-300 font-semibold">Key insight label:</span> supporting sentence.
  </div>
</div>
```

**Source:** User-directed beautification pass, session 2026-04-11–12.

---

## agentic-journey Part 3: expanded to 3 slides, Copilot coding agent explicitly included

`schema_version: 1` | `date: 2026-04-10`

Part 3 of agentic-journey.md was originally a single very dense slide. Expanded to 3 slides (per user direction):

1. **Part 3 opener** — section intro slide (no progress dots)
2. **The Copilot Coding Agent** — dedicated slide covering async assignment, issue → PR lifecycle, copilot-setup-steps.yml configuration. Explicitly tells the audience how to assign work to it.
3. **Agent Workflows in Practice** — practical patterns: custom agents, MCP integrations, parallel work streams

**Key framing decision:** The Copilot coding agent must be called out by name with an explicit how-to-assign example. Audiences do not realize they can delegate full issues/PRs to it — this is the "I didn't know it could do that" moment for Part 3.

**Source:** User instruction — "we don't currently even call out the copilot coding agent meaningfully, and don't provide an example of how to assign it" (2026-04-10 session).

---
