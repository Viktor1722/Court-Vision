//
//  VideoListItemView.swift
//  basketball_app
//
//  Created by Viktor on 15/05/2023.
//

import SwiftUI

struct VideoListItemView: View {
    var body: some View {

            HStack(spacing: 20) {
                Image("workout1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .cornerRadius(10)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Free throw basics")
                        .font(.system(size: 25))
                        .foregroundColor(.white)

                    Text("3min")
                        .font(.headline)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Button(action: {
                    // Handle play button action
                }) {
                    Image(systemName: "play.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .padding(15)
                        .foregroundColor(Color("Elgreen"))
                        .background(Color("Colornav"))
                        .cornerRadius(30)
                        
                }
            }
            .frame(width: 330)
            .padding(10)
            .background(Color.gray.opacity(0.3))
            .cornerRadius(15)
        }
    }

struct VideoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListItemView()
    }
}
