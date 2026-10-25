cask "gitviber" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.18"
  sha256 arm:   "2a5f1be7dc47f670983b70fe6834fef6b5cc11e1ac8e0fe4adcb91685ecd74c2",
         intel: "e89c0a684b74cd74cf2ab319d70b0dfc10c3e56362e7845a952f5b7241e61106"

  url "https://github.com/emircan-sahin/gitviber/releases/download/v#{version}/GitViber_#{version}_#{arch}.dmg"
  name "GitViber"
  desc "Git client for reviewing and committing what coding agents write"
  homepage "https://github.com/emircan-sahin/gitviber"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :ventura

  app "GitViber.app"
  # The `gitviber` command (packaging/macos/gitviber), linked into Homebrew's bin.
  binary "#{appdir}/GitViber.app/Contents/Resources/bin/gitviber"

  zap trash: [
    "~/Library/Application Support/app.gitviber.desktop",
    "~/Library/Caches/app.gitviber.desktop",
    "~/Library/HTTPStorages/app.gitviber.desktop",
    "~/Library/Logs/app.gitviber.desktop",
    "~/Library/Preferences/app.gitviber.desktop.plist",
    "~/Library/Saved Application State/app.gitviber.desktop.savedState",
    "~/Library/WebKit/app.gitviber.desktop",
  ]
end
