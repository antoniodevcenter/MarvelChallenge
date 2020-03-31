//
//  String.swift
//  Marvel Challenge
//
//  Created by Antonio on 26/03/2020.
//  Copyright © 2020 Antonio. All rights reserved.
//

import Foundation
import CommonCrypto

extension String {
    var md5: String {
        let data = Data(self.utf8)
        let hash = data.withUnsafeBytes { (bytes: UnsafeRawBufferPointer) -> [UInt8] in
            var hash = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
            CC_MD5(bytes.baseAddress, CC_LONG(data.count), &hash)
            return hash
        }
        return hash.map { String(format: "%02x", $0) }.joined()
    }
    
    static func createThumbnailString(thumbnail: Thumbnail, size: String) -> String {
        return "\(thumbnail.path!)\(size).\(thumbnail.thumbnailExtension!)"
    }
    
    func localized() -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: self)
    }
    
}
