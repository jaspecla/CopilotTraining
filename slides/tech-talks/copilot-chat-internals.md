---
theme: default
class: text-center
highlighter: shiki
lineNumbers: false
info: |
  ## Copilot Chat Internals: Debugging AI Interactions
  CopilotTraining Tech Talk
drawings:
  persist: false
transition: slide-left
title: Copilot Chat Internals
module: tech-talks/copilot-chat-internals
mdc: true
status: active
updated: 2026-03-05
---

<div class="h-full flex flex-col items-center justify-center relative overflow-hidden">
  <!-- Gradient background -->
  <div class="absolute inset-0 bg-gradient-to-br from-blue-900/20 via-cyan-900/10 to-purple-900/20"></div>

  <!-- Glowing orb -->
  <div class="absolute top-1/4 left-1/2 -translate-x-1/2 -translate-y-1/2 w-96 h-96 bg-gradient-to-r from-blue-500/20 via-cyan-500/20 to-purple-500/20 rounded-full blur-3xl"></div>

  <!-- Logo with glow -->
  <div class="relative z-10">
    <div class="absolute inset-0 blur-2xl opacity-50">
      <img src="./sdp-logo.png" class="w-64" alt="" />
    </div>
    <img src="./sdp-logo.png" class="w-64 relative" alt="SDP Logo" />
  </div>

  <!-- Gradient text title -->
  <h1 class="!text-5xl !font-bold !mt-8 bg-gradient-to-r from-blue-400 via-cyan-400 to-purple-400 bg-clip-text text-transparent relative z-10">
    Copilot Chat Internals
  </h1>

  <!-- Pill subtitle -->
  <div class="mt-4 relative z-10">
    <span class="px-6 py-2 bg-gradient-to-r from-blue-600/80 to-cyan-600/80 rounded-full text-white text-xl font-medium shadow-lg shadow-blue-500/25">
      Debugging AI Interactions
    </span>
  </div>

  <!-- Tagline -->
  <div class="mt-8 text-lg opacity-70 relative z-10">
    ⏰ <strong>40 minutes</strong> • Developers • DevOps • Technical Leads
  </div>

  <!-- Decorative line -->
  <div class="mt-6 w-32 h-1 bg-gradient-to-r from-transparent via-cyan-400 to-transparent rounded-full relative z-10"></div>
</div>

<div class="abs-br m-6 flex gap-2">
  <span class="text-sm opacity-50">Tech Talk · chat-internals</span>
</div>

---
layout: center
---

<div class="text-center mb-6">
  <div class="text-5xl mb-4">🤔</div>
  <h1 class="!text-4xl bg-gradient-to-r from-blue-400 to-cyan-400 bg-clip-text text-transparent">The Central Question</h1>
</div>

<div class="p-8 bg-gradient-to-r from-blue-500/10 via-cyan-500/10 to-purple-500/10 rounded-2xl border border-cyan-500/30 max-w-3xl mx-auto text-center">
  <div class="text-2xl font-bold text-white leading-relaxed">
    "Why didn't Copilot do what I expected—<br/>
    and how do I systematically debug AI interactions?"
  </div>
</div>

<div class="mt-8 flex gap-6 justify-center text-sm">
  <div class="px-4 py-2 bg-blue-900/40 rounded-lg border border-blue-500/50 text-center">
    <div class="font-bold text-blue-300">🔍 Inspect</div>
    <div class="text-xs opacity-80 mt-1">See what was sent</div>
  </div>
  <div class="px-4 py-2 bg-cyan-900/40 rounded-lg border border-cyan-500/50 text-center">
    <div class="font-bold text-cyan-300">🧠 Understand</div>
    <div class="text-xs opacity-80 mt-1">Read model reasoning</div>
  </div>
  <div class="px-4 py-2 bg-purple-900/40 rounded-lg border border-purple-500/50 text-center">
    <div class="font-bold text-purple-300">🛠️ Fix</div>
    <div class="text-xs opacity-80 mt-1">Systematic solutions</div>
  </div>
</div>

---
layout: center
---

<div class="text-2xl font-bold mb-4">📖 Table of Contents</div>

<div class="grid grid-cols-3 gap-3">
  <div @click="$nav.go(8)" class="cursor-pointer p-3 bg-gradient-to-br from-blue-500/10 to-cyan-500/10 rounded-lg border border-blue-500/20 hover:border-blue-500/50 hover:shadow-lg hover:shadow-blue-500/10 transition-all">
    <div class="text-2xl mb-1">🎯</div>
    <div class="text-sm font-semibold text-blue-300">Agent Debug Panel</div>
    <div class="text-xs opacity-70">Real-time event stream</div>
  </div>

  <div @click="$nav.go(11)" class="cursor-pointer p-3 bg-gradient-to-br from-cyan-500/10 to-teal-500/10 rounded-lg border border-cyan-500/20 hover:border-cyan-500/50 hover:shadow-lg hover:shadow-cyan-500/10 transition-all">
    <div class="text-2xl mb-1">🔎</div>
    <div class="text-sm font-semibold text-cyan-300">Chat Debug View</div>
    <div class="text-xs opacity-70">Request inspection</div>
  </div>

  <div @click="$nav.go(14)" class="cursor-pointer p-3 bg-gradient-to-br from-purple-500/10 to-pink-500/10 rounded-lg border border-purple-500/20 hover:border-purple-500/50 hover:shadow-lg hover:shadow-purple-500/10 transition-all">
    <div class="text-2xl mb-1">🧠</div>
    <div class="text-sm font-semibold text-purple-300">Thinking Tokens</div>
    <div class="text-xs opacity-70">Model reasoning</div>
  </div>

  <div @click="$nav.go(16)" class="cursor-pointer p-3 bg-gradient-to-br from-emerald-500/10 to-teal-500/10 rounded-lg border border-emerald-500/20 hover:border-emerald-500/50 hover:shadow-lg hover:shadow-emerald-500/10 transition-all">
    <div class="text-2xl mb-1">📊</div>
    <div class="text-sm font-semibold text-emerald-300">Context Management</div>
    <div class="text-xs opacity-70">Window control</div>
  </div>

  <div @click="$nav.go(18)" class="cursor-pointer p-3 bg-gradient-to-br from-orange-500/10 to-amber-500/10 rounded-lg border border-orange-500/20 hover:border-orange-500/50 hover:shadow-lg hover:shadow-orange-500/10 transition-all">
    <div class="text-2xl mb-1">⚙️</div>
    <div class="text-sm font-semibold text-orange-300">Diagnostics View</div>
    <div class="text-xs opacity-70">Config validation</div>
  </div>

  <div @click="$nav.go(20)" class="cursor-pointer p-3 bg-gradient-to-br from-red-500/10 to-pink-500/10 rounded-lg border border-red-500/20 hover:border-red-500/50 hover:shadow-lg hover:shadow-red-500/10 transition-all">
    <div class="text-2xl mb-1">🔧</div>
    <div class="text-sm font-semibold text-red-300">Troubleshooting</div>
    <div class="text-xs opacity-70">Systematic patterns</div>
  </div>
</div>

---
layout: center
---

<div class="text-center mb-6">
  <div class="text-5xl mb-4">⚠️</div>
  <h1 class="!text-4xl bg-gradient-to-r from-red-400 to-orange-400 bg-clip-text text-transparent">The Opportunity</h1>
  <p class="text-xl opacity-80 mt-2">Turn AI black boxes into inspectable systems</p>
