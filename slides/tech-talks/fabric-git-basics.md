---
theme: default
class: text-center
highlighter: shiki
lineNumbers: false
info: |
  ## Git Basics for Microsoft Fabric
  CopilotTraining Tech Talk
drawings:
  persist: false
transition: slide-left
title: Git Basics for Microsoft Fabric
mdc: true
section: Developers
status: active
updated: 2026-05-05
---

<script setup>
import TitleSlide from './components/structure/TitleSlide.vue'
import CoreQuestionSlide from './components/structure/CoreQuestionSlide.vue'
import TocSlide from './components/structure/TocSlide.vue'
import SectionOpenerSlide from './components/structure/SectionOpenerSlide.vue'
import BeforeAfterSlide from './components/structure/BeforeAfterSlide.vue'
import WhatYouCanDoTodaySlide from './components/structure/WhatYouCanDoTodaySlide.vue'
import ReferencesSlide from './components/structure/ReferencesSlide.vue'
import ThankYouSlide from './components/structure/ThankYouSlide.vue'
import FourCardGridSlide from './components/FourCardGridSlide.vue'
import FrameworkMappingRowsSlide from './components/FrameworkMappingRowsSlide.vue'
import WorkflowShowdownStepsSlide from './components/WorkflowShowdownStepsSlide.vue'
import ThreeColumnCardSlide from './components/ThreeColumnCardSlide.vue'
import TwoColPairedConceptsSlide from './components/TwoColPairedConceptsSlide.vue'
import MaturityJourneyRoadmapSlide from './components/MaturityJourneyRoadmapSlide.vue'
</script>

<!-- SLIDE: Title -->
<TitleSlide
  title="Git Basics for Microsoft Fabric"
  subtitle="Version Control for Analytics Teams"
  tagline="How fundamental Git concepts map to Microsoft Fabric&#39;s workspace model"
  meta="30 min · Data Engineers / Analytics Engineers / BI Developers"
/>

---

<!-- SLIDE: Core Question -->
<CoreQuestionSlide
  question="How do Git fundamentals map to Microsoft Fabric&#39;s workspace model?"
  subtext="Most data teams have no version control for their analytics artifacts."
  highlight="Fabric&#39;s Git integration changes that — in 15 minutes or less."
  :cards='[
    { icon: "👩‍💻", title: "Data Engineers", description: "Safe parallel development for pipelines and notebooks without overwriting teammates" },
    { icon: "📊", title: "Analytics Engineers", description: "Version-controlled semantic models with rollback when a measure change breaks prod" },
    { icon: "🔬", title: "BI Developers", description: "Branch-based isolation and PR review for dashboards — no prior Git experience needed" },
    { title: "15 minutes", description: "Connect a workspace to Git and start versioning analytics artifacts" },
    { title: "0 local installs", description: "All Git operations run through the Fabric web UI — no CLI required" },
    { title: "5 min rollback", description: "Git revert restores production vs. hunting for a manual backup" }
  ]'
/>

---

<!-- SLIDE: Table of Contents -->
<TocSlide
  :sections='[
    { icon: "📦", title: "Git Foundations", subtitle: "Core vocabulary", blurb: "Repos, commits, branches, PRs — and how each maps to a Fabric action", slide: 4 },
    { icon: "🔗", title: "Fabric&#39;s Git Model", subtitle: "The inversion insight", blurb: "The workspace IS the working copy — no local clone, one branch per workspace", slide: 7 },
    { icon: "🌿", title: "Branch as Environment", subtitle: "Branch equals workspace", blurb: "Dev, test, and prod are workspace-branch pairs — not folders or permission sets", slide: 12 },
    { icon: "🛡️", title: "Staying in Sync", subtitle: "Day-2 operations", blurb: "Conflict prevention, resolution paths, and commit conventions that scale", slide: 17 }
  ]'
/>

---

