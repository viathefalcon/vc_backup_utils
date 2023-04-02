//
//  VCBackupDecoder
//
//  Created by Stephen Higgins on 19/05/2022.
//

import Foundation
import VCToken

@main
struct VCBackupDecoder {
    static func main() throws {
        var standardError = StdErr()
        if CommandLine.arguments.count < 2 {
            print("Usage: VCBackupEncoder <passphrase>", to: &standardError)
            return
        }

        // Read in
        let read = readFromStdIn();

        // Decode
        let decoded = try JweDecoder().decode(token: read)

        // Decrypt
        let passphrase = CommandLine.arguments[1]
        let decrypted = try PbesJwe().decrypt(decoded, with: passphrase)

        // Output
        let json = String(data: decrypted, encoding: .utf8)
        guard let output = json else {
            throw AppError.nilOutputError(data: decrypted)
        }
        print(output, terminator: "")
    }
}
