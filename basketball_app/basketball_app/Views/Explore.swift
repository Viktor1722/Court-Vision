//
//  Explore.swift
//  basketball_app
//
//  Created by Viktor on 11/05/2023.
//

import SwiftUI

struct Explore: View {
    @State private var selectedTab: Tab = .basketball
    
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(alignment: .leading, spacing: 0) {
                    ZStack {
                        Image("Banner")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 380, height: 180)
                            .cornerRadius(25)
                            .offset(y: -170)
                            .brightness(-0.11)

                        VStack(alignment: .leading) {
                            Text("Free throw workout")
                                .font(.system(size: 35))
                                .foregroundColor(.white)
                                .padding(.bottom, 10)
                                .offset(y: -180)

                            Text("See more >")
                                .font(.system(size: 20))
                                .foregroundColor(Color("Elgreen"))
                                .padding(.bottom, 10)
                                .offset(y: -140)
                        }
                        .padding(.horizontal, 0)
                        .offset(x: -30)
                    }
                    .frame(maxWidth: .infinity)
                    .offset(y: 130)

                    ScrollView {
                        VStack(alignment: .leading) {
                            Text("Popular Workouts")
                                .font(.headline)
                                .padding(.leading, 20)
                                .padding(.top, -5)

                            LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 3), spacing: 90) { // Increase spacing here
                                BestForYou()
                                Spacer()
                                BestForYou()
                            }
                            .offset(x:70)
                        }
                        .padding(.top, 10)

                     Warmups()
                        .offset(y: 130)
                    }
                }
                .offset(y: -300)

                CustomTabBar(selectedTab: $selectedTab)
                    .offset(y: -20)
            }
            .offset(y: 350)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct Explore_Previews: PreviewProvider {
    static var previews: some View {
        Explore()
    }
}

