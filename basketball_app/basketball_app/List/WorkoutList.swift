//
//  WorkoutList.swift
//  basketball_app
//
//  Created by Viktor on 05/05/2023.
//

import SwiftUI

struct WorkoutList: View {
    var body: some View {
        ScrollView {
          HStack(spacing: 16) {
                WorkoutsView()
                WorkoutsView()
                WorkoutsView()
            }
            .padding(.horizontal)
        }
    }
}





struct WorkoutList_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutList()
    }
}
