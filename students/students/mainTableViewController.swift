//
//  mainTableViewController.swift
//  students
//
//  Created by Admin on 31/03/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class mainTableViewController: UITableViewController {
    
    var studentsName: [String] = ["Вася", "Иван", "Алексей", "Петр", "Николай"]
    var studentsSurname: [String] = ["Иванов", "Алексеев", "Петров", "Цветочкин", "Васечкин"]
    var studentsPoint: [String] = ["5", "4", "3", "2", "1"]
    
        func presentAlert(title: String, message : String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default)
        
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true, completion: nil)
        }
    
    @IBAction func saveToMainViewController(_ segue: UIStoryboardSegue ) {
        let editViewController = segue.source as! editTableViewController
        let index = editViewController.index
        let name1 = editViewController.editedStudentsName
        let surname1 = editViewController.editedStudentsSurname
        let point1 = editViewController.editedStudentsPoint
        let characterset1 = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZйцукенгшщзхъэждлорпавыфячсмитьбюЙЦУКЕНГШЩЗХЪЭЖДЛОРПАВЫФЯЧСМИТЬБЮ")
        let characterset2 = CharacterSet(charactersIn: "12345")
        if name1?.rangeOfCharacter(from: characterset1.inverted) != nil || surname1?.rangeOfCharacter(from: characterset1.inverted) != nil{
            presentAlert(title: "Ошибка", message: "В полях Имя и Фамилия допускается ввод только русских и английских букв")
        } else {
           if point1?.rangeOfCharacter(from: characterset2.inverted) != nil{
            presentAlert(title: "Ошибка", message: "В поле средний балл допускается число от 1 до 5")
           } else {
            
                if editViewController.studentsNameArray == nil && editViewController.studentsSurnameArray == nil && editViewController.studentsPointArray == nil {
                    studentsName.append(editViewController.editedStudentsName!)
                    studentsSurname.append(editViewController.editedStudentsSurname!)
                    studentsPoint.append(editViewController.editedStudentsPoint!)
                    let indexToInsert = studentsName.count == 0 ? 0 : studentsName.count - 1
                    let indexPath = NSIndexPath(row: indexToInsert, section: 0)
                    tableView.insertRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
                    tableView.reloadData()
                } else {
                let studentsNameString = editViewController.editedStudentsName
                studentsName[index!] = studentsNameString!
                let studentsSurnameString = editViewController.editedStudentsSurname
                studentsSurname[index!] = studentsSurnameString!
                let studentsPointString = editViewController.editedStudentsPoint
                studentsPoint[index!] = studentsPointString!
                tableView.reloadData()
        }
        }
    }
    
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return studentsName.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)

        cell.textLabel?.text = "\(studentsSurname[indexPath.row]) \(studentsName[indexPath.row])"
        cell.detailTextLabel?.text = "Cредний балл: \(studentsPoint[indexPath.row])"
        
        return cell
    }
    
  
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "edit" {
            var path = tableView.indexPathForSelectedRow
            let editViewController = segue.destination as! editTableViewController
            
            editViewController.index = path?.row
            editViewController.studentsNameArray = studentsName
            editViewController.studentsSurnameArray = studentsSurname
            editViewController.studentsPointArray = studentsPoint	
        }
        if segue.identifier == "add" {
           
            let editViewController = segue.destination as! editTableViewController
            
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.studentsName.remove(at: indexPath.row)
            self.studentsSurname.remove(at: indexPath.row)
            self.studentsPoint.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        
    }
    

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
    
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
 


}
