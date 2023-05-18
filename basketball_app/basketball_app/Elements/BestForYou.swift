//
//  BestForYou.swift
//  basketball_app
//
//  Created by Viktor on 12/05/2023.
//

import SwiftUI

struct BestForYou: View {
    @State private var progress: Float = 0.5
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            VStack(alignment: .leading){
                HStack{
                    Spacer()
                    
                    Image("workout2")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .padding(.leading, -2)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .offset(x: -50, y: 0)
                    
                    VStack(alignment: .leading){
                        VStack(alignment: .leading){
                            Text("**Jump shot**")
                                .font(.system(size: 17))
                                .foregroundColor(.black)
                            
                           
                                Text("10min")
                                    .font(.system(size: 20))
                                    .foregroundColor(.black)
                                    .frame(width: 80, height: 30)
                                    .background(.regularMaterial)
                                    .cornerRadius(30)
                        }
                        .offset(x: -40 ,y: -5)
                        

                    }
                    
                }
                .frame(width: 230, height: 95)
                .background(.white)
                .cornerRadius(20)
                .shadow(radius: 5)
                
            }
            
            VStack(alignment: .leading){
                HStack{
                    Spacer()
                    
                    Image("workout2")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .padding(.leading, -2)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .offset(x: -50, y: 0)
                    
                    VStack(alignment: .leading){
                        VStack(alignment: .leading){
                            Text("**Jump shot**")
                                .font(.system(size: 17))
                                .foregroundColor(.black)
                            
                           
                                Text("10min")
                                    .font(.system(size: 20))
                                    .foregroundColor(.black)
                                    .frame(width: 80, height: 30)
                                    .background(.regularMaterial)
                                    .cornerRadius(30)
                        }
                        .offset(x: -50 ,y: -5)
                        

                    }
                    
                }
                .frame(width: 230, height: 95)
                .background(.white)
                .cornerRadius(20)
                .shadow(radius: 5)
                .offset(y: 120)
            }
        }
    }
}

struct BestForYou_Previews: PreviewProvider {
    static var previews: some View {
        BestForYou()
    }
}
