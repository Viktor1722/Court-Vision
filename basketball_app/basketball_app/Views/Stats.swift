//
//  Stats.swift
//  basketball_app
//
//  Created by Viktor on 11/05/2023.
//

import SwiftUI

struct Stats: View {
    
    @State private var selectedTab: Tab = .house
    
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
            Text("Stats")
        }
    }

struct Stats_Previews: PreviewProvider {
    static var previews: some View {
        Stats()
    }
}
