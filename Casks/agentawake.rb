cask "agentawake" do
  version "1.0.5"
  sha256 "9f852cef3e5d6c9073fd6e6404bda1db3b0eafc0987c3533d163eb640a767755"

  url "https://github.com/SyncEdge/agentawake-releases/releases/download/v#{version}/AgentAwake-#{version}.dmg"
  name "AgentAwake"
  desc "Prevents sleep while AI agents work, even with the lid closed"
  homepage "https://syncedge.tech/en/agentawake/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "AgentAwake.app"

  uninstall quit: "global.syncedge.agentawake"

  zap trash: [
    "~/Library/Application Support/AgentAwake",
    "~/Library/Caches/global.syncedge.agentawake",
    "~/Library/HTTPStorages/global.syncedge.agentawake",
    "~/Library/LaunchAgents/global.syncedge.agentawake.plist",
    "~/Library/Logs/AgentAwake.log",
    "~/Library/Preferences/global.syncedge.agentawake.plist",
    "~/Library/WebKit/global.syncedge.agentawake",
  ]

  caveats <<~EOS
    Open AgentAwake and click Set up once. Set up adds, with your password,
    /etc/sudoers.d/agentawake and LaunchDaemons and helpers in /Library,
    which Homebrew does not remove. Before `brew uninstall --cask agentawake`,
    choose "Uninstall helper…" in the AgentAwake panel: it removes them and
    turns lid sleep back on. The same from a terminal, before uninstalling:
      sudo sh /Applications/AgentAwake.app/Contents/Resources/uninstall.sh
  EOS
end
