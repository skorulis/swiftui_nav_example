//
//  FormExampleView.swift
//  NavTest
//
//  Created by Alexander Skorulis on 1/2/21.
//

import SwiftUI

struct FormExampleView: View {
    
    @State var notificationsEnabled: Bool = true
    @State var previewIndex = 0
    var previewOptions = ["Always", "When Unlocked", "Never"]

    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Form {
                    Section(header: Text("Form ")) {
                        Toggle(isOn: $notificationsEnabled) {
                            Text("Enabled")
                        }

                        Picker(selection: $previewIndex, label: Text("Show Previews")) {
                            ForEach(0 ..< previewOptions.count) {
                                Text(self.previewOptions[$0]).tag($0)
                            }
                        }
                    }
                }
                
            }
        }
        
    }
}

struct FormExampleView_Previews: PreviewProvider {
    static var previews: some View {
        FormExampleView()
    }
}
