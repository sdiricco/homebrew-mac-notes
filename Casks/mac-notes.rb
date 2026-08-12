cask "mac-notes" do
  arch arm: "-arm64", intel: ""

  version "1.5.4"
  sha256 arm:   "5118f6d8c999f31ccddf545c9f29324f5189ad746ab0edb22c8c231629cdbb49",
         intel: "8421c880929e147fc74419fedeb5a5df66423b48a23c6a63734db6274e33c30f"

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
