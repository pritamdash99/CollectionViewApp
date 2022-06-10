//
//  ViewController.swift
//  CollectionViewApp
//
//  Created by Pritam Dash on 10/06/22.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate{

    @IBOutlet weak var offersCollectionView: UICollectionView!
    @IBOutlet weak var offersDetailsLabel: UILabel!
    
    var offers = Array<Offer>() //Data of offer cells in array
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Default value of details label.
        offersDetailsLabel.text = "Select an offer from above"
        
        //Assign values to the array elements
        let offer1 = Offer(image: "TwentyPercentOff", details: "20 % off to all customers")
        let offer2 = Offer(image: "TwentyFivePercentOff", details: "25 % off to all customers")
        let offer3 = Offer(image: "FiftyPercentOff", details: "50 % off to all customers")
        let offer4 = Offer(image: "SixtyPercentOff", details: "60 % off to all customers")
        let offer5 = Offer(image: "SeventyPercentOff", details: "70 % off to all customers")
        
        offers = [offer1, offer2, offer3, offer4, offer5]
        
        //Load the UI of OfferCell xib
        
        let nib = UINib(nibName: "OfferCell", bundle: nil)
        
        //Adding the nib to collectionView
        offersCollectionView.register(nib, forCellWithReuseIdentifier: "OfferCell")
        
        //Need to ask the "self" class to generate the UI of the collectionView
        offersCollectionView.dataSource = self
        
        //Need to tell the collectionView that the selection implementation is by different protocol.
        offersCollectionView.delegate = self
    }
    
    //Deciding the amount of section.
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //Deciding the number of items in 1 section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return offers.count
    }
    
    //Decide the UI of cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = offersCollectionView.dequeueReusableCell(withReuseIdentifier: "OfferCell", for: indexPath) as! OfferCell
        
        cell.offerCellImageView.image = UIImage(named: offers[indexPath.row].image)
        //indexPath.row = variable that iterates for every row, so value goes from 1 -> offers.count
        
        return cell
    }
    
    //Upon selection of a cell while swiping we want the detail label to change too, so we need the didSelectEvent. For that we need to inherit another protocol of UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let offer = offers[indexPath.row]   //This is the current selected item.
        offersDetailsLabel.text = offer.details
    }


}

