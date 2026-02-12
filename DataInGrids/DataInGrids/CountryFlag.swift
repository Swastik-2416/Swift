//
//  CountryFlag.swift
//  DataInGrids
//
//  Created by Swastik Mandal on 04/02/26.
//

import SwiftUI

struct CountryFlag: View {
    let flag = CountryData()
    var body: some View {
        VStack {
            Image(flag.flag)
            Text(
        }
    }
}

#Preview {
    CountryFlag()
}
