# homebrew-mac-notes

Tap Homebrew personale per [Mac Notes](https://github.com/sdiricco/mac-notes).

## Installazione

```bash
brew tap sdiricco/mac-notes
brew install --cask mac-notes
```

## Aggiornamento

```bash
brew upgrade --cask mac-notes
```

## Nota su Gatekeeper

L'app non è firmata con un certificato Apple Developer ID. Al primo avvio
macOS mostrerà l'avviso "sviluppatore non verificato". Per aprirla:

- **Tasto destro sull'app → Apri** (poi conferma), oppure
- da terminale:
  ```bash
  xattr -dr com.apple.quarantine "/Applications/Mac Notes.app"
  ```

## Aggiornare il Cask a una nuova release

Dopo aver pubblicato una nuova release su `sdiricco/mac-notes` (tag `vX.Y.Z`):

1. Scarica i due dmg (arm64 e Intel) dalla release
2. Calcola i checksum: `shasum -a 256 Mac-Notes-X.Y.Z-arm64.dmg Mac-Notes-X.Y.Z.dmg`
3. Aggiorna `version` e i due `sha256` in `Casks/mac-notes.rb`
4. Commit e push