<!-- SLIDE: Part 1 — Git Foundations -->
<SectionOpenerSlide
  :partNumber="1"
  title="Git Foundations"
  subtitle="Shared vocabulary before we touch Fabric"
  :cards='[
    { icon: "📦", title: "Repository", blurb: "Container for every version of every file" },
    { icon: "📸", title: "Commit", blurb: "Named snapshot — who changed what, and why" },
    { icon: "🌿", title: "Branch & PR", blurb: "Parallel timelines that merge via review" }
  ]'
  :terminal='{ context: "What does version control give analytics teams?", detail: "Every file change — tracked, attributed, and reversible" }'
/>

---

<!-- SLIDE: Core Git Concepts -->
<FourCardGridSlide
  :partNumber="1"
  pillIcon="📦"
  pillLabel="Git Foundations: Vocabulary"
  title="Four Concepts That Power Every Git Workflow"
  :cards='[
    { icon: "📦", title: "Repository", description: "The project container — holds every file and the complete history of every change ever made" },
    { icon: "📸", title: "Commit", description: "A named snapshot with author, timestamp, and message — the atomic unit of change in Git" },
    { icon: "🌿", title: "Branch", description: "A movable pointer to a commit — enables parallel lines of work that never interfere" },
    { icon: "🔀", title: "Pull Request", description: "A formal request to merge one branch into another — the gate for review, approval, and audit" }
  ]'
  :insight='{ icon: "", text: "These four concepts work the same way in Fabric Git integration as they do in any software project." }'
  :progressDots='{ current: 1, total: 2, activeColor: "bg-cyan-400 shadow-lg shadow-cyan-500/50" }'
/>

---

<!-- SLIDE: Git to Fabric Cheatsheet -->
<FrameworkMappingRowsSlide
  :partNumber="1"
  pillIcon="🗺️"
  pillLabel="Git Foundations: Cheatsheet"
  title="Git Concept → Fabric Equivalent"
  subtitle="Every Git action has a direct counterpart in the Fabric UI"
  :rows='[
    { label: "Repository", description: "Project history container hosted in Azure DevOps or GitHub", tag: "Connect in settings" },
    { label: "Clone", description: "Copy repo to work locally — not needed in Fabric", tag: "Connect workspace" },
    { label: "Commit", description: "Save a named snapshot of all changed items", tag: "Commit button" },
    { label: "Branch", description: "Parallel timeline — one workspace binds to one branch", tag: "New workspace" },
    { label: "Pull / Fetch", description: "Get latest changes from the remote repository", tag: "Update / Sync" },
    { label: "Pull Request", description: "Request review and approval before merging branches", tag: "PR in ADO/GitHub" }
  ]'
  footnote="Merge and revert work identically in Fabric — the Git history is standard and fully accessible"
  :progressDots='{ current: 2, total: 2, activeColor: "bg-cyan-400 shadow-lg shadow-cyan-500/50" }'
/>

---

<!-- SLIDE: Part 2 — Fabric's Git Model -->
<SectionOpenerSlide
  :partNumber="2"
  title="Fabric&#39;s Git Model"
  subtitle="The workspace IS the working copy — no local clone required"
  :cards='[
    { icon: "🔗", title: "One-to-One Binding", blurb: "Each workspace connects to exactly one branch" },
    { icon: "🔄", title: "Bidirectional Sync", blurb: "Commit pushes out; Update pulls in" },
    { icon: "📁", title: "Item Serialization", blurb: "Reports and datasets become diffable JSON" }
  ]'
  :terminal='{ context: "Connect workspace → commit → sync", detail: "Workspace IS the working copy — no local clone needed" }'
/>

---