</div>

<div class="grid grid-cols-2 gap-4">
  <div class="p-4 bg-gradient-to-br from-red-500/15 to-orange-500/15 rounded-lg border border-red-500/30">
    <div class="flex items-center gap-2 mb-2">
      <span class="text-2xl">🔒</span>
      <span class="font-bold text-red-300">Black Box Frustration</span>
    </div>
    <div class="text-sm opacity-80">No visibility into what the model actually received</div>
  </div>

  <div class="p-4 bg-gradient-to-br from-orange-500/15 to-amber-500/15 rounded-lg border border-orange-500/30">
    <div class="flex items-center gap-2 mb-2">
      <span class="text-2xl">❓</span>
      <span class="font-bold text-orange-300">Context Mystery</span>
    </div>
    <div class="text-sm opacity-80">Which files were sent? Were instructions loaded?</div>
  </div>

  <div class="p-4 bg-gradient-to-br from-amber-500/15 to-yellow-500/15 rounded-lg border border-yellow-500/30">
    <div class="flex items-center gap-2 mb-2">
      <span class="text-2xl">🔁</span>
      <span class="font-bold text-yellow-300">Trial-and-Error</span>
    </div>
    <div class="text-sm opacity-80">20-40 minutes wasted per failed interaction</div>
  </div>

  <div class="p-4 bg-gradient-to-br from-purple-500/15 to-pink-500/15 rounded-lg border border-purple-500/30">
    <div class="flex items-center gap-2 mb-2">
      <span class="text-2xl">⚙️</span>
      <span class="font-bold text-purple-300">Config Uncertainty</span>
    </div>
    <div class="text-sm opacity-80">Are agents, instructions, and skills being applied?</div>
  </div>
</div>

---
layout: center
---

<div class="text-center mb-6">
  <div class="text-5xl mb-4">🔧</div>
  <h1 class="!text-4xl bg-gradient-to-r from-emerald-400 to-teal-400 bg-clip-text text-transparent">The Solution</h1>
  <p class="text-xl opacity-80 mt-2">Five Diagnostic Systems</p>
</div>

<div class="flex justify-center items-center gap-3">
  <div class="p-4 bg-gradient-to-br from-blue-500/20 to-cyan-500/20 rounded-xl border border-blue-500/40 text-center w-36 hover:scale-105 transition-transform">
    <div class="text-3xl mb-2">🎯</div>
    <div class="text-sm font-bold text-blue-300">Agent Debug</div>
    <div class="mt-2 text-xs bg-blue-500/20 px-2 py-1 rounded">v1.110</div>
  </div>

  <div class="text-2xl text-cyan-400/60">→</div>

  <div class="p-4 bg-gradient-to-br from-cyan-500/20 to-teal-500/20 rounded-xl border border-cyan-500/40 text-center w-36 hover:scale-105 transition-transform">
    <div class="text-3xl mb-2">🔎</div>
    <div class="text-sm font-bold text-cyan-300">Chat Debug</div>
    <div class="mt-2 text-xs bg-cyan-500/20 px-2 py-1 rounded">Inspect</div>
  </div>

  <div class="text-2xl text-teal-400/60">→</div>

  <div class="p-4 bg-gradient-to-br from-purple-500/20 to-pink-500/20 rounded-xl border border-purple-500/40 text-center w-36 hover:scale-105 transition-transform">
    <div class="text-3xl mb-2">🧠</div>
    <div class="text-sm font-bold text-purple-300">Thinking</div>
    <div class="mt-2 text-xs bg-purple-500/20 px-2 py-1 rounded">Reason</div>
  </div>

  <div class="text-2xl text-pink-400/60">→</div>

  <div class="p-4 bg-gradient-to-br from-emerald-500/20 to-teal-500/20 rounded-xl border border-emerald-500/40 text-center w-36 hover:scale-105 transition-transform">
    <div class="text-3xl mb-2">📊</div>
    <div class="text-sm font-bold text-emerald-300">Context</div>
    <div class="mt-2 text-xs bg-emerald-500/20 px-2 py-1 rounded">v1.110</div>
  </div>

  <div class="text-2xl text-teal-400/60">→</div>

  <div class="p-4 bg-gradient-to-br from-orange-500/20 to-amber-500/20 rounded-xl border border-orange-500/40 text-center w-36 hover:scale-105 transition-transform">
    <div class="text-3xl mb-2">⚙️</div>
    <div class="text-sm font-bold text-orange-300">Diagnostics</div>
    <div class="mt-2 text-xs bg-orange-500/20 px-2 py-1 rounded">Config</div>
  </div>
</div>

<div class="mt-6 p-4 bg-gradient-to-r from-emerald-500/10 via-teal-500/10 to-cyan-500/10 rounded-lg border border-teal-500/20 text-center max-w-2xl mx-auto">
  <span class="text-teal-300 font-semibold">💡 Core Insight:</span>
  <span class="opacity-80">Transform debugging from guesswork into systematic investigation</span>
</div>

---

# 🧠 Mental Model Shift

<div class="grid grid-cols-2 gap-6 mt-4">

<div class="p-5 bg-gradient-to-br from-emerald-500/10 to-teal-500/10 rounded-lg border border-emerald-500/30">
  <div class="flex items-center gap-2 mb-4">
    <span class="text-2xl">✅</span>
    <span class="text-lg font-bold text-emerald-300">Move Toward</span>
  </div>
  <div class="space-y-2 text-sm">
    <div class="flex items-center gap-2"><span class="text-emerald-400">✓</span> Agent Debug Panel First during dev</div>
    <div class="flex items-center gap-2"><span class="text-emerald-400">✓</span> Debug-View-First Development</div>
    <div class="flex items-center gap-2"><span class="text-emerald-400">✓</span> Thinking Token Analysis</div>
    <div class="flex items-center gap-2"><span class="text-emerald-400">✓</span> Proactive Context Management</div>
    <div class="flex items-center gap-2"><span class="text-emerald-400">✓</span> Evidence-Based Refinement</div>
  </div>
</div>

<div class="p-5 bg-gradient-to-br from-red-500/10 to-pink-500/10 rounded-lg border border-red-500/30">
  <div class="flex items-center gap-2 mb-4">
    <span class="text-2xl">🛑</span>
    <span class="text-lg font-bold text-red-300">Move Against</span>
  </div>
  <div class="space-y-2 text-sm">
    <div class="flex items-center gap-2"><span class="text-red-400">✗</span> Blind Prompt Iteration</div>
    <div class="flex items-center gap-2"><span class="text-red-400">✗</span> Assuming Instructions Loaded</div>
    <div class="flex items-center gap-2"><span class="text-red-400">✗</span> Reloading Windows First</div>
    <div class="flex items-center gap-2"><span class="text-red-400">✗</span> Black Box Acceptance</div>
    <div class="flex items-center gap-2"><span class="text-red-400">✗</span> Ignoring Context Indicator</div>
  </div>
</div>

</div>

---
layout: center
name: agentdebugpanel
---

<div class="text-center mb-6">
  <div class="text-5xl mb-4">🎯</div>
  <h1 class="!text-4xl bg-gradient-to-r from-blue-400 to-cyan-400 bg-clip-text text-transparent">Agent Debug Panel</h1>
  <p class="text-xl opacity-80 mt-2">Real-Time Event Stream</p>
