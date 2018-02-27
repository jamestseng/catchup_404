//
//  ContactViewController.swift
//  CapstoneProject
//
//  Created by Eshita Mathur on 2/22/18.
//  Copyright © 2018 Eshita Mathur. All rights reserved.
//

import UIKit
import Contacts
import MessageUI

class ContactViewController: UIViewController, MFMailComposeViewControllerDelegate, UITableViewDelegate, UITableViewDataSource, MFMessageComposeViewControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var contactStore = CNContactStore()
    var contacts = [ContactStruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        contactStore.requestAccess(for: .contacts) { (success, error) in
            if success {
                print("Authorization Successfull")
            }
        }
        
        fetchContacts()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func sendEmail(_ sender: Any) {
    
        let mailComposeViewController = configureMailController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        }
        else{
            showMailError()
        }
    
    
    }
    
    func configureMailController() -> MFMailComposeViewController {
        let mailComposerVC =  MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients([])
        mailComposerVC.setSubject("Your friend has invited you to Catchup!")
        mailComposerVC.setMessageBody("<a href='http://www.zac-west.com'>Link to Download Catchup</a>", isHTML: true)
        
        return mailComposerVC
    }
    
    func showMailError() {
        let sendMailError = UIAlertController(title: "Could not send email", message: "your device could not send email", preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "Ok", style: .default, handler: nil)
        sendMailError.addAction(dismiss)
        self.present(sendMailError, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let contactToDisplay = contacts[indexPath.row]
        cell.textLabel?.text = contactToDisplay.givenName + " " + contactToDisplay.familyName
        cell.detailTextLabel?.text = contactToDisplay.number
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped")
        if(MFMessageComposeViewController.canSendText()) {
            print("text sending")
            let contactToDisplay = contacts[indexPath.row]
            
            let controller = MFMessageComposeViewController()
            
            controller.body = "Link to Download Catchup!"
            controller.recipients = [contactToDisplay.number]
            controller.messageComposeDelegate = self
            
            self.present(controller,animated: true,completion: nil)
        }
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func fetchContacts() {
        
        let key = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey] as [CNKeyDescriptor]
        let request = CNContactFetchRequest(keysToFetch: key)
        try! contactStore.enumerateContacts(with: request) { (contact, stoppingPointer) in
            
            let name = contact.givenName
            let familyName = contact.familyName
            let number = contact.phoneNumbers.first?.value.stringValue
            
            if number != nil {
                let contactToAppend = ContactStruct(givenName: name, familyName: familyName, number: number!)
                self.contacts.append(contactToAppend)
            }
            else{
                let contactToAppend = ContactStruct(givenName: name, familyName: familyName, number: "N/A")
                self.contacts.append(contactToAppend)
            }
            
        }
        tableView.reloadData()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
