//
//  StdIn.swift
//  VCBackupUtils
//
//  Created by Stephen Higgins on 02/04/2023.
//

import Foundation

func readFromStdIn() -> String {
    var content = String()
    while (true) {
        if let line = readLine() {
            content.append(line)
            continue;
        }
        break;
    }
    return content.trimmingCharacters(in: .newlines)
}
