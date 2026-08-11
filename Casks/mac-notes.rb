cask "mac-notes" do
  arch arm: "-arm64", intel: ""

  version "1.5.3"
  sha256 arm:   "5ef4224f0f0f89c695475c6959faf514969957f3b9d5ee9f0500ae94c0f9776e",
         intel: "f49aedc39b7de574ea20a21b29582d05557979166833f7b00f0d9108afce7e9b"

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
