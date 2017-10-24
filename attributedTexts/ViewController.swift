//
//  ViewController.swift
//  attributedTexts
//
//  Created by Miklos Kekkoi on 10/18/17.
//  Copyright © 2017 Miklos Kekkoi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(myLabel)
        createAttTxtConst()
        attTxt()
    
    }
    func attTxt() {
        // We set our first attributes which will set the font and its size.
        let attributes = [NSAttributedStringKey.font: UIFont(name: "ArialMT", size: 16)]
        
      
        let str = "Here comes some message."
        
        // Here we create our attributed string that will take the str and the attributes created above
        let attString = NSMutableAttributedString(string: str, attributes: attributes)
        
        // The range stands for paint the background color white from the location 0 the very first letter in a length of 4 characters which is "Here".
        attString.addAttribute(NSAttributedStringKey.backgroundColor, value: UIColor.white, range: NSRange(
            location:0,
            length:4))

        // Here we just changing the font and size of our string in a range specified.
        attString.addAttribute(NSAttributedStringKey.font, value: UIFont(name: "Cochin-Italic", size: 20), range: NSRange(
            location:0,
            length:4))

        // Let`s paint the foreground color to green starting from the 5th position which is the letter "c" to the end of "comes" which is 5 characters lenght.
        attString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.green, range: NSRange(
            location:5,
            length:5))

        // To add an additional String we just create a new attributedString and append it to our original attString. We are adding a \n before and after our String so it will have it`s own line.
        let addedString = NSAttributedString(string: "\nAy Caramba\n")
        attString.append(addedString)

        // Adding an image to our attributed string requires an NSTextAttachment.
        let attachment = NSTextAttachment()
        // Here we are using image literals. Read more about image literals here.
        attachment.image = #imageLiteral(resourceName: "Image")
        // In case our image dimensions are too large, we should set the size of it.
        attachment.bounds.size = CGSize(width: 15, height: 15)
        // Create an attributed string with the attachment initializer and as usual append it to our attString.
        let imageAttachment = NSAttributedString(attachment: attachment)
        attString.append(imageAttachment)

        // Finally we will add a link to our last added string. Just tap and hold "Ay Caramba" for a second then tap open to open Safari and visit the link.
        attString.addAttribute(NSAttributedStringKey.link, value: "http://focusswift.com", range: NSRange(
            location:25,
            length:10))
        // Assign attString to our myLabe`s attributedText property
        myLabel.attributedText = attString
        
    }
    
    
  
    
    let myLabel: UITextView = {
        let label = UITextView()
        label.backgroundColor = UIColor.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    func createAttTxtConst() {
        // X
        myLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        // Y
        myLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        // Width
        myLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
        // Height
        myLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }

}

