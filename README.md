# Verifiable Credential Utils

In 2022, I implemented the Verified ID import/export ("backup/restore") feature in [Microsoft Authenticator](https://go.microsoft.com/fwlink/p/?LinkID=2168643), mainly via the [Verifiable Credential SDK for iOS](https://github.com/microsoft/VerifiableCredential-SDK-iOS/pull/128).

This project re-purposes some of the components of the SDK to implement a pair of command-line tools, for macOS, which can decode and encode such backups. Each takes a single command-line argument - the passphrase with which to encrypt or decrypt a backup file - and each reads its input from _stdin_ and writes its output to _stdout_.

## Example
### Changing a Backup Password
```sh
VCBackupDecoder "lorem ipsum dolor sit amet consectetur adipiscing elit" < Input.jwt | VCBackupEncoder "suspendisse faucibus velit non fermentum dignissim" > Output.jwt
```