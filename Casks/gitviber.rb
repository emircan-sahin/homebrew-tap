cask "gitviber" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.20"
  sha256 arm:   "d89bde5bf922b6e705e60c46b895b9216b049d172313a1eea65df8da3ee2b2db",
         intel: "8111e08df0596b96641e2d363eefb78ac02a7df559df425bb5ba72f46aa9de8f"

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
