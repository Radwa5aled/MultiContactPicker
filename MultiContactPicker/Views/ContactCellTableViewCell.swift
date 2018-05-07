//
//  ContactCellTableViewCell.swift
//  FootballHub
//
//  Created by Radwa on 4/1/18.
//  Copyright © 2018 Mohamed Helmy. All rights reserved.
//

import UIKit
import Contacts
import ContactsUI

protocol ContactCellTableViewCellProtocaol {
    func contactInfo(sender: Any)

}

class ContactCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var imgSelected: UIImageView!
    @IBOutlet weak var imgUser: UIImageView!
   
 //   @IBOutlet weak var btnSelected: UIButton!
    var contact  : ExtededContacts? = nil
    var store : CNContactStore = CNContactStore()
    var parent = MultiContactPickerController()
    var delegate : ContactCellTableViewCellProtocaol!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setCell(contact: ExtededContacts){
        
        self.contact = contact
        lbl1.text = contact.fullName
        lbl2.text = contact.organizationName
        lbl3.text = contact.phoneNumbers.count != 0 ? contact.phoneNumbers[0] : ""
        
         let testBundle = Bundle(for: ContactCellTableViewCell.self)
        
        if (contact.isSelected){
            
            let testImage = UIImage(named: "icon-checkbox-selected-green", in: testBundle, compatibleWith: nil)
            
            imgSelected.image =  testImage//UIImage(named: "icon-checkbox-selected-green.png")
            
        }else{
            
            let testImage = UIImage(named:  "icon-checkbox-unselected", in: testBundle, compatibleWith: nil)
            
            imgSelected.image =  testImage // UIImage(named: "icon-checkbox-unselected.png")
            
        }
        
        
    }
    
    
}

