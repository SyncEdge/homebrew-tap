# SyncEdge Homebrew tap

Homebrew casks for apps by [SyncEdge](https://syncedge.tech).

## AgentAwake

Keeps your Mac awake while AI agents work, even with the lid closed, and lets it sleep when they finish.
[syncedge.tech/en/agentawake](https://syncedge.tech/en/agentawake/) · releases:
[SyncEdge/agentawake-releases](https://github.com/SyncEdge/agentawake-releases)

```sh
brew install --cask syncedge/tap/agentawake
```

Then open AgentAwake and click **Set up** (it asks for your Mac password once). The app updates itself, so
`brew upgrade` skips it; `brew upgrade --greedy` also works.

**Uninstall:** first choose **Uninstall helper…** in the AgentAwake panel. Set up added files outside the app
(`/etc/sudoers.d/agentawake`, LaunchDaemons and helpers in `/Library`) that Homebrew does not remove; the app's own
uninstall removes them and turns lid sleep back on. Then:

```sh
brew uninstall --cask agentawake        # the app
brew uninstall --zap --cask agentawake  # the app plus its settings, log and caches in your home folder
```

Problems: **Report a problem…** in the AgentAwake menu, or support@syncedge.tech.
