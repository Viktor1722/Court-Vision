//
//  Video.swift
//  basketball_app
//
//  Created by Viktor on 15/05/2023.
//

import SwiftUI
import AVKit
import AVFoundation

struct Video: View {
    
    @State private var player = AVPlayer()
    
    var body: some View {
        VideoPlayer(player: AVPlayer(url: Bundle.main.url(forResource: "Freethrow", withExtension: "mp4")!))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
    }
}

struct Video_Previews: PreviewProvider {
    static var previews: some View {
        Video()
    }
}
