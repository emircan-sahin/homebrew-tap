cask "gitviber" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.25"
  sha256 arm:   "f665e1cf1d3959fef5a4228d1814d2d327fa6d715a1195cb9ee905d49022d36e",
         intel: "b7e3ef4e90160546e34e4b9edc51bff3cd8491b464819c965694c122a89adc2b"

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
