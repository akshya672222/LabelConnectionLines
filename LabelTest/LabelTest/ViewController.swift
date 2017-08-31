//
//  ViewController.swift
//  LabelTest
//
//  Created by AKSHAY SUNDERWANI on 29/08/17.
//  Copyright © 2017 AKSHAY SUNDERWANI. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tblViewMain: UITableView!
    
    var previousCell: CircleCollectionViewCell?
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? CollectionHolderTableViewCell else {
            return
        }
        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CollectionHolderTableViewCell
        cell.collectionViewCircleHolder.isScrollEnabled = false
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func randomBool() -> Bool {
        return arc4random_uniform(2) == 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_collection", for: indexPath) as! CircleCollectionViewCell
        
        //MARK:- Handle conditions as per your need...
        if previousCell != nil{
            if randomBool(){
                if indexPath.row == 0{
                    cell.lblTop.isHidden = true
                    cell.lblBottom.isHidden = false
                }else{
                    previousCell?.lblBottom.isHidden = false
                    cell.lblTop.isHidden = false
                    cell.lblBottom.isHidden = true
                }
            }else{
                previousCell?.lblBottom.isHidden = true
                cell.lblBottom.isHidden = true
                cell.lblTop.isHidden = true
            }
        }else{
            if randomBool() {
                cell.lblTop.isHidden = true
                cell.lblBottom.isHidden = false
            }else{
                cell.lblTop.isHidden = true
                cell.lblBottom.isHidden = true
            }
        }
        previousCell = cell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: (UIScreen.main.bounds.size.width - 60)/5, height: 100)
    }
}

