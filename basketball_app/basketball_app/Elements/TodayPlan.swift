//
//  TodayPlan.swift
//  basketball_app
//
//  Created by Viktor on 07/05/2023.
//

import SwiftUI

struct TodayPlan: View {
    @State private var progress: Float = 0.5 // Example progress value
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            VStack(alignment: .leading){
                HStack{
                    Spacer()
                    
                    Image("workout2")
                        .resizable()
                        .frame(width: 110, height: 110)
                        .padding(.leading, -2)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .offset(x: -30, y: 0)
                    
                    VStack(alignment: .leading){
                        VStack(alignment: .leading){
                            Text("Three-point shot")
                                .font(.system(size: 17))
                                .foregroundColor(.black)
                            
                            Text("600kcal")
                                .font(.system(size: 15))
                                .foregroundColor(.secondary)
                        }
                        .offset(y: 30)
                        
                        HStack{
                            Spacer()
                            Text("Beginer")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .frame(width: 100, height: 30)
                        .background(Color("Colornav"))
                        .cornerRadius(10)
                        .offset(x:90 , y:-55 )
                        
                        ProgressView(value: progress)
                            .accentColor(Color("Elgreen"))
                            .frame(width: 200, height: 10)
                            .offset(y: -5)
                        
                        HStack {
                          
                            Text("30/60")
                                .font(.system(size: 20))
                        }
                        .foregroundColor(.secondary)
                        .padding(.top, 0)
                        .offset(y: -10)
                    }
                    .offset(x: -20, y: 0)
                }
                .frame(width: 355, height: 130)
                .background(.white)
                .cornerRadius(20)
                .shadow(radius: 5)
                
            }
          
        }
    }
}


struct TodayPlan_Previews: PreviewProvider {
    static var previews: some View {
        TodayPlan()
    }
}
