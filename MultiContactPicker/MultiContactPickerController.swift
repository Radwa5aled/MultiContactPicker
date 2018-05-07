//
//  MultiContactPickerController.swift
//  MultiContactPicker
//
//  Created by Radwa on 5/7/18.
//  Copyright © 2018 Radwa. All rights reserved.
//

import UIKit
import Contacts
import ContactsUI

class MultiContactPickerController: UIViewController {

    @IBOutlet weak var contactsTable: UITableView!
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var searchBar: UISearchBar!
    var delegate : MultiContactPickerProtocol!
    var contacts = [CNContact]()
    var contactStore = CNContactStore()
    var exContacts = [ExtededContacts]()
    var filterdContacts = [ExtededContacts]()
    
    var noOfSelectedContacts = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Contacts"
        
        getContacts()
        
        
        contactsTable.register(ContactCellTableViewCell.self, forCellReuseIdentifier: "ContactCellTableViewCell")
        contactsTable.register(UINib(nibName: "ContactCellTableViewCell",bundle: Bundle(for: ContactCellTableViewCell.self)), forCellReuseIdentifier: "ContactCellTableViewCell")
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func getContacts(){
        let contactStore = CNContactStore()
        let keys = [
            CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
            CNContactPhoneNumbersKey,
            CNContactEmailAddressesKey,CNContactOrganizationNameKey,CNContactJobTitleKey,CNContactEmailAddressesKey,CNContactViewController.descriptorForRequiredKeys()
            
            ] as [Any]
        let request = CNContactFetchRequest(keysToFetch: keys as! [CNKeyDescriptor])
        request.sortOrder = CNContactSortOrder.userDefault
        do {
            try contactStore.enumerateContacts(with: request){
                (contact, stop) in
                // Array containing all unified contacts from everywhere
                
                self.contacts.append(contact)
            }
            print(contacts)
            
            
            
            for phone in contacts{
                let ex : ExtededContacts = ExtededContacts()
                
                ex.emailAddresses =  phone.emailAddresses.count != 0 ? phone.emailAddresses[0].value as String : ""
                ex.fullName =  phone.givenName + " " + phone.middleName + " " + phone.familyName
                ex.identifier = phone.identifier
                ex.isSelected = false
                ex.jobTitle = phone.jobTitle
                ex.organizationName = phone.organizationName
                ex.cNContact = phone
                for phone in phone.phoneNumbers{
                    ex.phoneNumbers.append(phone.value.stringValue)
                }
                
                
                exContacts.append(ex)
            }
            filterdContacts = exContacts
            self.contactsTable.reloadData()
        } catch {
            print("unable to fetch contacts")
        }
    }
    
    //#MARK:- Actions
    
    @IBAction func cancelBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneBtn(_ sender: Any) {
        
        let selectedCnContacts = filterdContacts.filter({$0.isSelected}).map({$0.cNContact})
        
        delegate.selectedContacts(cNContact: selectedCnContacts as! [CNContact])
        self.dismiss(animated: true, completion: nil)
    }
    

}

extension MultiContactPickerController : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            filterdContacts = exContacts
        }else {
            filterdContacts = exContacts.filter({($0.fullName).lowercased().contains(searchText.lowercased())})
        }
        self.contactsTable.reloadData()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}


extension MultiContactPickerController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterdContacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCellTableViewCell", for: indexPath) as! ContactCellTableViewCell
        cell.setCell(contact: filterdContacts[indexPath.row])
        cell.delegate = self
        cell.selectionStyle = .none
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    public func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath){
        
        do {
            let dcontacts = try self.contactStore.unifiedContact(withIdentifier: (filterdContacts[(indexPath.row)].identifier), keysToFetch: [CNContactViewController.descriptorForRequiredKeys()])
            let vc = CNContactViewController(for: dcontacts)
            CNContactViewController.descriptorForRequiredKeys()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        catch { }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let testBundle = Bundle(for: MultiContactPickerController.self)
        
        let currentCell = tableView.cellForRow(at: indexPath) as! ContactCellTableViewCell
        
        if (filterdContacts[(indexPath.row)].isSelected){
            filterdContacts[(indexPath.row)].isSelected = false
            
            let testImage = UIImage(named: "icon-checkbox-unselected", in: testBundle, compatibleWith: nil)

            currentCell.imgSelected.image = testImage //UIImage(named: "icon-checkbox-unselected.png")
            noOfSelectedContacts = noOfSelectedContacts - 1
            
            if noOfSelectedContacts == 0 {
                self.title = "Contacts"
            }else {
                self.title = "Contacts(\(noOfSelectedContacts))"
            }
            
        }else{
            filterdContacts[(indexPath.row)].isSelected = true
            let testImage = UIImage(named: "icon-checkbox-selected-green", in: testBundle, compatibleWith: nil)
            currentCell.imgSelected.image = testImage //UIImage(named: "icon-checkbox-selected-green.png")
            noOfSelectedContacts = noOfSelectedContacts + 1
            self.title = "Contacts(\(noOfSelectedContacts))"
        }
    }
    
    
    
    
}

extension MultiContactPickerController : ContactCellTableViewCellProtocaol{
    func contactInfo(sender:Any) {
        
        let buttonPosition:CGPoint = (sender as AnyObject).convert(CGPoint.zero, to:self.contactsTable)
        let indexPath = self.contactsTable.indexPathForRow(at: buttonPosition)
        
        do {
            let dcontacts = try self.contactStore.unifiedContact(withIdentifier: (filterdContacts[(indexPath?.row)!].identifier), keysToFetch: [CNContactViewController.descriptorForRequiredKeys()])
            let vc = CNContactViewController(for: dcontacts)
            CNContactViewController.descriptorForRequiredKeys()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        catch { }
        
    }
    
    
}
class ExtededContacts {
    
    var fullName:String = ""
    var emailAddresses:String = ""
    var identifier:String = ""
    var phoneNumbers:[String] = []
    var jobTitle:String = ""
    var organizationName:String = ""
    var isSelected = false
    var cNContact:CNContact!
}

