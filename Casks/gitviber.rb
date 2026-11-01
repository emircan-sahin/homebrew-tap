cask "gitviber" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.24"
  sha256 arm:   "27c6d334197e37c3838428d5c4dae182a461f4dd563772cc1f6e7f4f881b2616",
         intel: "5452539e453ccb42d7a3e6bfdff018b1f7372f848d69518703efc01344b55f53"

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
