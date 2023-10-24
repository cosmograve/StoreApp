//
//  ProductCellView.swift
//  StoreApp
//
//  Created by Алексей Авер on 24.10.2023.
//

import SwiftUI

struct ProductCellView: View {
    let product: Product
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .firstTextBaseline) {
                Text(product.title)
                    .bold()
                Spacer()
                Text(product.price, format: .currency(code: "RUB"))
                    .bold()
                    .padding(5)
                    .foregroundStyle(.white)
                    .background(Color.red)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                    
            }
            Text(product.description)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 16).fill(Color.gray.opacity(0.2)))
        
    }
}

#Preview {
    ProductCellView(product: Product.preview)
}
