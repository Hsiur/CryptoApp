//
//  InformationView.swift
//  CryptoApp
//
//  Created by Ruslan Ishmukhametov on 31.03.2022.
//

import SwiftUI

struct SettingsView: View {
    
    let defaultURL = URL(string: "https://www.google.com")!
    let youtubeURL = URL(string: "https://www.youtube.com/c/ruzweld")!
    let coingeckoURL = URL(string: "https://www.coingecko.com")!
    
    var body: some View {
        NavigationView {
            ZStack {
                //background layer
                Color.theme.background
                    .ignoresSafeArea()
                
                //Content layer
                List {
                    informationSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    coinGeckoSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                }
            }
            .font(.headline)
            .accentColor(.blue)
            .listStyle(GroupedListStyle())
            .navigationTitle("Настройки")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton()
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
            SettingsView()
    }
}

extension SettingsView {
    
    private var informationSection: some View {
        Section {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("Приложение позволяет следить на текущими котировками криптовалют")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Подписаться на YouTube", destination: youtubeURL)
            Link("Источник данных о Криптовалютах", destination: coingeckoURL)
        } header: {
            Text("Уроки SwiftUI")
        }
    }
    
    private var coinGeckoSection: some View {
        Section {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("Приложение позволяет следить на текущими котировками криптовалют")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Подписаться на YouTube", destination: youtubeURL)
            Link("Источник данных о Криптовалютах", destination: coingeckoURL)
        } header: {
            Text("Уроки SwiftUI")
        }
    }

    
}
