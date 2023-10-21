//
//  CategotyView.swift
//  StoreApp
//
//  Created by Алексей Авер on 18.10.2023.
//

import SwiftUI

struct CategotyView: View {
    @EnvironmentObject var storeModel: StoreModel
    @State private var errorMessage = ""
    var body: some View {
        VStack {
            List(storeModel.categories, id: \.self) { category in
                HStack {
                    AsyncImage(url: category.image) { image in
                        image.resizable()
                            .frame(maxWidth: 100, maxHeight: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    } placeholder: {
                        ProgressView()
                    }
                    Text(category.name)
                }
            }.task {
                do {
                    try await storeModel.fetchCategories()
                } catch {
                    errorMessage = error.localizedDescription
                }
            }
            Text(errorMessage)
        }
        
    }
}

#Preview {
    CategotyView()
        .environmentObject(StoreModel())
}
