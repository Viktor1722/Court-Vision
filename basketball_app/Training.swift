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
       
        NavigationView{
            
            ZStack{
                Color("Colornav") // Set your desired background color here
                           .ignoresSafeArea()
                VStack(alignment: .leading, spacing: 0){
                    HStack{
                        Text("**Workout**")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                            .padding(.horizontal, 10)
                            .offset( x:125, y:5)
                        
                     
                    }
                    
                    ScrollView{
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
                                        .offset(x: -40, y:0)
                                    
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
                                            // Your other code
                                            
                                            WorkoutButton() // Add the WorkoutButton here
                                            
                                            // Your other code
                                        }
                                        .padding(.horizontal, 0)
                                        .padding(.vertical, 0)
                                        .offset(x: -15)
                                    }

                                }
                                .padding(.horizontal, 0)
                                .padding(.vertical, 0)
                                .offset(x: -15)
                            }
            
                        }
                        .padding(.top, 6)
                        .padding(.horizontal, 15)
                        
                    }
                    Spacer()

                }
            }
        .navigationBarBackButtonHidden(true)
        }
       
    };
    
    
    
    
    
    struct Training_Previews: PreviewProvider {
        static var previews: some View {
            Training()
        }
    }

