//
//  StandardError.swift
//  VCBackupUtils
//
//  Created by Stephen Higgins on 01/04/2023.
//

import Foundation

class StdErr: TextOutputStream {
  func write(_ string: String) {
    try! FileHandle.standardError.write(contentsOf: Data(string.utf8))
  }
}
