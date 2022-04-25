//
//  StatisticView.swift
//  CryptoApp
//
//  Created by Ruslan Ishmukhametov on 20.03.2022.
//

import SwiftUI

struct StatisticView: View {
    
    let stat: StaticticModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(stat.title)
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
            Text(stat.value)
                .font(.headline)
                .foregroundColor(Color.theme.accent)
            
            HStack(spacing: 4) {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(
                        Angle(degrees:(stat.percentageChange ?? 0) >= 0 ? 0 : 180))
                Text(stat.percentageChange?.asPercentString() ?? "")
                    .font(.caption)
                    .bold()
            }
            .foregroundColor(
                (stat.percentageChange ?? 0) >= 0 ?
                Color.theme.green :
                Color.theme.red)
            .opacity(stat.percentageChange == nil ? 0 : 1)
        }
    }
}

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StatisticView(stat: dev.stat1)
                .preferredColorScheme(.light)
            StatisticView(stat: dev.stat2)
                .preferredColorScheme(.dark)
            StatisticView(stat: dev.stat3)
                .preferredColorScheme(.dark)
        }
        .previewLayout(.sizeThatFits)
    }
}