</div>

<div class="p-5 bg-gradient-to-r from-blue-500/10 to-cyan-500/10 rounded-xl border border-blue-500/30 mb-5 text-center max-w-3xl mx-auto">
  <div class="text-lg">Watch every chat event as it happens—your live dashboard for AI interactions</div>
</div>

<div class="flex justify-center gap-6">
  <div class="p-4 bg-blue-900/30 rounded-lg border border-blue-500/40 text-center w-48">
    <div class="text-3xl mb-2">💬</div>
    <div class="font-bold text-blue-300">Chat Events</div>
    <div class="text-xs opacity-70 mt-1">Messages, responses</div>
  </div>

  <div class="p-4 bg-cyan-900/30 rounded-lg border border-cyan-500/40 text-center w-48">
    <div class="text-3xl mb-2">🔧</div>
    <div class="font-bold text-cyan-300">Tool Invocations</div>
    <div class="text-xs opacity-70 mt-1">Live timing info</div>
  </div>

  <div class="p-4 bg-purple-900/30 rounded-lg border border-purple-500/40 text-center w-48">
    <div class="text-3xl mb-2">📋</div>
    <div class="font-bold text-purple-300">Customizations</div>
    <div class="text-xs opacity-70 mt-1">Load status</div>
  </div>
</div>

<div class="mt-6 text-center text-sm opacity-60">
  New in VS Code 1.110
</div>

---

# 🎯 Agent Debug Panel: What It Shows

<div class="grid grid-cols-2 gap-6">

<div>

<div class="text-lg font-semibold bg-gradient-to-r from-blue-400 to-cyan-400 bg-clip-text text-transparent mb-4">Real-Time Event Stream</div>

<div class="space-y-3">

<div class="p-3 bg-gradient-to-br from-blue-900/40 to-blue-800/30 rounded-lg border border-blue-500/30 hover:border-blue-400 hover:scale-105 transition-all duration-300">
<div class="font-semibold text-blue-300">💬 Chat Events</div>
<div class="text-xs opacity-80">Every message, tool call, response</div>
</div>

<div class="p-3 bg-gradient-to-br from-purple-900/40 to-purple-800/30 rounded-lg border border-purple-500/30 hover:border-purple-400 hover:scale-105 transition-all duration-300">
<div class="font-semibold text-purple-300">🔧 Tool Invocations</div>
<div class="text-xs opacity-80">Live view with timing</div>
</div>

<div class="p-3 bg-gradient-to-br from-green-900/40 to-green-800/30 rounded-lg border border-green-500/30 hover:border-green-400 hover:scale-105 transition-all duration-300">
<div class="font-semibold text-green-300">📋 Customization Loading</div>
<div class="text-xs opacity-80">Which files were loaded</div>
</div>

<div class="p-3 bg-gradient-to-br from-orange-900/40 to-orange-800/30 rounded-lg border border-orange-500/30 hover:border-orange-400 hover:scale-105 transition-all duration-300">
<div class="font-semibold text-orange-300">✨ Model Responses</div>
<div class="text-xs opacity-80">Raw responses before formatting</div>
</div>

</div>

</div>

<div>

<div class="text-lg font-semibold bg-gradient-to-r from-cyan-400 to-blue-400 bg-clip-text text-transparent mb-4">How to Open</div>

<div class="p-4 bg-gradient-to-br from-cyan-900/30 to-blue-900/30 rounded-xl border border-cyan-500/30 mb-4">
<div class="font-semibold text-cyan-300 mb-2">Command Palette:</div>
<code class="text-sm bg-gray-800/50 px-2 py-1 rounded">Developer: Open Agent Debug Panel</code>
</div>

<div class="p-4 bg-gradient-to-br from-blue-900/30 to-indigo-900/30 rounded-xl border border-blue-500/30 mb-4">
<div class="font-semibold text-blue-300 mb-2">Chat View:</div>
<div class="text-sm">Click gear icon (⚙️) → <span class="text-blue-300 font-semibold">View Agent Logs</span></div>
</div>

<div class="text-lg font-semibold bg-gradient-to-r from-indigo-400 to-purple-400 bg-clip-text text-transparent mb-3 mt-4">Chart View</div>

<div class="flex gap-2 text-xs">
<span class="px-2 py-1 bg-indigo-900/40 rounded border border-indigo-500/30">Tool chains</span>
<span class="px-2 py-1 bg-purple-900/40 rounded border border-purple-500/30">Timing</span>
<span class="px-2 py-1 bg-pink-900/40 rounded border border-pink-500/30">Handoffs</span>
</div>

</div>

</div>

---

# 🎯 Loaded Customizations Inspector

<div class="text-center mb-6">
<div class="text-lg bg-gradient-to-r from-blue-400 to-indigo-400 bg-clip-text text-transparent font-semibold">Answers critical questions instantly</div>
</div>

<div class="grid grid-cols-3 gap-4 mb-6">

<div class="p-4 bg-gradient-to-br from-emerald-900/40 to-green-900/30 rounded-xl border-2 border-emerald-500/40 text-center hover:scale-105 transition-all duration-300 shadow-lg shadow-emerald-500/10">
<div class="text-3xl mb-2">✅</div>
<div class="font-bold text-emerald-300">Loaded</div>
<div class="text-xs opacity-80 mt-1">File active and working</div>
</div>

<div class="p-4 bg-gradient-to-br from-amber-900/40 to-yellow-900/30 rounded-xl border-2 border-amber-500/40 text-center hover:scale-105 transition-all duration-300 shadow-lg shadow-amber-500/10">
<div class="text-3xl mb-2">⚠️</div>
<div class="font-bold text-amber-300">Warning</div>
<div class="text-xs opacity-80 mt-1">May have issues</div>
</div>

<div class="p-4 bg-gradient-to-br from-red-900/40 to-rose-900/30 rounded-xl border-2 border-red-500/40 text-center hover:scale-105 transition-all duration-300 shadow-lg shadow-red-500/10">
<div class="text-3xl mb-2">❌</div>
<div class="font-bold text-red-300">Failed</div>
<div class="text-xs opacity-80 mt-1">Fix syntax error</div>
</div>

</div>

<div class="p-4 bg-gradient-to-r from-blue-900/30 to-indigo-900/30 rounded-xl border border-blue-500/30">
<div class="font-semibold text-blue-300 mb-2">What You See:</div>
<div class="grid grid-cols-2 gap-2 text-sm">
<div class="flex items-center gap-2"><span class="text-cyan-400">→</span> Was my instruction file loaded?</div>
<div class="flex items-center gap-2"><span class="text-cyan-400">→</span> Why isn't my skill appearing?</div>
<div class="flex items-center gap-2"><span class="text-cyan-400">→</span> Which agent is active?</div>
<div class="flex items-center gap-2"><span class="text-cyan-400">→</span> Application scope for each file</div>
</div>
</div>

---
layout: center
name: chatdebugview
---

<div class="text-center mb-6">
<div class="text-5xl mb-4">🔎</div>
<h1 class="!text-4xl bg-gradient-to-r from-purple-400 to-pink-400 bg-clip-text text-transparent">Chat Debug View</h1>
<p class="text-xl opacity-80 mt-2">Complete Request Inspection</p>
</div>

