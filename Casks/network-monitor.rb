# Auto-maintained: tap-autobump.yml direct-commits the latest upstream release's
# version + verified sha256 on every release. It rewrites ONLY `version` +
# `sha256` — never the `url` line — so the URL template below must stay correct.
cask "network-monitor" do
  version "2.0.0"
  sha256 "fc259ed18b56581d6505dd04d652ff66ba503144a97d716c8b5f9f5ff66a8049"

  url "https://github.com/Light-House-Group/Network-Speed/releases/download/v#{version}/NetworkUsageMonitor-#{version}.dmg"
  name "Network Monitor"
  desc "Menu-bar network monitor with a per-app firewall"
  homepage "https://github.com/Light-House-Group/Network-Speed"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "NetworkUsageMonitor.app"

  # The DMG ships a Developer-ID-signed, Apple-notarized, stapled app — no
  # Gatekeeper workaround needed. Launch right after install.
  postflight do
    system_command "/usr/bin/open",
                   args: ["-a", "#{appdir}/NetworkUsageMonitor.app"],
                   sudo: false
  end

  uninstall quit: "io.github.light-house-group.network-speed"

  # Legacy v1 paths (the com.networkmonitor.macos namespace) are tagged inline so
  # the list stays strictly alphabetized for `brew style` without mislabeling the
  # current v2 preference as legacy.
  zap trash: [
    "~/Library/Application Support/NetworkUsageMonitor",
    "~/Library/LaunchAgents/com.networkmonitor.macos.plist",   # legacy v1
    "~/Library/Preferences/com.networkmonitor.macos.plist",    # legacy v1
    "~/Library/Preferences/io.github.light-house-group.network-speed.plist",
  ]
end
