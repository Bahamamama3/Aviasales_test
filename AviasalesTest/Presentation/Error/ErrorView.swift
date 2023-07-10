//
//  ErrorView.swift
//  AviasalesTest
//
//  Created by Канат Кузебаев on 10/7/23.
//

import SwiftUI

struct ErrorView: View {
    let retry: ()->()
    var body: some View {
        VStack(spacing: 0) {
            Image("cat")
                .cornerRadius(15)
            Text("Упс, что-то пошло не так..")
                .font(.system(size: 20, weight: .bold))
                .multilineTextAlignment(.center)
                .padding(EdgeInsets(top: 20, leading: 16, bottom: 0, trailing: 16))
            Button {
                retry()
            } label: {
                Text("Обновить страницу")
                    .font(.system(size: 15, weight: .bold))
            }
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .foregroundColor(Color.blue)
            .cornerRadius(8)
            .padding(EdgeInsets(top: 16, leading: 50, bottom: 16, trailing: 50))
        }
    }
}