<div class="p-5 bg-gradient-to-r from-purple-500/10 to-pink-500/10 rounded-xl border border-purple-500/30 mb-5 text-center max-w-3xl mx-auto">
<div class="text-lg">See exactly what every AI request sends and receives</div>
</div>

<div class="flex justify-center gap-6">
<div class="p-4 bg-purple-900/30 rounded-lg border border-purple-500/40 text-center w-40 hover:scale-105 transition-all duration-300">
<div class="text-2xl mb-1">📝</div>
<div class="font-bold text-purple-300 text-sm">System Prompt</div>
</div>
<div class="text-2xl text-gray-500 self-center">→</div>
<div class="p-4 bg-pink-900/30 rounded-lg border border-pink-500/40 text-center w-40 hover:scale-105 transition-all duration-300">
<div class="text-2xl mb-1">💬</div>
<div class="font-bold text-pink-300 text-sm">User Request</div>
</div>
<div class="text-2xl text-gray-500 self-center">→</div>
<div class="p-4 bg-fuchsia-900/30 rounded-lg border border-fuchsia-500/40 text-center w-40 hover:scale-105 transition-all duration-300">
<div class="text-2xl mb-1">✨</div>
<div class="font-bold text-fuchsia-300 text-sm">Response</div>
</div>
</div>

<div class="mt-6 text-center text-sm opacity-60">No black boxes—inspect the full pipeline</div>

---

# 🔎 Chat Debug View: Components

<div class="grid grid-cols-2 gap-4">

<div class="space-y-3 text-sm">

<div class="p-3 bg-blue-400/10 rounded">
  <div class="font-semibold">📝 System Prompt</div>
  <div class="text-xs opacity-80">Base instructions for AI behavior</div>
</div>

<div class="p-3 bg-green-400/10 rounded">
  <div class="font-semibold">💬 User Prompt</div>
  <div class="text-xs opacity-80">Your actual request as sent</div>
</div>

<div class="p-3 bg-purple-400/10 rounded">
  <div class="font-semibold">📁 Context</div>
  <div class="text-xs opacity-80">Files, instructions, other context</div>
</div>

</div>

<div class="space-y-3 text-sm">

<div class="p-3 bg-orange-400/10 rounded">
  <div class="font-semibold">🔧 Tool Invocations</div>
  <div class="text-xs opacity-80">Tools called and their responses</div>
</div>

<div class="p-3 bg-cyan-400/10 rounded">
  <div class="font-semibold">✨ Model Response</div>
  <div class="text-xs opacity-80">Full response from language model</div>
</div>

</div>

</div>

<div class="mt-6 p-4 bg-yellow-400/10 rounded border-l-4 border-yellow-400">
  <div class="text-sm">
    <strong>How to Open:</strong> Command Palette → <code>Developer: Show Chat Debug View</code>
  </div>
</div>

---

# 🔎 The Request Pipeline

<div class="text-sm mb-4">What happens when you send a chat message</div>

<div class="flex items-center justify-center gap-4 text-xs mb-6">

<div class="p-3 bg-blue-400/10 rounded text-center flex-1">
  <div class="text-xl mb-1">1️⃣</div>
  <div class="font-semibold">Prompt</div>
</div>

<div class="text-2xl">→</div>

<div class="p-3 bg-purple-400/10 rounded text-center flex-1">
  <div class="text-xl mb-1">2️⃣</div>
  <div class="font-semibold">Context Assembly</div>
</div>

<div class="text-2xl">→</div>

<div class="p-3 bg-pink-400/10 rounded text-center flex-1">
  <div class="text-xl mb-1">3️⃣</div>
  <div class="font-semibold">System Prompt</div>
</div>

<div class="text-2xl">→</div>

<div class="p-3 bg-green-400/10 rounded text-center flex-1">
  <div class="text-xl mb-1">4️⃣</div>
  <div class="font-semibold">Model Inference</div>
</div>

<div class="text-2xl">→</div>

<div class="p-3 bg-orange-400/10 rounded text-center flex-1">
  <div class="text-xl mb-1">5️⃣</div>
  <div class="font-semibold">Response</div>
</div>

</div>

<div class="p-4 bg-blue-400/10 rounded">
  <div class="text-sm">
    <strong>Assembly Includes:</strong> Active files + #file refs + @workspace + instructions + agent defs + tools
  </div>
</div>

---
layout: center
name: thinkingtoken
---

<div class="text-center mb-6">
<div class="text-5xl mb-4">🧠</div>
<h1 class="!text-4xl bg-gradient-to-r from-pink-400 to-purple-400 bg-clip-text text-transparent">Thinking Tokens</h1>
<p class="text-xl opacity-80 mt-2">See the Model Reason</p>
</div>

<div class="p-5 bg-gradient-to-r from-pink-500/10 to-purple-500/10 rounded-xl border border-pink-500/30 mb-5 text-center max-w-3xl mx-auto">
<div class="text-lg">Watch the model's reasoning process as it generates responses</div>
</div>

<div class="flex justify-center gap-6">
<div class="p-4 bg-pink-900/30 rounded-lg border border-pink-500/40 text-center w-44 hover:scale-105 transition-all duration-300">
<div class="text-2xl mb-1">🎯</div>
<div class="font-bold text-pink-300 text-sm">Problem Decomposition</div>
</div>
<div class="p-4 bg-purple-900/30 rounded-lg border border-purple-500/40 text-center w-44 hover:scale-105 transition-all duration-300">
<div class="text-2xl mb-1">🔧</div>
<div class="font-bold text-purple-300 text-sm">Tool Selection</div>
</div>
<div class="p-4 bg-violet-900/30 rounded-lg border border-violet-500/40 text-center w-44 hover:scale-105 transition-all duration-300">
<div class="text-2xl mb-1">📊</div>
<div class="font-bold text-violet-300 text-sm">Context Evaluation</div>
</div>
</div>

<div class="mt-6 text-center text-sm opacity-60">VS Code 1.109+ • Claude, o-series models</div>

---

# 🧠 Thinking Tokens: Configuration

<div class="grid grid-cols-2 gap-6">

<div>

<div class="text-lg font-semibold bg-gradient-to-r from-pink-400 to-purple-400 bg-clip-text text-transparent mb-4">What Are Thinking Tokens?</div>

<div class="p-4 bg-gradient-to-br from-pink-900/30 to-purple-900/30 rounded-xl border border-pink-500/30 mb-4">
<div class="text-sm">Internal reasoning steps models produce before generating a response.</div>
</div>

<div class="space-y-2">
<div class="p-2 bg-pink-900/30 rounded-lg border border-pink-500/30 text-sm flex items-center gap-2 hover:scale-105 transition-all duration-300">
<span class="text-pink-400">→</span> Problem decomposition
</div>
<div class="p-2 bg-purple-900/30 rounded-lg border border-purple-500/30 text-sm flex items-center gap-2 hover:scale-105 transition-all duration-300">
<span class="text-purple-400">→</span> Tool selection reasoning
</div>
<div class="p-2 bg-violet-900/30 rounded-lg border border-violet-500/30 text-sm flex items-center gap-2 hover:scale-105 transition-all duration-300">
<span class="text-violet-400">→</span> Context evaluation
</div>
<div class="p-2 bg-fuchsia-900/30 rounded-lg border border-fuchsia-500/30 text-sm flex items-center gap-2 hover:scale-105 transition-all duration-300">
<span class="text-fuchsia-400">→</span> Uncertainty signals
</div>
</div>