<!-- SLIDE: Traditional Git vs Fabric's Model -->
<WorkflowShowdownStepsSlide
  :partNumber="2"
  pillIcon="🔄"
  pillLabel="Fabric&#39;s Git Model: The Inversion"
  title="Traditional Git vs Fabric&#39;s Workspace Model"
  subtitle="Fabric inverts the standard Git workflow — the cloud workspace replaces the local clone"
  leftLabel="Traditional Git"
  rightLabel="Fabric Git"
  :steps='[
    { left: { label: "Install Git locally", note: "CLI tools, credential manager, config" }, right: { label: "No install needed", note: "All operations through the Fabric web UI" } },
    { left: { label: "Clone repository", note: "Full repo copy lands on your machine" }, right: { label: "Connect workspace to branch", note: "One workspace, one branch — bound in settings" } },
    { left: { label: "Edit files locally", note: "Work in your editor, stage changes manually" }, right: { label: "Edit items in Fabric UI", note: "Work directly on live workspace items" } },
    { left: { label: "Commit then push", note: "Two separate steps: local commit, then push" }, right: { label: "Commit from workspace", note: "Serialize and push in one action" } }
  ]'
  :outcomeLeft='{ icon: "⚙️", label: "Git CLI experience required — local setup and credential management" }'
  :outcomeRight='{ icon: "✅", label: "Connect in 15 minutes — no Git install or local experience required" }'
  summaryMetric="4-step Git setup → 1-click Fabric workspace connection"
  :progressDots='{ current: 1, total: 4, activeColor: "bg-blue-400 shadow-lg shadow-blue-500/50" }'
/>

---

<!-- SLIDE: Workspace Setup Journey -->
<MaturityJourneyRoadmapSlide
  :partNumber="2"
  pillIcon="⚙️"
  pillLabel="Fabric&#39;s Git Model: Setup"
  title="Connecting Your First Workspace — 5 Steps"
  subtitle="From zero to version-controlled analytics in under 15 minutes"
  :stages='[
    { label: "1", name: "Open Settings", description: "Workspace → Settings → Git integration tab", icon: "⚙️", isTarget: false },
    { label: "2", name: "Choose Provider", description: "Select Azure DevOps or GitHub and authenticate", icon: "🔐", isTarget: false },
    { label: "3", name: "Configure Branch", description: "Set repository, branch, and root folder path", icon: "🌿", isTarget: false },
    { label: "4", name: "Pick Direction", description: "Import from Git or Export to Git for first sync", icon: "🔄", isTarget: false },
    { label: "5", name: "Verify", description: "Commit and Update buttons appear — workspace is live", icon: "✅", isTarget: true }
  ]'
  caption="Prerequisites: Fabric Contributor role + Azure DevOps or GitHub repository already created"
  :progressDots='{ current: 2, total: 4, activeColor: "bg-blue-400 shadow-lg shadow-blue-500/50" }'
/>

---

<!-- SLIDE: Supported Item Types -->
<FrameworkMappingRowsSlide
  :partNumber="2"
  pillIcon="📁"
  pillLabel="Fabric&#39;s Git Model: What Serializes"
  title="Which Fabric Items Support Git Integration"
  subtitle="Each item type serializes into a format optimized for meaningful diffs"
  :rows='[
    { label: "Notebooks", description: "Serialized as .py / .ipynb metadata — excellent line-by-line diffs", tag: "Excellent diffs" },
    { label: "Sem. Models", description: "TMDL format — structured JSON diffs for measures and tables", tag: "Good diffs" },
    { label: "Reports", description: ".pbir + report.json — JSON diffs per visual and page layout", tag: "Moderate diffs" },
    { label: "Pipelines", description: "JSON activity definitions — diffable at the activity level", tag: "Good diffs" },
    { label: "Spark Jobs", description: "Code + metadata files — excellent code-level line diffs", tag: "Excellent diffs" },
    { label: "Lakehouses", description: "Schema metadata only — structural changes visible, data is not", tag: "Limited diffs" }
  ]'
  footnote="Data is never committed — only item definitions, configuration, and folder structure go to Git"
  :progressDots='{ current: 3, total: 4, activeColor: "bg-blue-400 shadow-lg shadow-blue-500/50" }'
/>

---

