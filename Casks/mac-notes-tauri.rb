cask "mac-notes-tauri" do
  version "0.2.3"
  sha256 "4905c18cae97a08af783c746d4505769557ff5918f4306874877a115d5c36129"

  # Binario universale (arm64 + Intel in un solo file): a differenza di
  # mac-notes non serve distinguere per architettura.
  url "https://github.com/sdiricco/mac-notes-tauri/releases/download/v#{version}/Mac.Notes.Tauri_#{version}_universal.dmg"
  name "Mac Notes Tauri"
  desc "App di note in stile macOS con supporto Markdown, temi e syntax highlighting"
  homepage "https://github.com/sdiricco/mac-notes-tauri"

  # L'app non è firmata con un certificato Apple Developer ID: al primo avvio
  # macOS mostrerà l'avviso "sviluppatore non verificato". Va aperta con
  # tasto destro > Apri, oppure eseguendo:
  #   xattr -dr com.apple.quarantine "/Applications/Mac Notes Tauri.app"
  auto_updates false
  depends_on macos: :big_sur

  app "Mac Notes Tauri.app"

  zap trash: [
    "~/Library/Application Support/com.movesolutions.macnotestauri",
    "~/Library/Preferences/com.movesolutions.macnotestauri.plist",
    "~/Library/Saved Application State/com.movesolutions.macnotestauri.savedState",
  ]
end