</div>

<div>

<div class="text-lg font-semibold bg-gradient-to-r from-purple-400 to-violet-400 bg-clip-text text-transparent mb-4">Enable Thinking Display</div>

<div class="p-3 bg-gradient-to-r from-purple-900/40 to-violet-900/40 rounded-lg border border-purple-500/30 mb-4">
<code class="text-sm text-purple-300">chat.renderThinking</code>
</div>

<div class="space-y-3">

<div class="p-3 bg-gradient-to-br from-blue-900/40 to-blue-800/30 rounded-lg border-2 border-blue-500/40 hover:scale-105 transition-all duration-300">
<div class="font-bold text-blue-300">"collapsed"</div>
<div class="text-xs opacity-80 mt-1">Shown collapsed, expand on demand (default)</div>
</div>

<div class="p-3 bg-gradient-to-br from-emerald-900/40 to-emerald-800/30 rounded-lg border-2 border-emerald-500/40 hover:scale-105 transition-all duration-300">
<div class="font-bold text-emerald-300">"expanded"</div>
<div class="text-xs opacity-80 mt-1">Shown expanded automatically</div>
</div>

<div class="p-3 bg-gradient-to-br from-gray-800/60 to-gray-700/40 rounded-lg border-2 border-gray-500/40 hover:scale-105 transition-all duration-300">
<div class="font-bold text-gray-300">"hidden"</div>
<div class="text-xs opacity-80 mt-1">Not displayed at all</div>
</div>

</div>

</div>

</div>

---
layout: center
name: contextmanagement
---

<div class="text-center mb-6">
<div class="text-5xl mb-4">📊</div>
<h1 class="!text-4xl bg-gradient-to-r from-green-400 to-emerald-400 bg-clip-text text-transparent">Context Management</h1>
<p class="text-xl opacity-80 mt-2">Window Control & Compaction</p>
</div>

<div class="p-5 bg-gradient-to-r from-green-500/10 to-emerald-500/10 rounded-xl border border-green-500/30 mb-5 text-center max-w-3xl mx-auto">
<div class="text-lg">Monitor, compact, and branch your conversation context</div>
</div>

<div class="flex justify-center gap-6">
<div class="p-4 bg-green-900/30 rounded-lg border border-green-500/40 text-center w-40 hover:scale-105 transition-all duration-300">
<div class="text-2xl mb-1">📈</div>
<div class="font-bold text-green-300 text-sm">Monitor</div>
<div class="text-xs opacity-70">Usage indicator</div>
</div>
<div class="p-4 bg-emerald-900/30 rounded-lg border border-emerald-500/40 text-center w-40 hover:scale-105 transition-all duration-300">
<div class="text-2xl mb-1">📦</div>
<div class="font-bold text-emerald-300 text-sm">/compact</div>
<div class="text-xs opacity-70">Compress history</div>
</div>
<div class="p-4 bg-teal-900/30 rounded-lg border border-teal-500/40 text-center w-40 hover:scale-105 transition-all duration-300">
<div class="text-2xl mb-1">🔀</div>
<div class="font-bold text-teal-300 text-sm">/fork</div>
<div class="text-xs opacity-70">Branch context</div>
</div>
</div>

<div class="mt-6 text-center text-sm opacity-60">New in VS Code 1.110</div>

---

# 📊 Context Window Indicator

<div class="grid grid-cols-2 gap-6">

<div>

<div class="text-lg font-semibold bg-gradient-to-r from-green-400 to-emerald-400 bg-clip-text text-transparent mb-3">What It Shows</div>

<div class="p-3 bg-gradient-to-br from-green-900/30 to-emerald-900/30 rounded-xl border border-green-500/30 mb-4 text-sm">
<div class="space-y-1">
<div class="flex items-center gap-2"><span class="text-green-400">→</span> Percentage usage indicator</div>
<div class="flex items-center gap-2"><span class="text-green-400">→</span> Token breakdown by category</div>
<div class="flex items-center gap-2"><span class="text-green-400">→</span> Remaining capacity</div>
</div>
</div>

<div class="text-lg font-semibold bg-gradient-to-r from-emerald-400 to-teal-400 bg-clip-text text-transparent mb-3">Key Thresholds</div>

<div class="space-y-2">
<div class="p-2 bg-gradient-to-br from-emerald-900/40 to-green-900/30 rounded-lg border-2 border-emerald-500/40 text-sm hover:scale-105 transition-all duration-300">
<span class="font-bold text-emerald-300">&lt;60%</span> <span class="opacity-80">— Healthy</span>
</div>
<div class="p-2 bg-gradient-to-br from-amber-900/40 to-yellow-900/30 rounded-lg border-2 border-amber-500/40 text-sm hover:scale-105 transition-all duration-300">
<span class="font-bold text-amber-300">60-80%</span> <span class="opacity-80">— Monitor</span>
</div>
<div class="p-2 bg-gradient-to-br from-red-900/40 to-rose-900/30 rounded-lg border-2 border-red-500/40 text-sm hover:scale-105 transition-all duration-300">
<span class="font-bold text-red-300">&gt;80%</span> <span class="opacity-80">— Use /compact</span>
</div>
</div>

</div>

<div>

<div class="text-lg font-semibold bg-gradient-to-r from-blue-400 to-indigo-400 bg-clip-text text-transparent mb-3">Context Commands</div>

<div class="p-4 bg-gradient-to-br from-blue-900/40 to-blue-800/30 rounded-xl border-2 border-blue-500/40 mb-3 hover:scale-105 transition-all duration-300">
<div class="font-bold text-blue-300 text-lg mb-1">/compact</div>
<div class="text-sm opacity-90">Intelligently compresses history</div>
<div class="text-xs mt-2 text-emerald-400">✅ 95% → 42% typical reduction</div>
</div>

<div class="p-4 bg-gradient-to-br from-purple-900/40 to-purple-800/30 rounded-xl border-2 border-purple-500/40 hover:scale-105 transition-all duration-300">
<div class="font-bold text-purple-300 text-lg mb-1">/fork</div>
<div class="text-sm opacity-90">Creates independent branch</div>
<div class="text-xs mt-2 text-emerald-400">✅ Explore alternatives safely</div>
</div>

</div>

</div>

---
layout: center
name: diagnosticsview
---

<div class="text-center mb-6">
<div class="text-5xl mb-4">⚙️</div>
<h1 class="!text-4xl bg-gradient-to-r from-orange-400 to-yellow-400 bg-clip-text text-transparent">Diagnostics View</h1>
<p class="text-xl opacity-80 mt-2">Configuration Validation</p>
</div>

<div class="p-5 bg-gradient-to-r from-orange-500/10 to-yellow-500/10 rounded-xl border border-orange-500/30 mb-5 text-center max-w-3xl mx-auto">
<div class="text-lg">Verify custom agents, instructions, and skills are loading</div>
</div>

