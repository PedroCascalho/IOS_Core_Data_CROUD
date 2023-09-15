//
//  ViewController.swift
//  HoppingThrougTime
//
//  Created by Usuário Convidado on 14/09/23.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var txtTelefone: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtIdade: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func salvar(_ sender: Any) {
        
        save(nome: txtNome.text!, tele: txtTelefone.text!, emai: txtEmail.text!, idad:Int(txtIdade.text!)!)
        navigationController?.popViewController(animated: true)
        
    }
    
    func save(nome:String, tele:String, emai:String, idad:Int){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entidade = NSEntityDescription.entity(forEntityName: "Jogadores", in: managedContext)!
        //inicio processo de gravacao
        let jogadores = NSManagedObject(entity: entidade, insertInto: managedContext)
        jogadores.setValue(nome, forKeyPath: "nome")
        jogadores.setValue(tele, forKeyPath: "telefone")
        jogadores.setValue(emai, forKeyPath: "email")
        jogadores.setValue(idad, forKeyPath: "idade")
        
        do{
            try managedContext.save()
        }catch let erro as NSError{
            print("Não foi possível salvar \(erro.localizedDescription)")
        }
        
    }
    
}

