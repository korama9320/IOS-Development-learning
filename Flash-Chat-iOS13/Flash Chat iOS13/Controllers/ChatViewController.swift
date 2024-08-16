//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    var message : [Message] = [Message(sender: "me", text: "hi",date: Date()),Message(sender: "you", text: "bye",date: Date())]
    let db  = Firestore.firestore()
    let user = Auth.auth().currentUser
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        title = K.title
        loadData()
    }

}

//MARK: - UITableViewDataSource
extension ChatViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return message.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier) as! MessageCell
        cell.message.text = message[indexPath.row].text
        cell.isUserInteractionEnabled = false
        cell.container.layer.cornerRadius = 8
        if(message[indexPath.row].sender == user?.email){
            cell.senderImage.isHidden = true
            cell.userImage.isHidden = false
            cell.container.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
            cell.message.textColor = UIColor(named: K.BrandColors.purple)
        }else{
            cell.senderImage.isHidden = false
            cell.userImage.isHidden = true
            cell.container.backgroundColor = UIColor(named: K.BrandColors.purple)
            cell.message.textColor = UIColor(named: K.BrandColors.lightPurple)

        }
        
        return cell
    }
    
    
}

//MARK: - Firebase Firestore
extension ChatViewController {
    @IBAction func logoutPressed(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            self.navigationController!.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    @IBAction func sendPressed(_ sender: UIButton) {

        if let message = messageTextfield.text,let email = user?.email  {
            self.messageTextfield.text=nil
            db.collection(K.FStore.collectionName).addDocument(data: [K.FStore.bodyField:message,K.FStore.senderField:email,K.FStore.dateField:Date()]) { error in
                if(error != nil){
                    print(error?.localizedDescription as Any)
                }else{
                    print("fire base success")
                }
            }
            
        }

    }
    func loadData(){
        db.collection(K.FStore.collectionName).order(by: K.FStore.dateField).addSnapshotListener { querySnapshot, error in
            self.message = []
            if(error != nil){
                print(error?.localizedDescription as Any)
            }else{
                if let documents = querySnapshot?.documents{
                    for doc in documents{
                        print(type(of: doc[K.FStore.dateField]))
                        if let text = doc[K.FStore.bodyField] ,let sender = doc[K.FStore.senderField] ,let date = doc[K.FStore.dateField] {
                            let message = Message(sender: sender as! String,text: text as! String, date: (date as! Timestamp).dateValue())
                            self.message.append(message)
                        }
                    }
                    
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    let indexPath = IndexPath(row: self.message.count-1, section: 0)
                    self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                }
                
            }
        }
    }
    
}
