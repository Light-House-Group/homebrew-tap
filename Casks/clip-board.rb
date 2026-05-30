cask "clip-board" do
  version "1.2.1"
  sha256 "9c42d1eef5a70f66baacbfb71699a1eb969df90da0eeca72acb58602d0c94f76"

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
