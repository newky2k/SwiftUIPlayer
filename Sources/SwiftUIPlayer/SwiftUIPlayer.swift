// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

@available(iOS 14.0, *)
public struct SwiftUIPlayer: View {
    
    @ObservedObject var viewModel: PlayerViewModel


    public init(url: String, timecodes: [Timecode]? = nil, showControls: Binding<Bool>) {
        self.viewModel = PlayerViewModel(url: url, timecodes: timecodes, showControls: showControls)
    }
    
    public var body: some View {
        VideoPlayerView(player: viewModel.player, timecodes: viewModel.timecodes, showControls: viewModel.$showControls)

        if let timecodes = viewModel.timecodes {
            TimecodeListView(player: viewModel.player, timecodes: timecodes)
        }
    }
}
