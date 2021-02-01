//
//  SeparatedView.swift
//  NavTest
//
//  Created by Alexander Skorulis on 1/2/21.
//

import SwiftUI

struct SeparatedView: View {
    
    let items: [AnyView]
    
    public init<A: View>(@ViewBuilder content: () -> A) { // this init will be used for any non-supported number of TupleView
            let views = content()
            self.items = [AnyView(views)]
        }
        
        // MARK: TupleView support
        
        public init<A: View, B: View>(@ViewBuilder content: () -> TupleView<(A, B)>) {
            let views = content().value
            self.items = [AnyView(views.0), AnyView(views.1)]
        }
        
        public init<A: View, B: View, C: View>(@ViewBuilder content: () -> TupleView<(A, B, C)>) {
            let views = content().value
            self.items = [AnyView(views.0), AnyView(views.1), AnyView(views.2)]
        }
        
        public init<A: View, B: View, C: View, D: View>(@ViewBuilder content: () -> TupleView<(A, B, C, D)>) {
            let views = content().value
            self.items = [AnyView(views.0), AnyView(views.1), AnyView(views.2), AnyView(views.3)]
        }
        
        // MARK: ForEach support
        
        public init<Data, Content: View, ID : Hashable>(@ViewBuilder content: () -> ForEach<Data, ID, Content>) {
            let views = content()
            self.items = views.data.map({ AnyView(views.content($0)) })
        }
    
    var body: some View {
        VStack(alignment:.leading, spacing: 0) {
            ForEach(0..<items.count) { index in
                Group {
                    self.items[index]
                }.padding()
                
                
                if index < items.count - 1 {
                    Rectangle()
                        .frame(height: 1)
                }
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 5)
                .stroke()
        )
        
        .padding()
        
    }
}

struct SeparatedView_Previews: PreviewProvider {
    static var previews: some View {
        SeparatedView {
            Text("V13")
            Text("V2Test")
            Text("V2Test")
            Text("V2Test")

            
        }
    }
}
