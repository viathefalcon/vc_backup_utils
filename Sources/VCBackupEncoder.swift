//
//  VCBackupEncoder
//
//  Created by Stephen Higgins on 25/05/2022.
//

import Foundation
import VCCrypto
import VCToken

@main
struct VCBackupEncoder
{
    static func main() throws {
        var standardError = StdErr()
        if CommandLine.arguments.count < 2 {
            print("Usage: VCBackupEncoder <passphrase>", to: &standardError)
            return
        }
        
        // Get the passphrase
        let passphrase = CommandLine.arguments[1]

        // Read in the input
        let read = readFromStdIn();

        // Parse it
        if let data = read.data(using: .utf8),
           let json = try JSONSerialization.jsonObject(with: data) as? Dictionary<AnyHashable, Any>,
           let type = json["type"] as? String {
            // Wrap it up
            let unprotectedBackupData = UnprotectedBackupData(type: type, encoded: data)

            // Encrypt
            let method = JwePasswordProtectionMethod(password:passphrase)
            let protectedBackupData = try method.wrap(unprotectedBackupData: unprotectedBackupData)
            
            // Output
            print(protectedBackupData.serialize(), terminator: "")
            return
        }
        print("Failed to determine the backup type; aborting.", to:&standardError)
    }
}
