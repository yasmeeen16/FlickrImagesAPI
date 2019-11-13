//
//  ViewController.swift
//  flickerImages
//
//  Created by yasmeen on 11/13/19.
//  Copyright © 2019 yasmeen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var images = [photo]() {
        didSet {
            ImagesCollection.reloadData()
        }
    }
    
    @IBOutlet weak var ImagesCollection: UICollectionView!
    
    @IBOutlet weak var searchText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        ImagesCollection.delegate = self
        ImagesCollection.dataSource = self
        let layout = self.ImagesCollection.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 9, left:18, bottom: 0, right: 18)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (self.ImagesCollection.frame.size.width-10)/2, height: (self.ImagesCollection.frame.size.height/3)+10)
        
        getImages()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func SearchAction(_ sender: Any) {
        print(self.searchText.text ?? "")
        searchForImages()
    }
    func getImages()  {
        Network.getImages(endpoint: "") { (error : Error?, success : Bool? ,results:[photo], lastPage:Int) in
            if success!{
                print("sucess")
                self.images = results
            }else{
                print("failed")
            }
        }
    }
    func searchForImages()  {
        Network.searchforImage(endpoint: self.searchText.text ?? "") { (error : Error?, success : Bool? ,results:[photo], lastPage:Int) in
            if success!{
                print("sucess")
                self.images = results
            }else{
                print("failed")
            }
        }
    }
}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ImagesCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCollectionViewCell
         cell.configrationCell(photo: self.images[indexPath.row])
        return cell
    }
    
    
    
}
