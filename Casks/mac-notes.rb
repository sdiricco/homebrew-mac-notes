cask "mac-notes" do
  arch arm: "-arm64", intel: ""

  version "1.3.0"
  sha256 arm:   "c18b0a3b8770bfa819e091940de9608e38e90a784d5707f9c9b2819258553726",
         intel: "774939d5efe4d8c8b5a9112a53569a3ca4dd57488e4d623c556e1a2020afb139"

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
