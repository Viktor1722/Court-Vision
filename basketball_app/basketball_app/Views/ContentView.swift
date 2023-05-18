//
//  ContentView.swift
//  basketball_app
//
//  Created by Viktor on 04/05/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .house
    
    init(){
        UITabBar.appearance().isHidden = true
    }
     //@State private var selectedTab: Tab? = .house
    
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack(alignment: .leading, spacing: 0){
                    HStack{
                        Text("Welcome back")
                            .font(.system(size: 18))
                            .foregroundColor(.secondary)
                            .padding(.horizontal, 10)
                            .offset(x:10, y:5)
                        
                        Image("basketball")
                            .resizable()
                            .frame(width: 22, height: 22)
                            .padding(.leading, -2)
                            .offset(x:10, y:5)
                    }
                    Text("Viktor Velizarov")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(.horizontal, 10)
                        .offset(x:10, y:5)
                    
                    ScrollView{
                        VStack(alignment: .leading){
                            Text("Popular Workouts")
                                .font(.headline)
                                .padding(.leading, 5)
                                .padding(.top, 20)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 10) {
                                    ForEach(0..<3) { index in
                                        NavigationLink(destination: Training()) {
                                            WorkoutsView()
                                        }
                                    }
                                }
                                .padding(.horizontal, 0)
                                .padding(.vertical, 0)
                                .offset(x: -15)
                            }
                            
                            Text("Today's Plan")
                                .font(.headline)
                                .padding(.leading, 20)
                                .padding(.top, 20)
                                .offset(x: -15)
                            
                            TodayPlan()
                            TodayPlan()
                            TodayPlan()
                            
                        
                        }
                        .padding(.top, 6)
                        .padding(.horizontal, 15)
                    
                }
                Spacer()
                
                CustomTabBar(selectedTab: $selectedTab)
            }
        }
        //ForEach(Tab.allCases, id: \.self) { tab in
        // NavigationLink(destination: getPage(for: tab), tag: tab, //selection: $selectedTab) {
            
    }
        .navigationBarBackButtonHidden(true)
};
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
}
