
import Foundation
import UIKit



class TravelCell: UITableViewCell {
    
    @IBOutlet weak var providerImage: UIImageView!
    @IBOutlet weak var startEndLabel: UILabel!
    @IBOutlet weak var numberOfStop:  UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var priceLabel:    UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func configureWithTravel(travel : Travel){
    
        startEndLabel.text = travel.departureTimeLabelText()
        numberOfStop.text  = travel.numberOfStopsLabelText()
        durationLabel.text = travel.travelDurationLabelText()
        priceLabel.text    = travel.priceLabelText()
        self.providerImage.sd_setImage(with: travel.providerLogoAsUrl() , placeholderImage: nil)
    }

}
