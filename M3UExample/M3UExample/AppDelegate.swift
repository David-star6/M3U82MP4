//
//  AppDelegate.swift
//  M3UExample
//
//  Created by   on 2020/12/25.
//  Copyright © 2020 david. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, TranscoderHandleDelegate {
    
    func didFinish(_ result: Result) {
        switch result {
        case .failure(.parametersInvalid):
            print("失败")
        case .success:
            print("成功")
        case .cancel:
            print("取消")
        }
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        Transcoder.shared.delegate = self
        
        let tsPath = Bundle.main.url(forResource: "VideoList", withExtension: nil)!.appendingPathComponent("video.m3u8").path

        let mp4Path = NSHomeDirectory().appending("/Documents/\(UUID().uuidString).mp4")

        Transcoder.shared.execute(m3u8Path: tsPath, mp4Path: mp4Path)
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

