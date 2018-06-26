//
//  ViewController.swift
//  FlickrSearch
//
//  Created by user on 27/06/18.
//  Copyright © 2018 pankajBhardwaj. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate {
    var viewModelObj: ViewModel?
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchField: UITextField!
    var pageNo = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        viewModelObj = ViewModel()
        let collectionViewLayout = CustomImageFlowLayout()
        self.collectionView.collectionViewLayout = collectionViewLayout
        searchField.text = "kittens"
        self.searchForThisText(searchField.text ?? "")
    }
    @IBAction func searchForThisText(_ sender: Any) {
        dismissKeyboard()
        pageNo = 1
        self.collectionView.setContentOffset(CGPoint(x:0,y:0), animated: true)
        viewModelObj?.responseArray = nil
        viewModelObj?.getList(pageNo: pageNo, text: searchField.text!, completionHandler: {
            self.collectionView.reloadData()
        })
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (viewModelObj?.numberOfItemsToDisplay())!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCollectionViewCell
        cell.tag = indexPath.row
        if let url = (viewModelObj?.imageUrlForCell(for: indexPath)){
            cell.myImageView.downloadImage(from: url, placeholder: UIImage(named: "placeholder")!)
        }
        if indexPath.row == (viewModelObj?.numberOfItemsToDisplay())! - 1 {
            downloadMoreImages()
        }
        return cell
    }
    
    private func downloadMoreImages()
    {
        pageNo = pageNo + 1
        viewModelObj?.getList(pageNo: pageNo, text: searchField.text!, completionHandler: {
            self.collectionView.reloadData()
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
}
