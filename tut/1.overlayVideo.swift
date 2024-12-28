//
//  1.overlayVideo.swift
//  tut
//
//  Created by Sonal on 27/12/24.
//

import SwiftUI
import AVKit

struct OverlayVideo: View {
    let video_url_string = "https://static.vecteezy.com/system/resources/previews/016/465/804/mp4/silhouettes-flock-of-seagulls-over-the-sea-during-amazing-sky-video.mp4"
    let videoHei = 64.0
    let videoWei = 112.0
    @State private var currentOffset = CGSize(width: 0.0, height: UIScreen.main.bounds.height - 64.0)
    @State private var dragOffset = CGSize.zero
    
    let maxVideoHei = 300.0
    let maxVideoWei = CGFloat.infinity
    
    let videoPaddingHorizontal = 12.0
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack(alignment: .topLeading){
                
                VStack(alignment: .leading, spacing: 0){
                    Color.red
                    Color.green
                    Color.blue
                }
                .ignoresSafeArea()
                
                VideoPlayerView(viewModel: VideoPlayerViewModel(url: URL(string: video_url_string)!))
                    .clipShape(RoundedRectangle(cornerRadius: 12.0))
                    .frame(
                        width: videoWei,
                        height: videoHei
                    )
                    .padding(.horizontal, videoPaddingHorizontal)
                
                    .offset(
                        x: min(max(currentOffset.width + dragOffset.width, 0), geometry.size.width - (videoWei + 2 * videoPaddingHorizontal)),
                        y: min(max(currentOffset.height + dragOffset.height, 0), geometry.size.height - videoHei)
                    )
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                print(value.translation)
                                    dragOffset = value.translation
                            }
                            .onEnded { _ in
                                    let newOffsetX = currentOffset.width + dragOffset.width
                                    let newOffsetY = currentOffset.height + dragOffset.height
                                    
                                    currentOffset.width = min(max(newOffsetX, 0), geometry.size.width - (videoWei + 2 * videoPaddingHorizontal))
                                    currentOffset.height = min(max(newOffsetY, 0), geometry.size.height - videoHei)
                                    
                                    dragOffset = .zero
                            }
                    )
            }
        }
        
    }
}

struct VideoPlayerView: View {
    @StateObject var viewModel: VideoPlayerViewModel
    
    var body: some View {
        VStack {
            if let player = viewModel.player {
                VideoPlayer(player: player)
                    .onAppear {
                        player.play()
                    }
                    .onDisappear {
                        player.pause()
                    }
            } else {
                Text("Loading...")
            }
        }
        .onAppear {
            viewModel.playVideo()
        }
        .onDisappear {
            viewModel.pauseVideo()
        }
    }
}

class VideoPlayerViewModel: ObservableObject {
    @Published var url: URL
    @Published var player: AVPlayer?
    
    init(url: URL, player: AVPlayer? = nil) {
        self.url = url
        self.player = player
    }
    
    func playVideo() {
        player = AVPlayer(url: url)
    }
    
    func pauseVideo() {
        player?.pause()
    }
}

#Preview {
    OverlayVideo()
}