cask "network-monitor" do
  version "1.3.0"
  sha256 "c1042a64628b72ac9c28be53eeb38c910d7daf1cbd170bbaa6b1249b67f21a53"

  url "https://github.com/Light-House-Group/Network-Speed/releases/download/v#{version}/NetworkUsageMonitor.app.zip",
      verified: "github.com/Light-House-Group/Network-Speed/"
  name "Network Monitor"
  desc "Menu-bar utility for live per-app network monitoring"
  homepage "https://github.com/Light-House-Group/Network-Speed"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "NetworkUsageMonitor.app"

  zap trash: [
    "~/Library/Application Support/NetworkUsageMonitor",
    "~/Library/Preferences/com.networkmonitor.macos.plist",
    "~/Library/LaunchAgents/com.networkmonitor.macos.plist",
  ]
end
