//
//  CommandPacker.swift
//  M3UExample
//
//  Created by 古智鹏 on 2020/12/25.
//  Copyright © 2020 david. All rights reserved.
//

import Foundation
class CommandPacker {
    
    static func processing(m3u8FloderPath: String, mp4Path: String) -> String {
        let command = "-allowed_extensions ALL -protocol_whitelist \"file,http,crypto,tcp\" -i '\(m3u8FloderPath)'  -c copy '\(mp4Path)'"
        
        return command
    }
    
}
