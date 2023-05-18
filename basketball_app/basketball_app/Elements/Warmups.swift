//
//  Warmups.swift
//  basketball_app
//
//  Created by Viktor on 12/05/2023.
//

import SwiftUI

struct Warmups: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                
                Text("Recent Workouts")
                    .font(.headline)
                    .padding(.leading, 15)
                
                HStack(alignment: .top, spacing: 16) {
                    VStack(alignment: .leading) {

                        Image(systemName: "figure.strengthtraining.functional")
                            .resizable()
                            .offset(x: 20, y: 40)
                            .foregroundColor(.white)
                            .padding(.horizontal, 30)
                        
                        Text("Pre-game stretch")
                            .font(.system(size: 22))
                            .foregroundColor(Color("Colornav"))
                            .offset(x: 10,y: -10)
            
                    }
                    .frame(width: 125, height: 125)
                    .background(Color("Elgreen"))
                    .cornerRadius(15)
                    .padding(.horizontal, 10)
                    
                    VStack(alignment: .leading) {
                    
                        Image(systemName: "figure.run")
                            .resizable()
                            .offset(x: 20, y: 40)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 30)
                        
                        Text("Running")
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                            .offset(x: 10,y: -10)
            
                    }
                    .frame(width: 125, height: 125)
                    .background(Color("Colornav"))
                    .cornerRadius(15)
                    .padding(.horizontal, -15)
                    
                    VStack(alignment: .leading) {
                     
                        Image(systemName: "figure.basketball")
                            .resizable()
                            .offset(x: 20, y: 40)
                            .foregroundColor(Color("Elgreen"))
                            .padding(.horizontal, 30)
                        
                        Text("Pre-game stretch")
                            .font(.system(size: 22))
                            .foregroundColor(Color("Colornav"))
                            .offset(x: 10,y: -10)
            
                    }
                    .frame(width: 125, height: 125)
                    .background(.thinMaterial)
                    .cornerRadius(15)
                    .padding(.horizontal, 10)
                    }
                  }
               }
            }
        }

struct Warmups_Previews: PreviewProvider {
    static var previews: some View {
        Warmups()
    }
}
