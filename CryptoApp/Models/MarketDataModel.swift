//
//  MarketDataModel.swift
//  CryptoApp
//
//  Created by Ruslan Ishmukhametov on 21.03.2022.
//

import Foundation

// JSON data
/*
 
 URL: https://api.coingecko.com/api/v3/global
 
 JSON Responce:
 {
 "data": {
   "active_cryptocurrencies": 13306,
   "upcoming_icos": 0,
   "ongoing_icos": 49,
   "ended_icos": 3376,
   "markets": 775,
   "total_market_cap": {
     "btc": 46944611.98521384,
     "eth": 680418655.3519719,
     "ltc": 17133560023.551085,
     "bch": 6077491923.071037,
     "bnb": 4977963106.052775,
     "eos": 888880900828.703,
     "xrp": 2406917419850.0127,
     "xlm": 9926355136679.576,
     "link": 133068034135.16545,
     "dot": 103943745233.24464,
     "yfi": 97482534.50136273,
     "usd": 1934911544953.2275,
     "aed": 7106930104613.196,
     "ars": 211943169491064.5,
     "aud": 2605944673477.645,
     "bdt": 166871802406783.44,
     "bhd": 729012752968.939,
     "bmd": 1934911544953.2275,
     "brl": 9720511873958.797,
     "cad": 2438965676971.2705,
     "chf": 1803529116139.3599,
     "clp": 1554720775485368,
     "cny": 12308359319756.494,
     "czk": 43536477217220.13,
     "dkk": 13031532509682.732,
     "eur": 1748645350166.7637,
     "gbp": 1467955471986.5764,
     "hkd": 15131985411864.434,
     "huf": 657095960666118.2,
     "idr": 27751178596759930,
     "ils": 6278923407181.383,
     "inr": 146950065364814.53,
     "jpy": 230670512744444.75,
     "krw": 2343893798209993,
     "kwd": 587443014870.8918,
     "lkr": 536767609916838.44,
     "mmk": 3429207521185956.5,
     "mxn": 39399636334110.125,
     "myr": 8113084107988.874,
     "ngn": 804768409776944.9,
     "nok": 16921952732985.225,
     "nzd": 2800366520426.0913,
     "php": 101593697419430.73,
     "pkr": 349251533864057.7,
     "pln": 8256209514969.059,
     "rub": 208003161354688,
     "sar": 7263536040327.074,
     "sek": 18202041838337.67,
     "sgd": 2624127037265.5684,
     "thb": 64335085212777.21,
     "try": 28654298560366.85,
     "twd": 54895375441867.945,
     "uah": 57101162993645.58,
     "vef": 193742692996.16672,
     "vnd": 44241752475355610,
     "zar": 28875590523940.082,
     "xdr": 1387838524556.241,
     "xag": 77510253946.08794,
     "xau": 1006986015.340009,
     "bits": 46944611985213.836,
     "sats": 4694461198521384
   },
   "total_volume": {
     "btc": 1928749.631182853,
     "eth": 27955438.86854155,
     "ltc": 703943353.2155308,
     "bch": 249697671.5630774,
     "bnb": 204522821.65768558,
     "eos": 36520244542.202995,
     "xrp": 98889753040.99852,
     "xlm": 407830696627.99646,
     "link": 5467185922.023732,
     "dot": 4270595746.8671966,
     "yfi": 4005132.740803005,
     "usd": 79497087543.83652,
     "aed": 291992802548.51117,
     "ars": 8707821679650.281,
     "aud": 107066915995.3018,
     "bdt": 6856035522208.085,
     "bhd": 29951958679.71625,
     "bmd": 79497087543.83652,
     "brl": 399373493548.34955,
     "cad": 100206476334.44376,
     "chf": 74099155802.52254,
     "clp": 63876704812348.086,
     "cny": 505696873283.8538,
     "czk": 1788724218280.095,
     "dkk": 535408909753.36145,
     "eur": 71844220914.34169,
     "gbp": 60311896412.70741,
     "hkd": 621707370622.011,
     "huf": 26997210929886.97,
     "idr": 1140175053534343.8,
     "ils": 257973613875.8781,
     "inr": 6037538119687.817,
     "jpy": 9477246643783.943,
     "krw": 96300386937977.31,
     "kwd": 24135474772.48394,
     "lkr": 22053443108318.574,
     "mmk": 140891200545445.3,
     "mxn": 1618759445111.3723,
     "myr": 333331288071.30615,
     "ngn": 33064428651232.42,
     "nok": 695249331337.9391,
     "nzd": 115054862848.79407,
     "php": 4174042518232.9224,
     "pkr": 14349224301662.496,
     "pln": 339211687636.9235,
     "rub": 8545943906706.133,
     "sar": 298427058323.04663,
     "sek": 747842617029.7533,
     "sgd": 107813950126.95114,
     "thb": 2643248428921.8315,
     "try": 1177280319145.4297,
     "twd": 2255411870706.183,
     "uah": 2346038073523.6406,
     "vef": 7960043375.764353,
     "vnd": 1817700906689824.5,
     "zar": 1186372242053.644,
     "xdr": 57020240005.86724,
     "xag": 3184558725.471919,
     "xau": 41372669.27043887,
     "bits": 1928749631182.8528,
     "sats": 192874963118285.28
   },
   "market_cap_percentage": {
     "btc": 40.4498752827715,
     "eth": 17.635028556130777,
     "usdt": 4.175426185942708,
     "bnb": 3.3759336740732984,
     "usdc": 2.7351145969641464,
     "xrp": 1.9989495793207164,
     "luna": 1.711656457882236,
     "sol": 1.474587986893205,
     "ada": 1.4452237594837472,
     "avax": 1.1863121318576724
   },
   "market_cap_change_percentage_24h_usd": -2.4442764203015908,
   "updated_at": 1647803313
 }
}
 
 
 */


struct GlobalData: Codable {
    let data: MarketDataModel?
}

struct MarketDataModel: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    
    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        if let item = totalMarketCap.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd"}) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var btcDominants: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc" }) {
            return "\(item.value.asPercentString())"
        }
        return ""
    }
}

