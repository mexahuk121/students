//
//  editTableViewController.swift
//  students
//
//  Created by Admin on 31/03/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class editTableViewController: UITableViewController, UITextFieldDelegate {
    let limitLength = 1
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
        if studentsNameArray != nil && studentsSurnameArray != nil && studentsPointArray != nil {
        editStudentsNameTextField.text = studentsNameArray[index!]
        editStudentsSurnameTextField.text = studentsSurnameArray[index!]
        editStudentsPointTextField.text = studentsPointArray[index!]
    }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = editStudentsPointTextField.text else {return true}
        let newLength = text.count + string.count - range.length
        return newLength <= limitLength
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
            editStudentsNameTextField.becomeFirstResponder()
            editStudentsSurnameTextField.becomeFirstResponder()
            editStudentsPointTextField.becomeFirstResponder()
        }
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
    }
    
    
    

   
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "save" {
            
            editedStudentsName = editStudentsNameTextField.text
            editedStudentsSurname = editStudentsSurnameTextField.text
            editedStudentsPoint = editStudentsPointTextField.text
            
        }
    
}
}
        





