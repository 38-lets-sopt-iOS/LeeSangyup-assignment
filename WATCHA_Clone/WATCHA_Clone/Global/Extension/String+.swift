//
//  String+.swift
//  WATCHA_Clone
//
//  Created by 이상엽 on 4/22/26.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        let regex = /^[A-Z0-9a-z._%+-]+@([A-Za-z0-9-]+\.)+[A-Za-z]{2,}$/
        return self.wholeMatch(of: regex) != nil
    }
    
    var isValidPassword: Bool {
        let regex = /^(?=.*[!_@$%^&+=])[A-Za-z0-9!_@$%^&+=]{8,15}$/
        return self.wholeMatch(of: regex) != nil
    }
}
