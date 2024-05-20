//
//  MoreView.swift
//  iOS-Odyssey-of-Life
//
//  Created by Roshan Ekka on 20/05/24.
//

import SwiftUI

struct MoreView: View {
    
    @State public var morePath = NavigationPath()
    
    var body: some View {

        
        NavigationStack(path: $morePath){
            List{
                NavigationLink(value: 0) {
                    Text("Account")
                }
                NavigationLink(value: 1) {
                    Text("Subscribe")
                }
                Section(){
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Log out")
                            .foregroundStyle(.red)
                    })
                }
                
            }
        }
        
    }
}

//
//#Preview {
//    let selectedDate1 = Date
//    MoreView(selectedDate: selectedDate1)
//}
