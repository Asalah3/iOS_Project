//
//  InstructionTableViewCell.swift
//  iOS_Project
//
//  Created by Esraa AbdElfatah on 27/05/2023.
//

import UIKit

class InstructionTableViewCell: UITableViewCell {

    @IBOutlet weak var instructionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
