cask "clip-board" do
  version "1.2.5"
  sha256 "700ed98ab9853fcb0a4a02de402e7d78fbd7958d2c010af4b5521ba178226030"

  url "https://github.com/Light-House-Group/Clip-Board/releases/download/v#{version}/Clip-Board.zip"
  name "Clip-Board"
  desc "Privacy-first clipboard history manager for macOS (AES-GCM at rest, no network code)"
  homepage "https://github.com/Light-House-Group/Clip-Board"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on macos: ">= :sonoma"

  app "Clip Board.app"

  zap trash: [
    "~/Library/Application Support/ClipboardManager",
    "~/Library/Preferences/Siddharth.Sangwa.ClipBoard.plist",
    "~/Library/Saved Application State/Siddharth.Sangwa.ClipBoard.savedState",
  ]
end
