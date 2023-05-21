//
//  WorkoutsView.swift
//  basketball_app
//
//  Created by Viktor on 07/05/2023.
//

import SwiftUI

struct WorkoutsView: View {
    
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
                       Image("workout1")
                           .renderingMode(.original)
                           .resizable()
                           .frame(width: 300, height: 200)
                           .cornerRadius(19)
                       VStack(alignment: .leading, spacing: 8) {
                           
                           Text("Free throw workout")
                               .font(.system(size: 30))
                               .foregroundColor(.white)
                               .offset(y: 10)
                           
                           VStack(alignment: .leading){
                               HStack{
                                   Spacer()
                                   Image(systemName: "flame.fill")
                                       .resizable()
                                       .frame(width: 20, height: 20)
                                       .padding(.leading, -2)
                                       .foregroundColor(.white)
                                   Text("60 Points")
                                       .font(.system(size: 20))
                                       .foregroundColor(.white)
                                   Spacer()
                               }
                               .frame(width: 130, height: 40)
                               .background(.thinMaterial)
                               .cornerRadius(30)
                               
                               
                               HStack{
                                   Spacer()
                                   Image(systemName: "stopwatch")
                                       .resizable()
                                       .frame(width: 20, height: 20)
                                       .padding(.leading, -2)
                                       .foregroundColor(.white)
                                   Text("10min")
                                       .font(.system(size: 20))
                                       .foregroundColor(.white)
                                   Spacer()
                               }
                               .frame(width: 100, height: 40)
                               .background(.thinMaterial)
                               .cornerRadius(30)
                               
                               
                               
                           }
                           
                           .offset(y: 25)
                           
                           
                           VStack{
                                   Button( action: {}){
                                       HStack{
                                           Image(systemName: "play.fill")
                                               .font(.system(size: 20))
                                       }
                                   }
                                   .padding(.horizontal, 10)
                                   .padding(.vertical, 10)
                                   .background(Color("Elgreen"))
                                   .foregroundColor(.black)
                                   .cornerRadius(50)
                                   .offset(x: 215)
                           }
                       }
                       .padding(16)
                   }
                   .padding(.leading, 15)
               }
           }


struct WorkoutsView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutsView()
    }
}
