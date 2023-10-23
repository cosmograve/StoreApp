//
//  ProductView.swift
//  StoreApp
//
//  Created by Алексей Авер on 22.10.2023.
//

import SwiftUI

struct ProductView: View {
    @EnvironmentObject private var storeModel: StoreModel
    let category: Category
    var body: some View {
        List(storeModel.products, id: \.id) { product in
            Text(product.title)
        }
    }
}

#Preview {
    NavigationStack {
        ProductView(category: Category(id: 1,
                                       name: "Other",
                                       image: URL(string: "https://placeimg.com/640/480/any?r=0.591926261873231")!))
        
            .environmentObject(StoreModel())
    }
    
}
