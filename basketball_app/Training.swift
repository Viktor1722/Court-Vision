//
//  Training.swift
//  basketball_app
//
//  Created by Viktor on 07/05/2023.
//
import AVKit
import AVFoundation
import SwiftUI
import UIKit


struct Training: View {
    @State private var isVideoPresented = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Colornav")
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    Text("**Workout**")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .frame(maxWidth: .infinity)
                    
                    ScrollView {
                        ScrollView(.horizontal, showsIndicators: false) {
                            VStack(spacing: 10) {
                                Image("firstworkoutimg")
                                    .renderingMode(.original)
                                    .resizable()
                                    .frame(width: 360, height: 240)
                                    .cornerRadius(25)
                                    .padding(.vertical, 30)
                                
                                Text("Freetrow workout")
                                    .font(.system(size: 35))
                                    .foregroundColor(.white)
                                
                                Text("Training throws in the ring refers to the process of practicing and perfecting one's throwing techniques. This involves various drills and exercises designed to improve throwing accuracy, power, speed, and timing, as well as footwork and positioning.")
                                    .font(.system(size: 15))
                                    .foregroundColor(.gray)
                                    .frame(width: 350)
                                
                                NavigationLink(destination: Video()) {
                                    VideoListItemView()
                                }
                                .padding(.vertical, 10)
                                
                                Text("Training throws in the ring refers to the process of practicing and perfecting one's throwing techniques. This involves various drills and exercises designed to improve throwing accuracy, power, speed, and timing, as well as footwork and positioning.")
                                    .font(.system(size: 15))
                                    .foregroundColor(.gray)
                                    .frame(width: 350)
                                
                                NavigationLink(destination: Video2()) {
                                    VideoListItemView()
                                }
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    VStack(spacing: 10) {
                                        WorkoutButton()
                                        // Your other code
                                    }
                                    .padding(.horizontal, 0)
                                    .padding(.vertical, 0)
                                    .offset(x: 20)
                                }
                            }
                            .padding(.horizontal, 0)
                            .padding(.vertical, 0)
                            .frame(maxWidth: .infinity)
                        }
                    }
                    .padding(.top, 6)
                    .padding(.horizontal, 15)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.vertical, 30)
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

    
    
    
    
    
    struct Training_Previews: PreviewProvider {
        static var previews: some View {
            Training()
        }
    }

