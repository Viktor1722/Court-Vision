//
//  Video2.swift
//  basketball_app
//
//  Created by Viktor on 16/05/2023.
//

import SwiftUI
import AVKit
import AVFoundation

struct Video2: View {
    
    @State private var player = AVPlayer()
    
    var body: some View {
        
            VideoPlayer(player: AVPlayer(url: Bundle.main.url(forResource: "Shooting", withExtension: "mp4")!))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
    }
}

struct Video2_Previews: PreviewProvider {
    static var previews: some View {
        Video2()
    }
}