<div class="flex justify-center gap-6">
<div class="p-4 bg-orange-900/30 rounded-lg border border-orange-500/40 text-center w-44 hover:scale-105 transition-all duration-300">
<div class="text-2xl mb-1">📋</div>
<div class="font-bold text-orange-300 text-sm">File Status</div>
<div class="text-xs opacity-70">Loaded, failed, skipped</div>
</div>
<div class="p-4 bg-amber-900/30 rounded-lg border border-amber-500/40 text-center w-44 hover:scale-105 transition-all duration-300">
<div class="text-2xl mb-1">⚠️</div>
<div class="font-bold text-amber-300 text-sm">Error Messages</div>
<div class="text-xs opacity-70">Detailed diagnostics</div>
</div>
<div class="p-4 bg-yellow-900/30 rounded-lg border border-yellow-500/40 text-center w-44 hover:scale-105 transition-all duration-300">
<div class="text-2xl mb-1">📊</div>
<div class="font-bold text-yellow-300 text-sm">Load Order</div>
<div class="text-xs opacity-70">Priority sequence</div>
</div>
</div>

<div class="mt-6 text-center text-sm opacity-60">Catch config errors before they waste your time</div>

---

# ⚙️ Diagnostics View: What It Reveals

<div class="grid grid-cols-2 gap-6">

<div>

<div class="text-lg font-semibold bg-gradient-to-r from-orange-400 to-amber-400 bg-clip-text text-transparent mb-3">What You See</div>

<div class="space-y-2 mb-4">
<div class="p-2 bg-gradient-to-br from-orange-900/30 to-amber-900/30 rounded-lg border border-orange-500/30 text-sm flex items-center gap-2 hover:scale-105 transition-all duration-300">
<span class="text-orange-400">→</span> All active customization files
</div>
<div class="p-2 bg-gradient-to-br from-amber-900/30 to-yellow-900/30 rounded-lg border border-amber-500/30 text-sm flex items-center gap-2 hover:scale-105 transition-all duration-300">
<span class="text-amber-400">→</span> Load status (loaded, failed, skipped)
</div>
<div class="p-2 bg-gradient-to-br from-yellow-900/30 to-lime-900/30 rounded-lg border border-yellow-500/30 text-sm flex items-center gap-2 hover:scale-105 transition-all duration-300">
<span class="text-yellow-400">→</span> Error messages & application order
</div>
</div>

<div class="p-3 bg-gradient-to-r from-blue-900/40 to-indigo-900/40 rounded-xl border border-blue-500/30">
<div class="font-semibold text-blue-300 text-sm mb-1">How to Open</div>
<div class="text-sm">Right-click in Chat → <span class="text-blue-300 font-semibold">Diagnostics</span></div>
</div>

</div>

<div>

<div class="text-lg font-semibold bg-gradient-to-r from-red-400 to-orange-400 bg-clip-text text-transparent mb-3">Common Issues Caught</div>

<div class="space-y-2">

<div class="p-3 bg-gradient-to-br from-red-900/40 to-red-800/30 rounded-lg border-2 border-red-500/40 hover:scale-105 transition-all duration-300">
<div class="font-bold text-red-300">Agent not available</div>
<div class="text-xs opacity-80 mt-1">Syntax error → Check YAML frontmatter</div>
</div>

<div class="p-3 bg-gradient-to-br from-orange-900/40 to-orange-800/30 rounded-lg border-2 border-orange-500/40 hover:scale-105 transition-all duration-300">
<div class="font-bold text-orange-300">Instructions ignored</div>
<div class="text-xs opacity-80 mt-1">Wrong location → Move to .github/</div>
</div>

<div class="p-3 bg-gradient-to-br from-amber-900/40 to-amber-800/30 rounded-lg border-2 border-amber-500/40 hover:scale-105 transition-all duration-300">
<div class="font-bold text-amber-300">Skills not triggering</div>
<div class="text-xs opacity-80 mt-1">Pattern mismatch → Update applyTo</div>
</div>

</div>

</div>

</div>



---
layout: center
name: troubleshooting
---

<div class="text-center mb-6">
<div class="text-5xl mb-4">🔧</div>
<h1 class="!text-4xl bg-gradient-to-r from-red-400 to-pink-400 bg-clip-text text-transparent">Troubleshooting Patterns</h1>
<p class="text-xl opacity-80 mt-2">Systematic Debugging Workflows</p>
</div>

<div class="p-5 bg-gradient-to-r from-red-500/10 to-pink-500/10 rounded-xl border border-red-500/30 mb-5 text-center max-w-3xl mx-auto">
<div class="text-lg">Proven diagnostic workflows for common problems</div>
</div>

<div class="flex justify-center gap-6">
<div class="p-4 bg-red-900/30 rounded-lg border border-red-500/40 text-center w-44 hover:scale-105 transition-all duration-300">
<div class="text-2xl mb-1">📋</div>
<div class="font-bold text-red-300 text-sm">Instructions Ignored</div>
</div>
<div class="p-4 bg-pink-900/30 rounded-lg border border-pink-500/40 text-center w-44 hover:scale-105 transition-all duration-300">
<div class="text-2xl mb-1">📊</div>
<div class="font-bold text-pink-300 text-sm">Context Issues</div>
</div>
<div class="p-4 bg-rose-900/30 rounded-lg border border-rose-500/40 text-center w-44 hover:scale-105 transition-all duration-300">
<div class="text-2xl mb-1">🔌</div>
<div class="font-bold text-rose-300 text-sm">MCP Failures</div>
</div>
</div>

<div class="mt-6 text-center text-sm opacity-60">From symptoms to solutions in minutes</div>

---

# 🔧 Pattern 1: Instructions Ignored

<div class="space-y-4">

<div class="p-4 bg-red-400/10 rounded border-l-4 border-red-400">
  <div class="font-semibold mb-2">❌ Symptom</div>
  <div class="text-sm">Copilot violates your custom instructions</div>
</div>

<div class="p-4 bg-blue-400/10 rounded border-l-4 border-blue-400">
  <div class="font-semibold mb-2">🔍 Diagnostic Steps</div>
  <div class="text-sm space-y-1">
    1. Open <strong>Diagnostics</strong> (right-click in Chat)<br/>
    2. Verify instruction file is listed and loaded<br/>
    3. Open <strong>Chat Debug View</strong><br/>
    4. Check if instructions appear in context<br/>
    5. Look for "References" in response
  </div>
</div>

<div class="p-4 bg-green-400/10 rounded border-l-4 border-green-400">
  <div class="font-semibold mb-2">✅ Common Causes</div>
  <div class="text-sm">
    • File not in <code>.github/copilot-instructions.md</code><br/>
    • YAML frontmatter syntax error<br/>
    • Instructions truncated (context limit)
  </div>
</div>

</div>

---

# 🔧 Pattern 2: Context Issues

<div class="space-y-4">

<div class="p-4 bg-red-400/10 rounded border-l-4 border-red-400">
  <div class="font-semibold mb-2">❌ Symptom</div>
  <div class="text-sm">Generated code ignores critical files or patterns</div>
</div>

<div class="p-4 bg-blue-400/10 rounded border-l-4 border-blue-400">
  <div class="font-semibold mb-2">🔍 Diagnostic Steps</div>
  <div class="text-sm space-y-1">
    1. Check <strong>context window indicator</strong><br/>
    2. Open <strong>Chat Debug View</strong><br/>
    3. Expand context section<br/>
    4. Review which files were included
  </div>
</div>

