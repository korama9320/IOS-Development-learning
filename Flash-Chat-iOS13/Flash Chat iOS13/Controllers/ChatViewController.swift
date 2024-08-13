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
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        tableView.dataSource=self
        tableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        title = K.title
    }
    
    
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
        
        if let message = messageTextfield.text,let user = Auth.auth().currentUser?.email {
            db.collection(K.FStore.collectionName).addDocument(data: [K.FStore.bodyField:message,K.FStore.senderField:user,K.FStore.dateField:Date()]) { error in
                if(error != nil){
                    print(error?.localizedDescription as Any)
                }
            }
            
        }

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
        return cell
    }
    
    
}

//MARK: - Firebase Firestore
extension ChatViewController {
    func loadData(){
        db.collection(K.FStore.collectionName).addSnapshotListener { querySnapshot, error in
            self.message = []
            if(error != nil){
                print(error?.localizedDescription as Any)
            }else{
                if let documents = querySnapshot?.documents{
                    for doc in documents{
                        if let text:String = doc[K.FStore.bodyField] as? String ,let sender:String = doc[K.FStore.senderField] as? String,let date:Date = doc[K.FStore.dateField] as? Date{
                            let message = Message(sender: sender, text: text, date: date)
                            self.message.append(message)
                        }
                    }
                    
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
        }
    }
    
}
