//
//  Transcoder.swift
//  WLM3U_Example
//
//  Created by 古智鹏 on 2020/12/25.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation



protocol TranscoderHandleDelegate {
    
//    var currentcommand: String { get }
//    
//    var progress: Float { get }
//    
    func didFinish(_ result: Result)
    
}

class Transcoder {
    
    var delegate: TranscoderHandleDelegate?
    
    static let shared = Transcoder()
    
    private let semaphore = DispatchSemaphore(value: 1001)
    
    //命令集, 队列
    private var commands: [String] = []
    
}

// MARK: -包装 Transcoder 的逻辑
extension Transcoder {
    
    //转换ts到mp4
    func execute(m3u8Path: String, mp4Path: String) {
        let command = CommandPacker.processing(m3u8FloderPath: m3u8Path, mp4Path: mp4Path)
        execute(command)
    }

    private func execute(_ command: String) {
        DispatchQueue.global(qos: .userInteractive).async {
            let date = Date()
    
            let result = MobileFFmpeg.execute(command)
            
            if result == RETURN_CODE_CANCEL {
                print("取消转码", "耗时", time)
                
                DispatchQueue.main.async {
                    self.delegate?.didFinish(.cancel)
                }
                
            } else if result == RETURN_CODE_SUCCESS {
                // 转码完成
                let time = Date().timeIntervalSince(date)
                DispatchQueue.main.async {
                    self.delegate?.didFinish(.success)
                }
                print("转码完成", "耗时", time)
            } else {
                DispatchQueue.main.async {
                    self.delegate?.didFinish(.failure(.parametersInvalid))
                }
            }
        }
    }
    
}
