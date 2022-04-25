//
//  CoinRowView.swift
//  CryptoApp
//
//  Created by Ruslan Ishmukhametov on 13.03.2022.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: CoinModel
    let showHoldingColomn: Bool
        
    var body: some View {
        HStack(spacing: 0) {
            leftColomn
            Spacer()
            if showHoldingColomn {
                centerColomn
            }
            rightColomn
        }
        .font(.subheadline)
        .background(Color.theme.background.opacity(0.001))
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoinRowView(coin: dev.coin, showHoldingColomn: true)
                .previewLayout(.sizeThatFits)
            
            CoinRowView(coin: dev.coin, showHoldingColomn: true)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)

        }
    }
}

extension CoinRowView {
    private var leftColomn: some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .frame(minWidth: 30)
            CoinImageView(coin: coin)
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundColor(Color.theme.accent)
        }
    }
    
    private var centerColomn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrentsyWith2Decimals())
                .bold()
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .foregroundColor(Color.theme.accent)
    }
    
    private var rightColomn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice.asCurrentsyWith6Decimals())
                .bold()
                .foregroundColor(Color.theme.accent)
            Text(coin.priceChangePercentage24H.asPercentString() ?? "")
                .foregroundColor(
                    (coin.priceChangePercentage24H ?? 0) >= 0 ? Color.theme.green :
                        Color.theme.red
                )
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
}
