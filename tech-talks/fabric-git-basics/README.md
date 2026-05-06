---
status: active
updated: 2026-05-05
section: "Developers"
references:
  - url: https://learn.microsoft.com/en-us/fabric/cicd/git-integration/intro-to-git-integration
    label: "Introduction to Git integration in Microsoft Fabric"
    verified: 2026-05-05
  - url: https://github.com/git-guides
    label: "GitHub Git Guides"
    verified: 2026-05-05
---

# Git Basics for Microsoft Fabric: Version Control for Analytics Teams

> **The Question This Talk Answers:**
> *"How do fundamental Git concepts map to Microsoft Fabric's workspace model, and what does our team need to know to start using Git integration effectively?"*

**Duration:** 30 minutes | **Target Audience:** Data Engineers / Analytics Engineers / BI Developers

---

## 📊 Content Fitness

| Criterion | Assessment | Notes |
|-----------|-----------|-------|
| **Relevant** | 🟢 High | Data teams adopting Fabric need Git literacy — most BI professionals haven't used version control for analytics artifacts before |
| **Compelling** | 🟢 High | The workspace-branch binding model is a genuinely novel mental model that inverts how most developers think about Git |
| **Actionable** | 🟢 High | Teams can connect a workspace to a repo within 15 minutes and immediately gain version history, branching, and rollback |

**Overall Status:** 🟢 Ready to use

---

## The Opportunity

### What's Now Possible

- **Version-controlled analytics artifacts**
  Reports, datasets, notebooks, and pipelines gain full commit history, diffs, and rollback capabilities through Fabric's Git integration.

- **Branch-based development environments**
  Teams can create isolated development workspaces tied to Git branches, enabling parallel work without risk to production.

- **Pull request-driven collaboration**
  Data teams can adopt the same code review and approval workflows that software engineering teams use — applied to analytics content.

- **Automated deployment pipelines**
  Git integration opens the door to CI/CD patterns for analytics, enabling promotion from dev → test → prod with audit trails.

### The Emerging Practice

Microsoft Fabric's Git integration transforms analytics development from a single-workspace, overwrite-based workflow into a branch-and-merge collaboration model. Data engineers and BI developers can now serialize workspace items — reports, semantic models, notebooks, data pipelines — into Git-friendly JSON and metadata formats that support meaningful diffs and merge operations.

This is particularly powerful for teams that have experienced the pain of "who changed the report last Friday?" or "we need to roll back the dataset to last week's version." Git integration brings the safety net of version control to artifacts that were historically opaque binary blobs managed through manual backup copies or SharePoint versioning.

The practice is emerging fastest among teams that already have Azure DevOps or GitHub repositories for their data engineering code. For these teams, extending Git workflows to Fabric items is a natural next step — one that unifies their entire analytics lifecycle under a single version control strategy.

---

## How It Works: Fabric Git Integration

### What It Does

Fabric Git integration connects a workspace to a branch in an Azure DevOps or GitHub repository. When items change in the workspace, those changes can be committed to the connected branch. When the branch changes (via merges or direct commits), the workspace can sync to pull in updates.[^1]

### Key Capabilities

- **Workspace-to-branch binding**: Each Fabric workspace connects to exactly one branch in a Git repository, establishing a bidirectional sync relationship.
- **Item serialization**: Fabric items (reports, datasets, notebooks, pipelines) are serialized into platform-defined JSON/metadata formats suitable for version control.[^1]
- **Commit and sync operations**: Changes flow from workspace → branch (commit) and branch → workspace (sync/update) through the Fabric UI.
- **Conflict detection**: When both the workspace and the remote branch have diverged, Fabric surfaces conflicts that must be resolved before syncing.

### Architecture Overview

The integration operates on a workspace-level binding model. A Fabric workspace is connected to a specific branch in a remote Git repository (Azure Repos or GitHub). This is fundamentally different from a developer's local clone — there's no local `.git` directory. Instead, Fabric acts as a specialized Git client that translates workspace state into committed file structures.