<!-- SLIDE: What Gets Committed vs Not -->
<TwoColPairedConceptsSlide
  :partNumber="2"
  pillIcon="📋"
  pillLabel="Fabric&#39;s Git Model: Commit Scope"
  title="What Goes to Git — and What Stays in Fabric"
  :left='{
    header: "Committed to Git",
    icon: "✅",
    items: [
      { title: "Item definitions", detail: "JSON, code, and metadata that define each item" },
      { title: "Configuration", detail: "Connections, parameters, and data source refs" },
      "Folder structure mirroring workspace layout",
      "Dependency relationships between items"
    ]
  }'
  :right='{
    header: "Stays in Fabric Only",
    icon: "🔒",
    items: [
      { title: "Data", detail: "Table rows, file content, lakehouse files" },
      "Refresh history and execution logs",
      "Personal bookmarks and subscriptions",
      "Runtime state and cached query results"
    ]
  }'
  :progressDots='{ current: 4, total: 4, activeColor: "bg-blue-400 shadow-lg shadow-blue-500/50" }'
/>

---

<!-- SLIDE: Part 3 — Branch as Environment -->
<SectionOpenerSlide
  :partNumber="3"
  title="Branch as Environment"
  subtitle="Dev, test, and prod are workspace-branch pairs — not folders"
  :cards='[
    { icon: "🏗️", title: "Feature Workspace", blurb: "New branch = new isolated dev environment" },
    { icon: "🔀", title: "PR Promotion", blurb: "Changes reach production only after review" },
    { icon: "🚀", title: "CI Validation", blurb: "Pipeline checks JSON and security before merge" }
  ]'
  :terminal='{ context: "Create branch → connect workspace → develop", detail: "3 isolated environments — zero coordination overhead" }'
/>

---

<!-- SLIDE: Three Environment Types -->
<ThreeColumnCardSlide
  :partNumber="3"
  pillIcon="🗺️"
  pillLabel="Branch as Environment: The Map"
  title="Three Environments — Three Workspace-Branch Pairs"
  :columns='[
    { icon: "🏗️", title: "Development", description: "feature/* branch — one workspace per feature or developer", items: ["Created fresh per task", "Deleted after PR merges"] },
    { icon: "🔬", title: "Test / UAT", description: "test branch — shared workspace for QA and business validation", items: ["Always-on test workspace", "Syncs when feature PR merges"] },
    { icon: "🚀", title: "Production", description: "main branch — production workspace changed only via PR approval", items: ["Protected branch policies", "Sync only after review"] }
  ]'
  :progressDots='{ current: 1, total: 4, activeColor: "bg-indigo-400 shadow-lg shadow-indigo-500/50" }'
/>

---

<!-- SLIDE: Branch Lifecycle -->
<MaturityJourneyRoadmapSlide
  :partNumber="3"
  pillIcon="🔀"
  pillLabel="Branch as Environment: Lifecycle"
  title="The Feature Branch Lifecycle in Fabric"
  subtitle="From first commit to production — the complete journey"
  :stages='[
    { label: "1", name: "Create Branch", description: "Branch from test — name it feature/[task]", icon: "🌿", isTarget: false },
    { label: "2", name: "Connect Workspace", description: "New Fabric workspace bound to the feature branch", icon: "🔗", isTarget: false },
    { label: "3", name: "Develop & Commit", description: "Build items, commit daily with descriptive messages", icon: "💻", isTarget: false },
    { label: "4", name: "PR & Review", description: "Open pull request — team reviews serialized item diffs", icon: "🔀", isTarget: false },
    { label: "5", name: "Merge & Sync", description: "Merge PR — production workspace syncs to latest main", icon: "✅", isTarget: true }
  ]'
  caption="Delete the feature branch and workspace after merge — keep the repository clean"
  :progressDots='{ current: 2, total: 4, activeColor: "bg-indigo-400 shadow-lg shadow-indigo-500/50" }'
/>

---

