//
//  MultiContactPickerProtocol.swift
//  MultiContactPicker
//
//  Created by Radwa on 5/7/18.
//  Copyright © 2018 Radwa. All rights reserved.
//

import Foundation
import Contacts

public protocol MultiContactPickerProtocol {
    func selectedContacts(cNContact : [CNContact])
}
