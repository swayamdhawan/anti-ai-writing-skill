# anti-ai-writing

**Stop sounding like AI. Sound like a specific person with something to say.**

AI writing fails the same few ways: vague claims, "It's not X, it's Y" reframes, fake-deep metaphors, hype words, and engagement bait. Readers spot it in one line and scroll. `anti-ai-writing` is an AI skill that runs as the **final filter** on anything you write and removes the machine-made parts.

It does not just ban words. Blocklists rot. The skill goes after the real problem: **specificity and voice**.

Works with Claude Code, Claude Cowork, Claude desktop and claude.ai, OpenAI Codex, ChatGPT, Grok, and any other AI chat. Built by [Creatofy](https://creatofy.ai).

## See it work

**Before**

> It's not about the prompt. It's about the context.

**After**

> The model gets about 3x better when you paste the previous chat into the system prompt.

**Before**

> In today's fast-paced digital landscape, it's important to note that leveraging AI can unlock transformative growth for your business.

**After**

> I run a four-person agency. Last month AI cut our proposal time from 3 hours to 40 minutes. Here is exactly what I changed.

*(Sample facts are made up for the demo. The skill never invents numbers. If it lacks a specific, it asks you or leaves a `[bracket]`.)*

More in [`examples/before-after.md`](examples/before-after.md).

## What it catches

### The 5 diseases

Name the problem and the fix is obvious.

1. **Vagueness compression:** describes a category, not a thing.
2. **Significance inflation:** treats normal facts like turning points.
3. **Hedged confidence:** has a position but won't commit.
4. **Rhythmic flatness:** every sentence the same length.
5. **Borrowed authority:** sounds like a consulting deck or a thinkfluencer.

### The specificity ladder

The highest-leverage rule. Aim for level 3 or 4.

| Level | Example |
|---|---|
| Vague | "The company faced challenges." |
| Specific | "The company had cashflow issues." |
| Concrete | "The company missed payroll twice in six months." |
| Lived | "Payroll bounced in March and again in August. The CFO found out from Slack." |

### The #1 tell: negative parallelism

"It's not X. It's Y." and every cousin: *Less X, more Y. / Stop thinking X, start thinking Y. / Most people think X, but...* The fix is to delete the rejected half and write the other half as a direct claim with specifics.

It also knows when a contrast is **earned** (the second half is concrete and the piece pays it off) versus **hollow** (vague significance hiding the lack of a point). Good hooks keep their contrast. Empty ones get cut.

### More

- **Metaphor control:** writes literally by default. Banned families (flywheel, DNA, iceberg, leaky bucket) and banned verbs (baked in, bolted on, unpacked, woven).
- **Vocab and phrase tells:** delve, leverage, seamless, game-changer, "Let's dive in", "Let that sink in", "Furthermore", and more.
- **Formatting tells:** em dashes, hashtag and emoji spam, walls of bullets, the rule-of-three reflex.
- **Other tells:** false ranges, elegant variation, participle fake-depth, symmetric slogans, throat-clearing first sentences.

### Two modes

| Mode | You say | You get |
|---|---|---|
| **Write** | "run anti-ai-writing on this" + your draft | A direct, specific rewrite in your voice |
| **Audit** | "audit this, does it sound like AI?" | Each tell flagged with the exact line, then a rewrite |

```
ANTI-AI AUDIT:
  Negative parallelism: FLAG - "They're not just employees. They're the DNA of everything we do."
  Metaphor:             FLAG - "DNA of everything" (banned family) - say what they actually shape
  Specificity:          FLAG - no names, numbers, or lived detail
  Rewrite: "Maya in support rewrote our refund policy in April. Complaints dropped by half."
```

### Built-in judgment

- **Priority order:** Accurate > Clear > Specific > Voiced > Stylish. A boring true sentence beats an elegant vague one.
- **Spirit beats letter.** If a rule makes the sentence worse, it breaks the rule.
- **Written vs spoken:** full pass on captions, carousels, newsletters, threads, LinkedIn, and long-form. A lighter subset for reel and video scripts, where formatting tells don't exist.

## Install

Pick your tool.

### Claude Code, Cowork, and other Claude CLIs (GitHub CLI)

```bash
gh repo clone swayamdhawan/anti-ai-writing-skill
cd anti-ai-writing-skill && ./install.sh claude
```

Or one line, no script:

```bash
gh repo clone swayamdhawan/anti-ai-writing-skill /tmp/anti-ai-writing-skill && mkdir -p ~/.claude/skills && cp -R /tmp/anti-ai-writing-skill/anti-ai-writing ~/.claude/skills/anti-ai-writing
```

For one project only, run `./install.sh claude --project` inside that project. Restart Claude Code if it was already running.

### Claude desktop, Cowork, and claude.ai (upload)

Download the ready-made file with GitHub CLI:

```bash
gh release download --repo swayamdhawan/anti-ai-writing-skill --pattern 'anti-ai-writing.skill'
```

Then open **Settings > Capabilities > Skills** (on some plans **Customize > Skills**), click **Upload skill**, pick `anti-ai-writing.skill`, and make sure it is toggled on.

### OpenAI Codex CLI

```bash
gh repo clone swayamdhawan/anti-ai-writing-skill
cd anti-ai-writing-skill && ./install.sh codex
```

This copies the skill to `~/.codex/skills/anti-ai-writing`. Restart Codex. If your Codex version does not load skills, paste [`prompts/anti-ai-writing-prompt.md`](prompts/anti-ai-writing-prompt.md) into your `AGENTS.md` instead.

Install for both at once with `./install.sh all`.

### ChatGPT, Grok, Gemini, and any chat AI

These don't load skill folders, so use the paste-in version. It has the same rules.

```bash
gh repo clone swayamdhawan/anti-ai-writing-skill /tmp/anti-ai-writing-skill && pbcopy < /tmp/anti-ai-writing-skill/prompts/anti-ai-writing-prompt.md
```

(`pbcopy` is macOS. On Linux use `xclip -selection clipboard <`, on Windows use `clip <`.)

Then pick one:

- **ChatGPT:** paste into a new chat, a **Custom GPT**'s instructions, a **Project**'s instructions, or **Settings > Personalization > Custom instructions**.
- **Grok:** paste into a chat, or into your custom instructions in settings.
- **Gemini:** paste into a chat, or create a **Gem** with it as the instructions.

Then send your draft with "run anti-ai-writing on this".

### Plain terminal (no install)

```bash
gh repo clone swayamdhawan/anti-ai-writing-skill && cat anti-ai-writing-skill/anti-ai-writing/SKILL.md
```

## How to use it

In Claude Code or Cowork:

```
/anti-ai-writing
In today's fast-paced digital landscape, it's important to note that leveraging AI can unlock...
```

Or just talk to it:

- "make this sound less like AI"
- "audit my LinkedIn post"
- "this feels generic, fix it"
- "run the anti-AI pass on this newsletter"

It triggers automatically as the final filter on written content, and whenever text feels generic, hollow, over-formatted, or "sounds like AI".

## Pairs well with

- [**dumbify**](https://github.com/swayamdhawan/dumbify-skill): lowers reading level so content is easy to follow. Run dumbify for clarity, then anti-ai-writing for voice.

## Repo layout

```
anti-ai-writing/
  SKILL.md                       the skill (this is what agents load)
prompts/
  anti-ai-writing-prompt.md      paste-in version for ChatGPT, Grok, Gemini
examples/
  before-after.md                rewrites and an audit example
install.sh                       installer for Claude and Codex
LICENSE                          MIT
```

## License

MIT. Use it, fork it, remix it. A star on the repo helps others find it.

Made by [Swayam Dhawan](https://github.com/swayamdhawan) at [Creatofy](https://creatofy.ai).