<!-- SLIDE: CI Validation Pipeline -->
<TwoColPairedConceptsSlide
  :partNumber="3"
  pillIcon="🛡️"
  pillLabel="Branch as Environment: CI Gates"
  title="What the Validation Pipeline Checks on Every PR"
  :left='{
    header: "Triggers",
    icon: "⚡",
    items: [
      "PR opened targeting the test branch",
      "PR opened targeting the main branch",
      { title: "Branch policy", detail: "Required checks must pass before merge is allowed" }
    ]
  }'
  :right='{
    header: "Checks",
    icon: "🛡️",
    items: [
      { title: "JSON validation", detail: "All item definition files must be valid JSON" },
      { title: "Commit message format", detail: "feat:|fix:|refactor:|docs:|test: required" },
      { title: "Security scan", detail: "No credential or local settings files in commit" }
    ]
  }'
  :progressDots='{ current: 3, total: 4, activeColor: "bg-indigo-400 shadow-lg shadow-indigo-500/50" }'
/>

---

<!-- SLIDE: Workspace-Branch Mapping -->
<FrameworkMappingRowsSlide
  :partNumber="3"
  pillIcon="📋"
  pillLabel="Branch as Environment: Reference"
  title="Workspace-Branch Mapping Reference"
  subtitle="One repo — three environments — clear promotion path"
  :rows='[
    { label: "Production", description: "main branch — Analytics-Prod workspace, read-only consumers", tag: "main" },
    { label: "Test / UAT", description: "test branch — Analytics-Test workspace for QA validation", tag: "test" },
    { label: "Development", description: "feature/* branches — Analytics-Dev-[feature] per task", tag: "feature/*" }
  ]'
  footnote="All three environments share one repository — root folder settings separate workspace items per branch"
  :progressDots='{ current: 4, total: 4, activeColor: "bg-indigo-400 shadow-lg shadow-indigo-500/50" }'
/>

---

<!-- SLIDE: Part 4 — Staying in Sync -->
<SectionOpenerSlide
  :partNumber="4"
  title="Staying in Sync"
  subtitle="Day-2 habits that keep your team conflict-free"
  :cards='[
    { icon: "🛡️", title: "Prevent First", blurb: "Ownership and daily commits beat resolution" },
    { icon: "⚖️", title: "Three Paths", blurb: "Accept theirs, accept yours, or merge manually" },
    { icon: "✍️", title: "Commit Messages", blurb: "feat:|fix:|refactor: — simple, auditable" }
  ]'
  :terminal='{ context: "Sync conflict detected on workspace update", detail: "3 resolution paths — pick the right one for the situation" }'
/>

---

<!-- SLIDE: Conflict Prevention Strategies -->
<FourCardGridSlide
  :partNumber="4"
  pillIcon="🛡️"
  pillLabel="Staying in Sync: Prevention"
  title="Four Habits That Prevent Most Conflicts"
  :cards='[
    { icon: "👤", title: "Item Ownership", description: "Assign clear ownership per artifact in CODEOWNERS — eliminates overlapping edits before they happen" },
    { icon: "📅", title: "Commit Daily", description: "Small frequent commits keep divergence windows short — longer gaps mean bigger conflicts" },
    { icon: "🔄", title: "Sync Before Starting", description: "Pull latest from the branch before each work session — start from the current state every time" },
    { icon: "✂️", title: "Granular Items", description: "Prefer focused single-purpose reports over one large report — smaller blast radius per change" }
  ]'
  :insight='{ icon: "", text: "Teams that own items and commit daily almost never experience conflicts." }'
  :progressDots='{ current: 1, total: 2, activeColor: "bg-purple-400 shadow-lg shadow-purple-500/50" }'
/>

---

<!-- SLIDE: Conflict Resolution Options -->
<ThreeColumnCardSlide
  :partNumber="4"
  pillIcon="⚖️"
  pillLabel="Staying in Sync: Resolution"
  title="Three Paths When a Conflict Occurs"
  :columns='[
    { icon: "⬇️", title: "Accept Remote", description: "Discard workspace changes — use when the remote branch has the correct final state", items: ["One-click in Fabric UI", "Use when: remote wins"] },
    { icon: "⬆️", title: "Accept Workspace", description: "Overwrite branch with workspace state — use when your current workspace is the source of truth", items: ["One-click in Fabric UI", "Use when: local wins"] },
    { icon: "🔧", title: "Resolve in Git", description: "Manually merge in VS Code or CLI — use when both sets of changes must be preserved", items: ["Commit resolution first", "Then sync workspace"] }
  ]'
  :progressDots='{ current: 2, total: 2, activeColor: "bg-purple-400 shadow-lg shadow-purple-500/50" }'
