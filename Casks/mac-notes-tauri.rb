cask "mac-notes-tauri" do
  version "0.2.0"
  sha256 "c0b07460c31a90edb8c13c2e1f1cd440a33ea1338152a98a2069541f8e89d5af"

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
