//
//  String+Extension.swift
//  MVVMWithCoordinator
//
//  Created by waqas ahmed on 15/03/2025.
//

import Foundation
extension String{
    var isValidPhoneNumber: Bool{
        return self.count == 10 && self.allSatisfy{ $0.isNumber }
    }
}