/>

---

<!-- SLIDE: Before and After -->
<BeforeAfterSlide
  header="From Manual Backups to Version-Controlled Analytics"
  :leftItems='[
    "Report_v2_final_FINAL.pbix scattered across OneDrive",
    "Verbal coordination: don&#39;t touch it, I&#39;m working on it",
    "Production rollback means restoring from a manual backup copy",
    "No audit trail for compliance or change approvals"
  ]'
  :rightItems='[
    "Every workspace item versioned in Azure DevOps or GitHub",
    "Branch isolation — parallel development, zero coordination overhead",
    "Production restored in 5 minutes via Git revert commit",
    "Immutable audit trail with reviewer approvals on every merge"
  ]'
  :metrics='[
    { value: "15 min", detail: "to connect a workspace to Git and start versioning" },
    { value: "5 min", detail: "to restore production via Git revert vs. manual backup" },
    { value: "0", detail: "local installs — all Git operations through the Fabric UI" }
  ]'
/>

---

<!-- SLIDE: What You Can Do Today -->
<WhatYouCanDoTodaySlide
  :today='[
    "Create a Git repo in Azure DevOps or GitHub for your Fabric content",
    "Connect one non-production workspace to the main branch",
    "Commit a small change and verify it appears in the repo history"
  ]'
  :thisWeek='[
    "Set up dev, test, and prod branches with a connected workspace each",
    "Practice the full cycle: modify → commit → PR → merge → sync",
    "Establish commit message conventions with the team (feat: / fix: / refactor:)"
  ]'
  :thisMonth='[
    "Configure branch policies with required reviewers and build validation",
    "Set up CI JSON validation from the branching-workflow.yml template",
    "Create a CODEOWNERS file mapping each item to a responsible owner"
  ]'
  footer="Works with both Azure DevOps and GitHub — no new toolchain required for your team."
/>

---

<!-- SLIDE: References -->
<ReferencesSlide
  :groups='[
    { title: "📖 Official Documentation", color: "cyan", items: [
      { href: "https://learn.microsoft.com/en-us/fabric/cicd/git-integration/intro-to-git-integration", label: "Introduction to Git integration in Microsoft Fabric", description: "Core concepts, setup, supported items, and sync operations" },
      { href: "https://learn.microsoft.com/en-us/fabric/cicd/git-integration/manage-branches", label: "Manage branches in Fabric Git integration", description: "Branching strategies and workspace-branch patterns" },
      { href: "https://learn.microsoft.com/en-us/azure/devops/repos/git/branch-policies", label: "Azure DevOps branch policies", description: "Configure PR requirements and CI validation gates" }
    ] },
    { title: "🛠️ Related Resources", color: "purple", items: [
      { href: "https://github.com/git-guides", label: "GitHub Git Guides", description: "Foundational Git concepts: repos, commits, branches, and pull requests" },
      { label: "Microsoft Fabric CI/CD Overview", description: "Broader CI/CD capabilities including Fabric deployment pipelines" }
    ] }
  ]'
/>

---

<!-- SLIDE: Thank You -->
<ThankYouSlide
  title="Git Basics for Microsoft Fabric"
  subtitle="Version control for analytics teams — starting today"
  :cards="[{ icon: '⏱️', value: '15 minutes', detail: 'Connect workspace to Git', subdetail: 'All operations through the Fabric UI — no local install required' }, { icon: '🌿', value: 'Branch = Env', detail: 'One workspace per environment', subdetail: 'Feature to test to prod via PR promotion — not manual copy-paste' }, { icon: '⏪', value: '5 min rollback', detail: 'Git revert restores prod', subdetail: 'Immutable audit trail — every change attributed and reversible' }]"
  prompt="Which Fabric workspace will you connect to Git first?"
/>
