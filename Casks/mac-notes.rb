cask "mac-notes" do
  arch arm: "-arm64", intel: ""

  version "1.5.2"
  sha256 arm:   "3d2007e2fef115463c149efac9cdf8fea448ca54ac598960609d0c986dc9746f",
         intel: "b5980fb59480ce59404a17a1f9204a772a74a6d5ea246e67d86cce2891ba60e5"

  url "https://github.com/sdiricco/mac-notes/releases/download/v#{version}/Mac-Notes-#{version}#{arch}.dmg"
  name "Mac Notes"
  desc "App di note in stile macOS con supporto Markdown, temi e syntax highlighting"
  homepage "https://github.com/sdiricco/mac-notes"

  # L'app non è firmata con un certificato Apple Developer ID: al primo avvio
  # macOS mostrerà l'avviso "sviluppatore non verificato" (Gatekeeper). Va
  # aperta con tasto destro > Apri, oppure eseguendo:
  #   xattr -dr com.apple.quarantine "/Applications/Mac Notes.app"
  auto_updates false

  app "Mac Notes.app"

  zap trash: [
    "~/Library/Application Support/mac-notes",
    "~/Library/Preferences/com.movesolutions.macnotes.plist",
    "~/Library/Saved Application State/com.movesolutions.macnotes.savedState",
  ]
end
