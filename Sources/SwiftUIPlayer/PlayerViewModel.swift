//
//  File.swift
//  
//
//  Created by Айтолкун Анарбекова on 29.11.2023.
//
import AVKit
import Foundation
import SwiftUI

@available(iOS 14.0, *)
public class PlayerViewModel: ObservableObject {
    
    @Published var player = AVPlayer()

    @Binding var showControls: Bool

    public var timecodes: [Timecode]?
    
    public init(url: String, timecodes: [Timecode]?, showControls: Binding<Bool>) {
        self.timecodes = timecodes
        self._showControls = showControls

        if let videoURL = URL(string: url) {
            player = AVPlayer(url: videoURL)
        }
    }

    public init(player: AVPlayer, timecodes: [Timecode]?, showControls: Binding<Bool>) {
        self.timecodes = timecodes
        self._showControls = showControls
        self.player = player
    }

}
