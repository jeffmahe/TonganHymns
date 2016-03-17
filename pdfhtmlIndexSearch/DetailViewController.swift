//
//  DetailViewController.swift
//  pdfhtmlIndexSearch
//
//  Created by Jeff Mahe on 3/17/16.
//  Copyright © 2016 jmahe. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var songImageView: UIWebView!
    var passOption = String()
    var passType = String()
    var urlCompare = String()
    
    var detailSong: TitleList? {
        didSet {
            configureView()
        }
    }
    
    func configureView() {
        if let detailSong = detailSong {
            if let songImageView = songImageView {
                if passOption == "Show PDF" {
                    passType = "pdf"
                } else {
                    passType = "html"
                }
                
                urlCompare = detailSong.url
                
                // There are missing pdf and html files, so check for them and return missing messages
                let checkPDFUrls = ["10","11","12","13","14","15"]
                let checkHTMLUrls = ["16","17","18","19","20","21"]
                
                if  checkPDFUrls.contains(urlCompare) && passType == "pdf" {
                    urlCompare = "missingpdf"
                    passType = "html"
                } else if checkHTMLUrls.contains(urlCompare) && passType == "html" {
                    urlCompare = "missinghtml"
                    passType = "html"
                }

                let path = NSBundle.mainBundle().pathForResource(urlCompare, ofType:passType)
                let url = NSURL.fileURLWithPath(path!)
                let urlRequest = NSMutableURLRequest(URL: url)
                songImageView.loadRequest(urlRequest)
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}


