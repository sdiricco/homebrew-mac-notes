cask "mac-notes" do
  arch arm: "-arm64", intel: ""

  version "1.5.0"
  sha256 arm:   "aa2d9a68e261ea0dabec21edfdc2de25c18f7235db65e20585cc35a787e05c0d",
         intel: "74d4622b0884b43396951338f11ca09e31980db1a7b0ec5adb7e75143c5b76b7"

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