<div class="p-4 bg-green-400/10 rounded border-l-4 border-green-400">
  <div class="font-semibold mb-2">✅ Solutions</div>
  <div class="text-sm">
    • Context &gt;80%? Use <code>/compact</code><br/>
    • Use explicit <code>#file</code> instead of <code>@workspace</code><br/>
    • Fork conversation to branch exploration
  </div>
</div>

</div>

---

# 🔧 Pattern 3: MCP Server Failures

<div class="space-y-4">

<div class="p-4 bg-red-400/10 rounded border-l-4 border-red-400">
  <div class="font-semibold mb-2">❌ Symptom</div>
  <div class="text-sm">Agent returns generic code without external tool results</div>
</div>

<div class="p-4 bg-blue-400/10 rounded border-l-4 border-blue-400">
  <div class="font-semibold mb-2">🔍 Diagnostic Steps</div>
  <div class="text-sm space-y-1">
    1. Command Palette → <strong>MCP: List Servers</strong><br/>
    2. Select the relevant server<br/>
    3. Click <strong>Show Output</strong><br/>
    4. Review logs for timeouts or errors
  </div>
</div>

<div class="p-4 bg-green-400/10 rounded border-l-4 border-green-400">
  <div class="font-semibold mb-2">✅ Common Fixes</div>
  <div class="text-sm">
    • Increase timeout in MCP config<br/>
    • Restart server via MCP interface<br/>
    • Check authentication/credentials
  </div>
</div>

</div>

---

# 📈 Real-World Impact

<div class="grid grid-cols-2 gap-4">

<div class="p-4 bg-gradient-to-br from-blue-900/40 to-indigo-900/30 rounded-xl border border-blue-500/30 hover:scale-105 transition-all duration-300">
<div class="font-bold text-blue-300 mb-2">📋 Instructions Not Loading</div>
<div class="flex justify-between text-sm mb-2">
<span class="text-red-400">Before: 45 min</span>
<span class="text-2xl text-gray-500">→</span>
<span class="text-emerald-400">After: 4 min</span>
</div>
<div class="p-2 bg-emerald-900/30 rounded text-xs text-emerald-300">
⏱️ <strong>41 minutes saved per error</strong>
</div>
</div>

<div class="p-4 bg-gradient-to-br from-purple-900/40 to-pink-900/30 rounded-xl border border-purple-500/30 hover:scale-105 transition-all duration-300">
<div class="font-bold text-purple-300 mb-2">📊 Context Window Full</div>
<div class="text-sm mb-2 opacity-80">Confused why module ignored → Debug View showed 95%</div>
<div class="p-2 bg-emerald-900/30 rounded text-xs text-emerald-300">
✅ <strong>80% reduction in missed context</strong>
</div>
</div>

<div class="p-4 bg-gradient-to-br from-orange-900/40 to-amber-900/30 rounded-xl border border-orange-500/30 hover:scale-105 transition-all duration-300">
<div class="font-bold text-orange-300 mb-2">🔌 MCP Timeout</div>
<div class="flex justify-between text-sm mb-2">
<span class="text-red-400">60% reliability</span>
<span class="text-2xl text-gray-500">→</span>
<span class="text-emerald-400">99% reliability</span>
</div>
<div class="p-2 bg-emerald-900/30 rounded text-xs text-emerald-300">
⏱️ <strong>1-1.5 hours saved daily</strong>
</div>
</div>

<div class="p-4 bg-gradient-to-br from-cyan-900/40 to-blue-900/30 rounded-xl border border-cyan-500/30 hover:scale-105 transition-all duration-300">
<div class="font-bold text-cyan-300 mb-2">🔧 v1.110 Workflow</div>
<div class="flex justify-between text-sm mb-2">
<span class="text-red-400">30+ min debug</span>
<span class="text-2xl text-gray-500">→</span>
<span class="text-emerald-400">15 min</span>
</div>
<div class="p-2 bg-emerald-900/30 rounded text-xs text-emerald-300">
✅ <strong>50% faster problem resolution</strong>
</div>
</div>

</div>

---

# ✅ What You Can Do Today

<div class="grid grid-cols-3 gap-4">

<div class="p-4 bg-gradient-to-br from-emerald-900/40 to-green-900/30 rounded-xl border-2 border-emerald-500/40">
<div class="text-lg font-bold bg-gradient-to-r from-emerald-400 to-green-400 bg-clip-text text-transparent mb-3">⚡ Immediate (5 min)</div>
<div class="space-y-2 text-sm">
<div class="p-2 bg-emerald-900/30 rounded flex items-center gap-2 hover:scale-105 transition-all duration-300">
<span class="text-emerald-400">□</span> Open Agent Debug Panel
</div>
<div class="p-2 bg-emerald-900/30 rounded flex items-center gap-2 hover:scale-105 transition-all duration-300">
<span class="text-emerald-400">□</span> Enable thinking display
</div>
<div class="p-2 bg-emerald-900/30 rounded flex items-center gap-2 hover:scale-105 transition-all duration-300">
<span class="text-emerald-400">□</span> Check Diagnostics
</div>
<div class="p-2 bg-emerald-900/30 rounded flex items-center gap-2 hover:scale-105 transition-all duration-300">
<span class="text-emerald-400">□</span> Try /compact
</div>
</div>
</div>

<div class="p-4 bg-gradient-to-br from-blue-900/40 to-indigo-900/30 rounded-xl border-2 border-blue-500/40">
<div class="text-lg font-bold bg-gradient-to-r from-blue-400 to-indigo-400 bg-clip-text text-transparent mb-3">🎯 Short-Term (30 min)</div>
<div class="space-y-2 text-sm">
<div class="p-2 bg-blue-900/30 rounded flex items-center gap-2 hover:scale-105 transition-all duration-300">
<span class="text-blue-400">□</span> Keep Debug Panel open
</div>
<div class="p-2 bg-blue-900/30 rounded flex items-center gap-2 hover:scale-105 transition-all duration-300">
<span class="text-blue-400">□</span> Monitor context indicator
</div>
<div class="p-2 bg-blue-900/30 rounded flex items-center gap-2 hover:scale-105 transition-all duration-300">
<span class="text-blue-400">□</span> Validate customizations
</div>
<div class="p-2 bg-blue-900/30 rounded flex items-center gap-2 hover:scale-105 transition-all duration-300">
<span class="text-blue-400">□</span> Practice /fork
</div>
</div>
</div>

<div class="p-4 bg-gradient-to-br from-purple-900/40 to-pink-900/30 rounded-xl border-2 border-purple-500/40">
<div class="text-lg font-bold bg-gradient-to-r from-purple-400 to-pink-400 bg-clip-text text-transparent mb-3">🚀 Advanced (1-2 hrs)</div>
<div class="space-y-2 text-sm">
<div class="p-2 bg-purple-900/30 rounded flex items-center gap-2 hover:scale-105 transition-all duration-300">
<span class="text-purple-400">□</span> Build workflow docs
</div>
<div class="p-2 bg-purple-900/30 rounded flex items-center gap-2 hover:scale-105 transition-all duration-300">
<span class="text-purple-400">□</span> Train team on patterns
</div>
<div class="p-2 bg-purple-900/30 rounded flex items-center gap-2 hover:scale-105 transition-all duration-300">
<span class="text-purple-400">□</span> Create runbooks
</div>
</div>
</div>

</div>

