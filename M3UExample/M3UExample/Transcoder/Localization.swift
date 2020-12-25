//
//  Localization.swift
//  M3UExample
//
//  Created by 古智鹏 on 2020/12/25.
//  Copyright © 2020 david. All rights reserved.
//

import Foundation

public enum Result {
    case success
    case failure(TranscoderError)
    case cancel
}

public enum TranscoderError: Error {
    case parametersInvalid
}

extension TranscoderError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .parametersInvalid:
            return "参数错误，请检查传入的参数。"
        }
    }
}
