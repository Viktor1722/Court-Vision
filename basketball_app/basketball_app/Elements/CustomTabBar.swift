//
//  CustomTabBar.swift
//  basketball_app
//
//  Created by Viktor on 04/05/2023.
//

import SwiftUI

enum Tab: String, CaseIterable{
    case house
    case basketball
    case stats = "chart.bar"
    case person
}

func getPage(for tab: Tab) -> some View {
        switch tab {
        case .house:
            return AnyView(ContentView())
        case .basketball:
            return AnyView(Explore())
        case .stats:
            return AnyView(TodayPlan())
        case .person:
            return AnyView(TodayPlan())
        }
    }

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    
    @State private var figurePosition: CGPoint = .zero
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Button(action: {
                        withAnimation(.spring()) {
                            selectedTab = tab
                            figurePosition = currentFigurePosition(for: tab)
                        }
                    }) {
                        NavigationLink(destination: getPage(for: tab)){
                            Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
                                .scaleEffect(selectedTab == tab ? 1.25 : 1.0)
                                .foregroundColor(selectedTab == tab ? .white : .green)
                                .font(.system(size: 22))
                                .overlay(
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 26)
                                            .fill(selectedTab == tab ? Color("Elgreen") : .clear)
                                            .frame(width: 80, height: 60)
                                        Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
                                            .foregroundColor(selectedTab == tab ? .black : .white)
                                            .font(.system(size: 22))
                                    }
                                )
                              
                        }
                    }
                        Spacer()
                    }
                }
                .frame(height: 70)
                .background(Color("Colornav"))
                .cornerRadius(30)
                .padding()
            }
        }
    
    private func currentFigurePosition(for tab: Tab) -> CGPoint {
        guard let index = Tab.allCases.firstIndex(of: tab) else {
            return .zero
        }
        let tabWidth: CGFloat = 80
        let xOffset = CGFloat(index) * tabWidth + tabWidth / 2 - 25
        return CGPoint(x: xOffset, y: -25)
    }
    
    
    struct CustomTabBar_Previews: PreviewProvider {
        static var previews: some View {
            CustomTabBar(selectedTab: .constant(.house))
        }
    }
}
