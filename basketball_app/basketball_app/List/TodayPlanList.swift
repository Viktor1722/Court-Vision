//
//  TodayPlanList.swift
//  basketball_app
//
//  Created by Viktor on 07/05/2023.
//

import SwiftUI

struct TodayPlanList: View {
    var body: some View {
        ScrollView {
          VStack(spacing: 16) {
                TodayPlan()
                TodayPlan()
                TodayPlan()
            }
            .padding(.horizontal)
        }
    }
}

struct TodayPlanList_Previews: PreviewProvider {
    static var previews: some View {
        TodayPlanList()
    }
}
