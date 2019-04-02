//
//  editTableViewController.swift
//  students
//
//  Created by Admin on 31/03/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class editTableViewController: UITableViewController {
    
    @IBOutlet weak var editStudentsNameTextField: UITextField!
    @IBOutlet weak var editStudentsPointTextField: UITextField!
    
    @IBOutlet weak var editStudentsSurnameTextField: UITextField!
    
    
    var index:Int?
    var studentsNameArray:[String]!
    var editedStudentsName:String?
    var studentsSurnameArray:[String]!
    var editedStudentsSurname:String?
    var studentsPointArray:[String]!
    var editedStudentsPoint:String?
    override func viewDidLoad() {
        
        super.viewDidLoad()
        editStudentsNameTextField.text = studentsNameArray[index!]
        editStudentsSurnameTextField.text = studentsSurnameArray[index!]
        editStudentsPointTextField.text = studentsPointArray[index!]
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        if indexPath.section == 0 && indexPath.row == 0 {
            editStudentsNameTextField.becomeFirstResponder()
            editStudentsSurnameTextField.becomeFirstResponder()
            editStudentsPointTextField.becomeFirstResponder()
        }
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        
    }
   
    

    // MARK: - Table view data source
    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
     */
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "save" {
            editedStudentsName = editStudentsNameTextField.text
            editedStudentsSurname = editStudentsSurnameTextField.text
            editedStudentsPoint = editStudentsPointTextField.text
        }
        
    }
 

 }