When a user commits from the workspace, Fabric serializes each modified item into its defined file format and pushes a commit to the connected branch. When syncing from the branch, Fabric deserializes the file content back into live workspace items. This two-way serialization/deserialization is what enables standard Git operations (branching, merging, pull requests) to work with analytics artifacts.[^1]

The supported item types include notebooks, semantic models, reports, data pipelines, Spark job definitions, and more. Each item type has its own serialization format, optimized for readability and meaningful diffs.

**Official Documentation:**
- 📖 [Git Integration in Microsoft Fabric](https://learn.microsoft.com/en-us/fabric/cicd/git-integration/intro-to-git-integration) — Core concepts and setup
- 📖 [GitHub Git Guides](https://github.com/git-guides) — Foundational Git concepts and workflows

---

## 📦 Key Artifacts

### Primary Artifacts

*These are shown inline with detailed explanation in the major sections below*

- **`git-cheatsheet.md`** — Quick-reference guide mapping Git commands to their Fabric UI equivalents
- **`workspace-git-setup.md`** — Step-by-step configuration for connecting a workspace to a repository
- **`branching-workflow.yml`** — Azure DevOps pipeline template for Fabric branch promotion
- **`conflict-resolution-guide.md`** — Decision tree for handling sync conflicts in Fabric workspaces

---

## 🎯 Mental Model Shift

> **The Core Insight:** In Fabric, the workspace IS the working copy — connecting a workspace to a branch is the equivalent of `git clone`, and every workspace commit is a snapshot of the entire workspace state.

### Move Toward (Embrace These Patterns)

- ✅ **One workspace per environment**: Dev, test, and prod each get their own workspace bound to the appropriate branch → Clear separation of concerns with full audit trail
- ✅ **Commit early, commit often**: Small, descriptive commits create a recoverable timeline of changes → Easy rollback to any known-good state
- ✅ **Pull requests for promotion**: Changes move from dev to main via PR review → Peer review catches errors before they reach production
- ✅ **Branch naming conventions**: Consistent naming (e.g., `feature/new-report`, `fix/dataset-refresh`) → Self-documenting change history

### Move Away From (Retire These Habits)

- 🔄 **Single shared workspace editing**: Multiple people editing the same workspace simultaneously → Create feature branches with dedicated workspaces for isolation
- 🔄 **Manual backup copies**: Saving "Report_v2_final_FINAL.pbix" as version control → Commit history provides complete, navigable version timeline
- 🔄 **Verbal change coordination**: "Don't touch the report, I'm working on it" → Branch isolation removes the need for coordination overhead

### Move Against (Active Resistance)

- 🛑 **Committing without messages**: Empty or generic commit messages ("update", "fix") destroy the audit trail → Every commit message answers "what changed and why"
- 🛑 **Working directly on main**: Making changes in a workspace connected to `main` bypasses all review gates → Always develop on a feature branch, promote via PR

> **What This Looks Like:** A data engineer creates a feature branch `feature/new-sales-report`, connects a dev workspace to it, builds and tests the report, commits with the message "Add regional sales breakdown with YoY comparison," then opens a pull request. A teammate reviews the serialized report definition, approves, and the merge triggers a sync to the production workspace.

---

## When to Use This Pattern

### Decision Tree

```
Q: Are multiple people modifying Fabric workspace items?
├─ Yes → Use: Git integration with branch-per-developer
│  └─ Best for: Teams of 2+ collaborating on shared analytics
│
├─ No, but need version history → Use: Git integration on main branch only
│  └─ Best for: Solo developers who want rollback safety
│
└─ No, single ad-hoc report → Skip: Git integration adds overhead for throwaway work
   └─ Best for: One-time analysis or prototyping
```

### Use This Pattern When

- Multiple team members modify the same workspace items
- Production analytics require audit trails and change approval
- The team needs to roll back to previous versions of reports or datasets
- Development, testing, and production environments need isolation

### Don't Use This Pattern When

- The workspace contains only personal exploration or prototyping — use a personal workspace without Git overhead
- Items are generated entirely by automated pipelines with no human editing — version the pipeline code instead
- The team lacks access to Azure DevOps or GitHub repositories — prerequisite infrastructure is needed first

### Comparison with Related Features

| Aspect | Git Integration | Deployment Pipelines | Manual Export/Import |
|--------|----------------|---------------------|---------------------|
| **Best For** | Full version control + collaboration | Stage-based promotion without Git | Quick one-time migrations |
| **Strengths** | Complete history, branching, PRs, rollback | Simpler setup, visual stage management | No infrastructure required |
| **Limitations** | Requires Git repository + learning curve | No commit history or branching | No history, error-prone, no collaboration |
| **Setup Time** | 30–60 minutes | 15–30 minutes | Immediate |

---

<!-- 🎬 MAJOR SECTION: Git Fundamentals -->

## Git Fundamentals: The Extended Primer

This section provides the foundational Git knowledge needed to work effectively with Fabric's Git integration. These concepts apply universally — whether working with code, configuration, or Fabric workspace items.[^2]

### Repositories: The Container for Everything

A **repository** (repo) is a complete history of a project. It contains every file, every change ever made to those files, and metadata about who made each change and when. In the Fabric context, a repository holds the serialized definitions of workspace items.[^2]

```
my-fabric-project/           ← repository root
├── SalesReport/             ← a Fabric report item
│   ├── report.json
│   └── definition.pbir
├── RevenueDataset/          ← a Fabric semantic model
│   ├── model.bim
│   └── definition.json
└── README.md
```

**Key concept:** The repository is hosted remotely (Azure DevOps or GitHub). Fabric workspaces connect to it — they don't contain a local copy of the full repo history.

### Commits: Snapshots in Time

A **commit** is a snapshot of the repository at a specific moment. Each commit has:
- A unique identifier (SHA hash)
- A message describing what changed
- A pointer to the previous commit (parent)
- The actual file changes (diff)[^2]

```
commit a3f7b2c  ← unique identifier
Author: Dana <dana@contoso.com>
Date: 2026-05-05

    Add quarterly revenue breakdown to sales report

    - Added Q1-Q4 comparison visual
    - Updated dataset relationship for fiscal calendar
```

**In Fabric:** When committing from a workspace, Fabric creates a Git commit containing the serialized state of all modified items since the last commit.

### Branches: Parallel Timelines

A **branch** is a movable pointer to a commit. Branches enable parallel lines of development without interference. The default branch is typically called `main`.[^2]

```
main:       A → B → C → D          (production)
                 \
feature:          E → F → G        (development)
```

**In Fabric:** Each workspace connects to exactly one branch. Creating a new branch and connecting a workspace to it is equivalent to creating an isolated development environment.

### Merging and Pull Requests: Bringing Work Together

**Merging** combines changes from one branch into another. A **pull request** (PR) is a formal request to merge, which enables:
- Code review before changes reach production
- Automated checks and validations
- Discussion and approval workflows[^2]

```
main:       A → B → C → D → H     (after merge)
                 \           /
feature:          E → F → G        (merged in)
```

**In Fabric:** After developing in a feature workspace/branch, a PR merges changes into `main`. Once merged, the production workspace syncs to pull in the approved changes.

### The Artifact: Git Cheatsheet for Fabric Teams

```markdown
# Git Concepts → Fabric Actions Cheatsheet

| Git Concept      | What It Means                    | Fabric Equivalent                          |
|------------------|----------------------------------|--------------------------------------------|
| Repository       | Project history container        | Azure DevOps/GitHub repo connected to workspace |
| Clone            | Copy repo to work locally        | Connect workspace to branch                |
| Commit           | Save a snapshot of changes       | "Commit" button in workspace source control |
| Branch           | Parallel line of development     | New branch + new connected workspace       |
| Checkout         | Switch to a different branch     | Connect workspace to a different branch    |
| Pull / Fetch     | Get latest changes from remote   | "Update" / sync from branch                |
| Push             | Send local changes to remote     | Commit from workspace (auto-pushes)        |
| Merge            | Combine branches                 | Complete a pull request                    |
| Pull Request     | Request review before merge      | PR in Azure DevOps or GitHub               |
| Conflict         | Competing changes to same file   | Sync conflict in workspace                 |
| Revert           | Undo a commit                    | Revert commit in Git history               |
| Log / History    | View change timeline             | Git history in repo + Fabric audit log     |
```

---

<!-- 🎬 MAJOR SECTION: Fabric Git Model -->

## Fabric's Git Model: Workspace-Branch Binding

Understanding how Fabric implements Git integration is essential — it differs from the typical developer workflow in important ways.[^1]

### The Binding Model

In traditional Git usage, a developer clones a repository to their local machine, works on files, commits locally, and pushes to a remote. In Fabric, the model is inverted:

1. **The workspace is the working copy** — there's no local clone
2. **One workspace, one branch** — the binding is strict and explicit
3. **Commits go directly to the remote** — there's no local staging area
4. **Sync pulls from the remote** — updates flow from the branch into the workspace

This means that creating a "development environment" in Fabric requires creating a separate workspace connected to a different branch.

### Setting Up the Connection

The connection between a workspace and a Git repository is configured through Fabric's workspace settings. The following details are required:

- **Git provider**: Azure DevOps or GitHub
- **Repository**: The specific repo to connect
- **Branch**: Which branch this workspace will track
- **Root folder**: The directory within the repo for this workspace's items (enabling multiple workspaces to share a repo)

### The Artifact: Workspace Git Setup Guide

```markdown
# Connecting a Fabric Workspace to Git

## Prerequisites
- Fabric workspace with at least Contributor role
- Azure DevOps organization/project with a Git repo, OR GitHub repo
- Personal access token or OAuth configured for the Git provider

## Step-by-Step Setup

### 1. Open Workspace Settings
Navigate to the workspace → Settings → Git integration

### 2. Select Git Provider
Choose "Azure DevOps" or "GitHub" and authenticate

### 3. Configure Connection
- Organization/Account: [your org]
- Project (Azure DevOps only): [your project]
- Repository: [your repo name]
- Branch: main (or your target branch)
- Root folder: / (or a subdirectory like /fabric-items/)

### 4. Initial Sync Direction
- "Import from Git" — workspace items are overwritten with repo content
- "Export to Git" — current workspace items are committed to the branch

### 5. Verify Connection
- Source control icon appears on workspace items
- "Commit" and "Update" buttons appear in the toolbar
- Items show sync status (synced, modified, conflict)

## Common Setup Issues

| Issue | Cause | Resolution |
|-------|-------|------------|
| "Repository not found" | Insufficient permissions on repo | Grant read/write access to the connecting identity |
| "Branch does not exist" | Typo or branch not yet created | Create the branch first in Azure DevOps/GitHub |
| Items not appearing after import | Root folder mismatch | Verify the folder path matches item location in repo |
| Authentication failure | Token expired or scopes insufficient | Regenerate PAT with Code (Read & Write) scope |
```

### Supported Item Types

Not all Fabric item types support Git integration. Currently supported items include:

| Item Type | Serialization Format | Diff Quality |
|-----------|---------------------|--------------|
| Notebooks | `.py` / `.ipynb` metadata | Excellent — line-by-line diffs |
| Semantic Models | `.bim` (TMDL) | Good — structured JSON diffs |
| Reports | `.pbir` + `report.json` | Moderate — JSON structure diffs |
| Data Pipelines | JSON definition | Good — activity-level diffs |
| Spark Job Definitions | Code + metadata | Excellent — code diffs |
| Lakehouses | Metadata only | Limited — schema-level only |

### What Gets Committed

When committing from a workspace, Fabric serializes each modified item into its platform-defined format. The commit contains:

- Item definition files (JSON, code, metadata)
- Item configuration (connections, parameters)
- Folder structure mirroring workspace organization

What does NOT get committed:
- Data (tables, rows, file content in lakehouses)
- Runtime state (refresh history, execution logs)
- User-specific settings (personal bookmarks, subscriptions)

---

<!-- 🎬 MAJOR SECTION: Branching Strategies -->

## Branching Strategies for Fabric

Branching strategies define how teams organize parallel work and promote changes between environments. The right strategy depends on team size and release cadence.[^1][^2]

### The Recommended Pattern: Environment Branches

The most common pattern for Fabric teams maps branches to deployment stages:

```
main (production)          ← Production workspace syncs here
├── test                   ← Test/UAT workspace syncs here
│   ├── feature/report-v2  ← Dev workspace for specific feature
│   ├── feature/new-dataset ← Another dev workspace
│   └── fix/refresh-bug    ← Hotfix workspace
```

Each long-lived branch (`main`, `test`) has a permanently connected workspace. Feature branches are short-lived — created for specific work items, then merged and deleted.

### Branch Lifecycle in Fabric

1. **Create feature branch** from `test` (or `main` for hotfixes)
2. **Create or connect a workspace** to the feature branch
3. **Develop and commit** changes in the feature workspace
4. **Open a pull request** to merge feature → test
5. **Review and approve** — team validates the PR
6. **Merge** — test workspace auto-syncs (or manually syncs)
7. **Validate in test** — run data validation, UAT
8. **Promote to main** — PR from test → main
9. **Delete feature branch** and disconnect/delete the feature workspace

### The Artifact: Branching Workflow Configuration

```yaml
# branching-workflow.yml
# Azure DevOps pipeline for Fabric branch promotion validation

trigger:
  branches:
    include:
      - main
      - test

pr:
  branches:
    include:
      - main
      - test

pool:
  vmImage: 'ubuntu-latest'

stages:
  - stage: ValidatePR
    displayName: 'Validate Pull Request'
    jobs:
      - job: CheckItemDefinitions
        displayName: 'Validate Fabric Item Definitions'
        steps:
          - checkout: self

          - script: |
              echo "Checking for valid JSON in item definitions..."
              find . -name "*.json" -path "*/definition/*" | while read f; do
                python3 -c "import json; json.load(open('$f'))" || exit 1
              done
            displayName: 'JSON Syntax Validation'

          - script: |
              echo "Checking commit messages follow convention..."
              COMMIT_MSG=$(git log --format=%s -1)
              if [[ ! "$COMMIT_MSG" =~ ^(feat|fix|refactor|docs|test): ]]; then
                echo "##vso[task.logissue type=error]Commit message must start with feat:|fix:|refactor:|docs:|test:"
                exit 1
              fi
            displayName: 'Commit Message Convention'

          - script: |
              echo "Checking for workspace items that should not be committed..."
              if find . -name "*.credentials" -o -name "*.localSettings" | grep -q .; then
                echo "##vso[task.logissue type=error]Credential or local settings files detected"
                exit 1
              fi
            displayName: 'Security Check - No Credentials'
```

### Workspace-Branch Mapping Table

| Environment | Branch | Workspace | Purpose | Connected Users |
|-------------|--------|-----------|---------|-----------------|
| Production | `main` | `Analytics-Prod` | Live reports and datasets | Report consumers (read-only) |
| Test/UAT | `test` | `Analytics-Test` | Validation before production | QA team, business validators |
| Development | `feature/*` | `Analytics-Dev-[feature]` | Active development | Individual developer or pair |

---

<!-- 🎬 MAJOR SECTION: Collaboration and Conflicts -->

## Collaboration and Conflict Resolution

When multiple people work on the same repository — even on different branches — conflicts can arise. Understanding how to prevent and resolve them is critical for team productivity.[^1][^2]

### How Conflicts Happen in Fabric

A conflict occurs when:
1. Developer A commits changes to a report in the feature workspace
2. Developer B modifies the same report section and merges to the target branch
3. Developer A attempts to sync or merge — Git detects competing changes to the same file sections

In Fabric's serialized format, conflicts manifest in the JSON definition files. For example, two developers might both modify the visual layout of the same report page.

### Prevention Strategies

The best conflict resolution is conflict prevention:

| Strategy | How It Helps | Implementation |
|----------|-------------|----------------|
| **Item ownership** | Clear responsibility per artifact | Document in README or CODEOWNERS file |
| **Small, frequent commits** | Reduces divergence window | Commit at least daily during active development |
| **Frequent syncs** | Stay current with team changes | Sync from branch before starting new work |
| **Granular items** | Smaller blast radius per change | Prefer multiple focused reports over one mega-report |

### The Artifact: Conflict Resolution Decision Tree

```markdown
# Conflict Resolution Guide for Fabric Git Integration

## When You See "Sync Conflict" in Fabric

### Step 1: Identify the Conflict Type

Q: Is this a content conflict or a structural conflict?

Content conflict:
  - Same visual/measure/column modified by two people
  - Resolution: Choose one version or manually combine in the Git repo

Structural conflict:
  - Item renamed, moved, or deleted on one side while modified on the other
  - Resolution: Usually accept the structural change, then reapply modifications

### Step 2: Resolution Options

┌─ Option A: Accept Remote (theirs)
│  → Discards your uncommitted workspace changes for conflicting items
│  → Use when: The other person's changes are more current/correct
│
├─ Option B: Accept Workspace (ours)
│  → Overwrites the branch version with current workspace state
│  → Use when: Your workspace has the correct final state
│
└─ Option C: Resolve in Git
   → Resolve the conflict using standard Git tools (VS Code, CLI)
   → Commit the resolution, then sync workspace from the resolved branch
   → Use when: Both changes need to be preserved (manual merge)

### Step 3: Post-Resolution Validation

After resolving:
1. Sync the workspace to confirm clean state
2. Open affected items and verify they render correctly
3. Run any data refresh to ensure dataset connections are intact
4. Commit a "resolve conflict" commit with notes on what was chosen

### Common Conflict Scenarios

| Scenario | Recommended Resolution |
|----------|----------------------|
| Two people edited different visuals on same report page | Resolve in Git — both changes can coexist |
| Same measure formula changed by two people | Discuss, pick the correct version |
| Item deleted on main but modified on feature | Usually accept deletion, recreate if still needed |
| Notebook cells reordered differently | Resolve in Git — choose the intended order |
```

### Commit Message Best Practices

Clear commit messages create a navigable project history. Adopt a lightweight convention:

```
<type>: <short description>

<optional body explaining why>
```

**Types:**
- `feat:` — New item or significant addition (new report, new dataset)
- `fix:` — Correction to existing item (broken visual, wrong measure)
- `refactor:` — Restructuring without behavior change (reorganize report pages)
- `docs:` — Documentation updates (README, descriptions)

**Examples:**
```
feat: Add regional sales breakdown report

Includes YoY comparison by region with drill-through
to individual store performance.

fix: Correct revenue measure to exclude returns

Previous formula double-counted returned items in
Q4 totals. Updated DAX filter context.
```

---

## Real-World Use Cases

### Use Case 1: Multi-Developer Report Development

**The Scenario:** A team of three analysts is building a comprehensive executive dashboard in Fabric. They need to work on different report pages simultaneously without overwriting each other's work.

**How It Works:** Each analyst creates a feature branch and connects a personal dev workspace to it. They develop their assigned report pages, commit daily, and open PRs to merge into the shared `test` branch. The team lead reviews PRs before approving merges.

**What You Get:** Three parallel development streams with zero coordination overhead — each analyst works independently, and the PR process ensures quality before integration. Merge conflicts are rare because each person owns distinct report pages.

---

### Use Case 2: Production Rollback After Failed Refresh

**The Scenario:** A dataset definition change causes production refresh failures on Monday morning. The team needs to immediately restore the working version while investigating the root cause.

**How It Works:** Using Git history, the team identifies the last known-good commit on `main`. They revert the problematic commit using a Git revert (which creates a new commit undoing the change), then sync the production workspace. The failed change remains in history for investigation on a feature branch.

**What You Get:** Production restored in under 5 minutes. The revert commit clearly documents what was undone and why. Investigation continues safely on a separate branch without production pressure.

---

### Use Case 3: Governed Promotion Pipeline

**The Scenario:** A financial services team requires auditable change management for all production analytics. Every change must be reviewed, approved, and traceable for compliance.

**How It Works:** Git integration provides the audit trail natively. Branch policies enforce PR reviews, and the pipeline YAML validates item definitions before merge. The Git log serves as the complete change ledger — who changed what, when, with review approval recorded on each PR.

**What You Get:** Full audit trail satisfying SOX/SOC compliance requirements. Change history is immutable and independently verifiable. Review approvals are permanently recorded as part of the Git merge metadata.

---

## What You Can Do Today

### In 15 Minutes

- [ ] Create a Git repository in Azure DevOps or GitHub for your team's Fabric content
- [ ] Connect one non-production workspace to the `main` branch
- [ ] Make a small change to any item and commit it — verify the commit appears in the repo

### In 1 Hour

- [ ] Set up the environment branch structure (`main` + `test`)
- [ ] Create a development workspace connected to a `test` or `feature` branch
- [ ] Practice the full cycle: modify → commit → pull request → merge → sync production workspace
- [ ] Establish commit message conventions with the team

### In 2–4 Hours

- [ ] Document workspace-branch mappings for all team environments
- [ ] Configure branch policies (required reviewers, build validation)
- [ ] Set up the CI validation pipeline (JSON validation, security checks)
- [ ] Create a CODEOWNERS file mapping items to responsible team members
- [ ] Train the team on conflict resolution procedures

---

## 📚 References

### Official Documentation

[^1]: **[Introduction to Git integration in Microsoft Fabric](https://learn.microsoft.com/en-us/fabric/cicd/git-integration/intro-to-git-integration)** — Core concepts, setup, supported items, and sync operations

[^2]: **[GitHub Git Guides](https://github.com/git-guides)** — Comprehensive Git fundamentals including repositories, commits, branches, merging, and pull requests

### Related Resources

[^3]: **[Microsoft Fabric CI/CD Documentation](https://learn.microsoft.com/en-us/fabric/cicd/)** — Broader CI/CD capabilities including deployment pipelines

[^4]: **[Git Branch Strategy for Fabric](https://learn.microsoft.com/en-us/fabric/cicd/git-integration/manage-branches)** — Managing branches in Fabric Git integration

[^5]: **[Azure DevOps Branch Policies](https://learn.microsoft.com/en-us/azure/devops/repos/git/branch-policies)** — Configuring PR requirements and build validation

---

## 🎭 Behind the Scenes

### Item Serialization Deep Dive

When Fabric serializes a workspace item for Git, it breaks the item into multiple files within a directory structure. For example, a report might serialize as:

```
MyReport/
├── .platform           ← item metadata (type, display name)
├── definition.pbir     ← report definition reference
└── report.json         ← visual layout, filters, interactions
```

This structure enables meaningful diffs: a change to a single visual only modifies `report.json`, and the diff shows exactly which visual properties changed. Semantic models serialize using TMDL (Tabular Model Definition Language), which is purpose-built for readable diffs of data model changes.

**Why This Matters:** Understanding the serialization format helps teams write better CODEOWNERS rules (assign ownership at the item-type or item level), set up targeted CI validation (validate only changed item types), and debug merge conflicts (know which file to look at for a specific type of change).

### The Workspace Sync Algorithm

When syncing from a branch to a workspace, Fabric performs:

1. **Comparison** — Determines which items have changed in the branch since last sync
2. **Validation** — Checks that incoming changes are compatible with current workspace state
3. **Deserialization** — Converts file content back into live workspace items
4. **Dependency resolution** — Ensures items are updated in correct order (datasets before reports that depend on them)

If any step fails, the sync is rolled back entirely — partial syncs don't occur. This transactional behavior ensures workspace consistency.
