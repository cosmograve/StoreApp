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
        NavigationStack {
            VStack {
                List(storeModel.categories, id: \.self) { category in
                    NavigationLink(value: category) {
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
                    }
                    .navigationDestination(for: Category.self) { category in
                        ProductView(category: category)
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
            .navigationTitle("Store")
        }
    }
}

#Preview {
    CategotyView()
        .environmentObject(StoreModel())
}
