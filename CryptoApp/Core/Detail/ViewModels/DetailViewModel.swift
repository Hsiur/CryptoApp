//
//  DetailViewModel.swift
//  CryptoApp
//
//  Created by Ruslan Ishmukhametov on 28.03.2022.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    @Published var overviewStatistics: [StaticticModel] = []
    @Published var addtionalStatistics: [StaticticModel] = []
    @Published var coinDescription: String? = nil
    @Published var websiteURL: String? = nil
    @Published var redditURL: String? = nil

    
    @Published var coin: CoinModel
    private let coinDetailServise: CoinDetailDataService
    private var cancelables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coin = coin
        self.coinDetailServise = CoinDetailDataService(coin: coin)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        
        coinDetailServise.$coinDetails
            .combineLatest($coin)
            .map(mapDataToStatistics)
            .sink { [weak self] (returnedArrays) in
                print("Recieved coin detail data")
                self?.overviewStatistics = returnedArrays.overview
                self?.addtionalStatistics = returnedArrays.additional
                 
            }
            .store(in: &cancelables)
        
        coinDetailServise.$coinDetails
            .sink { [weak self] (returnedCoinDetails) in
                self?.coinDescription = returnedCoinDetails?.readableDescription
                self?.websiteURL = returnedCoinDetails?.links?.homepage?.first
                self?.redditURL = returnedCoinDetails?.links?.subredditURL
            }
            .store(in: &cancelables)
        
    }
    
    private func mapDataToStatistics(coinDetailModel: CoinDetailModel?, coinModel: CoinModel) -> (overview: [StaticticModel], additional: [StaticticModel]) {
        let overviewArray = createOverviewArray(coinModel: coinModel)
        let additionalArray = createAdditionalArray(coinModel: coinModel, coinDetailModel: coinDetailModel)
        return (overviewArray, additionalArray)
    }
    
    private func createOverviewArray(coinModel: CoinModel) -> [StaticticModel] {
        let price = coinModel.currentPrice.asCurrentsyWith6Decimals()
        let pricePercentChange = coinModel.priceChangePercentage24H
        let priceStat =  StaticticModel(title: "?????????????? ??????????????????", value: price, percentageChange: pricePercentChange)
        
        let marketCap = "$" + (coinModel.marketCap?.formattedWithAbbreviations() ?? "")
        let marketCapPercentChange = coinModel.marketCapChangePercentage24H
        let marketCapStat =  StaticticModel(title: "???????????????? ??????????????????????????", value: marketCap, percentageChange: marketCapPercentChange)
        
        let rank = "\(coinModel.rank)"
        let rankStat = StaticticModel(title: "??????????????????", value: rank)
        
        let volume = "$" + (coinModel.totalVolume?.formattedWithAbbreviations() ?? "")
        let volumeStat = StaticticModel(title: "??????????", value: volume)
        
        let overviewArray: [StaticticModel] = [
            priceStat, marketCapStat, rankStat, volumeStat
        ]
        
        return overviewArray

    }
    
    private func createAdditionalArray(coinModel: CoinModel, coinDetailModel: CoinDetailModel?) -> [StaticticModel]{
        let high = coinModel.high24H?.asCurrentsyWith6Decimals() ?? "??/??"
        let highStat = StaticticModel(title: "???????????????? ???? 24??", value: high)
        
        let low = coinModel.low24H?.asCurrentsyWith2Decimals() ?? "??/??"
        let lowStat =  StaticticModel(title: "?????????????? ???? 24??", value: low)
        
        let priceChange = coinModel.priceChange24H?.asCurrentsyWith6Decimals() ?? "??/??"
        let pricePercentChange = coinModel.priceChangePercentage24H
        let priceChangeStat = StaticticModel(title: "?????????????????? ???? 24??", value: priceChange, percentageChange: pricePercentChange)
        
        let marketCapChange = "$" + (coinModel.marketCapChange24H?.formattedWithAbbreviations() ?? "")
        let marketCapPercentChange = coinModel.marketCapChangePercentage24H
        let marketCapChangeStat = StaticticModel(title: "?????????????????? ???????????? ???? 24??", value: marketCapChange, percentageChange: marketCapPercentChange)
        
        let blockTime = coinDetailModel?.blockTimeInMinutes ?? 0
        let blockTImeString = blockTime == 0 ? "??/??" : "\(blockTime)"
        let blockStat = StaticticModel(title: "Block Time", value: blockTImeString)
        
        let hashing = coinDetailModel?.hashingAlgorithm ?? "??/??"
        let hashingStat = StaticticModel(title: "???????????????? ??????????????????????", value: hashing)
        
        let additionalArray: [StaticticModel] = [
            highStat, lowStat, priceChangeStat, marketCapChangeStat, blockStat, hashingStat
        ]
        
        return additionalArray

    }
    
}