---
layout: center
---

# 📚 Documentation

<div class="grid grid-cols-2 gap-6">

<div class="p-5 bg-gradient-to-br from-blue-900/40 to-indigo-900/30 rounded-xl border border-blue-500/30">
<div class="text-lg font-bold bg-gradient-to-r from-blue-400 to-indigo-400 bg-clip-text text-transparent mb-4">Primary Docs</div>
<div class="space-y-2">
<a href="https://code.visualstudio.com/docs/copilot/chat/chat-debug-view" class="block p-2 bg-blue-900/30 rounded hover:bg-blue-900/50 hover:scale-105 transition-all duration-300 text-sm">
<span class="text-blue-400">📖</span> Chat Debug View
</a>
<a href="https://code.visualstudio.com/docs/copilot/troubleshooting" class="block p-2 bg-blue-900/30 rounded hover:bg-blue-900/50 hover:scale-105 transition-all duration-300 text-sm">
<span class="text-blue-400">📖</span> Troubleshoot AI in VS Code
</a>
<a href="https://code.visualstudio.com/docs/copilot/customization/mcp-servers" class="block p-2 bg-blue-900/30 rounded hover:bg-blue-900/50 hover:scale-105 transition-all duration-300 text-sm">
<span class="text-blue-400">📖</span> MCP Servers
</a>
</div>
</div>

<div class="p-5 bg-gradient-to-br from-purple-900/40 to-pink-900/30 rounded-xl border border-purple-500/30">
<div class="text-lg font-bold bg-gradient-to-r from-purple-400 to-pink-400 bg-clip-text text-transparent mb-4">Additional Resources</div>
<div class="space-y-2">
<a href="https://code.visualstudio.com/docs/copilot/customization/custom-instructions" class="block p-2 bg-purple-900/30 rounded hover:bg-purple-900/50 hover:scale-105 transition-all duration-300 text-sm">
<span class="text-purple-400">🔧</span> Custom Instructions
</a>
<a href="https://code.visualstudio.com/docs/copilot/customization/custom-agents" class="block p-2 bg-purple-900/30 rounded hover:bg-purple-900/50 hover:scale-105 transition-all duration-300 text-sm">
<span class="text-purple-400">🔧</span> Copilot Agents
</a>
<a href="https://github.com/microsoft/vscode-discussions/discussions/categories/copilot" class="block p-2 bg-purple-900/30 rounded hover:bg-purple-900/50 hover:scale-105 transition-all duration-300 text-sm">
<span class="text-purple-400">💬</span> GitHub Discussions
</a>
</div>
</div>

</div>

---
layout: center
---

# ✅ Key Takeaways

<div class="grid grid-cols-2 gap-3 max-w-4xl mx-auto">

<div class="p-3 bg-gradient-to-br from-cyan-900/40 to-blue-900/30 rounded-lg border border-cyan-500/30 flex items-center gap-3 hover:scale-105 transition-all duration-300">
<div class="text-2xl font-bold text-cyan-400">1</div>
<div>
<div class="font-semibold text-cyan-300">Agent Debug Panel</div>
<div class="text-xs opacity-80">Real-time event stream with chart view</div>
</div>
</div>

<div class="p-3 bg-gradient-to-br from-blue-900/40 to-indigo-900/30 rounded-lg border border-blue-500/30 flex items-center gap-3 hover:scale-105 transition-all duration-300">
<div class="text-2xl font-bold text-blue-400">2</div>
<div>
<div class="font-semibold text-blue-300">Chat Debug View</div>
<div class="text-xs opacity-80">Inspect full request/response pipeline</div>
</div>
</div>

<div class="p-3 bg-gradient-to-br from-indigo-900/40 to-purple-900/30 rounded-lg border border-indigo-500/30 flex items-center gap-3 hover:scale-105 transition-all duration-300">
<div class="text-2xl font-bold text-indigo-400">3</div>
<div>
<div class="font-semibold text-indigo-300">Thinking Tokens</div>
<div class="text-xs opacity-80">Understand model reasoning</div>
</div>
</div>

<div class="p-3 bg-gradient-to-br from-purple-900/40 to-pink-900/30 rounded-lg border border-purple-500/30 flex items-center gap-3 hover:scale-105 transition-all duration-300">
<div class="text-2xl font-bold text-purple-400">4</div>
<div>
<div class="font-semibold text-purple-300">Context Management</div>
<div class="text-xs opacity-80">Monitor, use /compact and /fork</div>
</div>
</div>

<div class="p-3 bg-gradient-to-br from-pink-900/40 to-rose-900/30 rounded-lg border border-pink-500/30 flex items-center gap-3 hover:scale-105 transition-all duration-300">
<div class="text-2xl font-bold text-pink-400">5</div>
<div>
<div class="font-semibold text-pink-300">Diagnostics View</div>
<div class="text-xs opacity-80">Validate customizations immediately</div>
</div>
</div>

<div class="p-3 bg-gradient-to-br from-rose-900/40 to-red-900/30 rounded-lg border border-rose-500/30 flex items-center gap-3 hover:scale-105 transition-all duration-300">
<div class="text-2xl font-bold text-rose-400">6</div>
<div>
<div class="font-semibold text-rose-300">Systematic Troubleshooting</div>
<div class="text-xs opacity-80">Replace guesswork with evidence</div>
</div>
</div>

</div>

<div class="mt-6 p-4 bg-gradient-to-r from-cyan-500/20 to-purple-500/20 rounded-xl border border-cyan-500/30 text-center max-w-3xl mx-auto">
<div class="text-lg font-bold bg-gradient-to-r from-cyan-400 to-purple-400 bg-clip-text text-transparent">
Every AI interaction is inspectable, debuggable, and improvable
</div>
</div>

---
layout: center
---

<div class="h-full flex flex-col items-center justify-center relative overflow-hidden">
<div class="absolute inset-0 bg-gradient-to-br from-cyan-900/20 via-blue-900/10 to-indigo-900/20"></div>
<div class="absolute top-1/4 left-1/2 -translate-x-1/2 -translate-y-1/2 w-96 h-96 bg-gradient-to-r from-cyan-500/20 via-blue-500/20 to-indigo-500/20 rounded-full blur-3xl"></div>

<div class="text-6xl mb-6 relative z-10">🙏</div>
<h1 class="!text-5xl !font-bold bg-gradient-to-r from-cyan-400 via-blue-400 to-indigo-400 bg-clip-text text-transparent relative z-10">Thank You</h1>
<div class="mt-6 text-xl opacity-80 relative z-10">Questions?</div>
<div class="mt-8 w-32 h-1 bg-gradient-to-r from-transparent via-cyan-400 to-transparent rounded-full relative z-10"></div>

<div class="mt-8 flex gap-4 relative z-10">
<div class="px-4 py-2 bg-cyan-900/30 rounded-lg border border-cyan-500/30 text-sm">
<span class="text-cyan-400">📖</span> Chat Debug View
</div>
<div class="px-4 py-2 bg-blue-900/30 rounded-lg border border-blue-500/30 text-sm">
<span class="text-blue-400">🎯</span> Agent Debug Panel
</div>
<div class="px-4 py-2 bg-indigo-900/30 rounded-lg border border-indigo-500/30 text-sm">
<span class="text-indigo-400">📊</span> Context Management
</div>
</div>
</div>