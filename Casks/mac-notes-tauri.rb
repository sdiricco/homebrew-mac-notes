cask "mac-notes-tauri" do
  version "0.11.2"
  sha256 "39a236f4091c4e98add8574777cd2b2b70db573490315394ba60bedabbca1b5b"

  # Dalla 0.11.0 l'app si chiama RustNotes: cambiano nome del dmg, nome
  # dell'app e identifier. Il cask mantiene il nome storico "mac-notes-tauri"
  # perche' e' quello con cui gli utenti hanno installato e aggiornano.
  # Binario universale (arm64 + Intel in un solo file): a differenza di
  # mac-notes non serve distinguere per architettura.
  url "https://github.com/sdiricco/mac-notes-tauri/releases/download/v#{version}/RustNotes_#{version}_universal.dmg"
  name "RustNotes"
  desc "Simple, local-first notes app in the spirit of Apple Notes, for every OS"
  homepage "https://github.com/sdiricco/mac-notes-tauri"

  # L'app non è firmata con un certificato Apple Developer ID: al primo avvio
  # macOS mostrerà l'avviso "sviluppatore non verificato". Va aperta con
  # tasto destro > Apri, oppure eseguendo:
  #   xattr -dr com.apple.quarantine "/Applications/RustNotes.app"
  auto_updates false
  depends_on macos: :big_sur

  app "RustNotes.app"

  # Sia la cartella dati attuale sia quella delle versioni precedenti alla
  # rinomina (l'app la lascia come backup dopo la migrazione automatica).
  zap trash: [
    "~/Library/Application Support/com.movesolutions.macnotestauri",
    "~/Library/Application Support/io.github.sdiricco.rustnotes",
    "~/Library/Preferences/com.movesolutions.macnotestauri.plist",
    "~/Library/Preferences/io.github.sdiricco.rustnotes.plist",
    "~/Library/Saved Application State/com.movesolutions.macnotestauri.savedState",
    "~/Library/Saved Application State/io.github.sdiricco.rustnotes.savedState",
  ]
end
