//
//  MultiContactPicker.swift
//  MultiContactPicker
//
//  Created by Radwa on 5/6/18.
//  Copyright © 2018 Radwa. All rights reserved.
//

import UIKit

open class MultiContactPicker: NSObject {
    
    public static let shared = MultiContactPicker()
    
    open func hello(){
        debugPrint("Hello from MultiContactPicker!")
    }
    
    open func openContacts(controller:UIViewController){
        debugPrint("Hello from openContacts!")
        
        let mainStoryBoard = UIStoryboard(name: "Contacts", bundle: Bundle(for: MultiContactPickerController.self))
        let vc = mainStoryBoard.instantiateViewController(withIdentifier: "MultiContactPickerController") as! MultiContactPickerController
        let navigator = UINavigationController(rootViewController: vc)
        vc.delegate = controller as! MultiContactPickerProtocol
        controller.present(navigator, animated: true, completion: nil)
    }

}
