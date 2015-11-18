//
//  WordGrabber.swift
//  Wording
//
//  Created by Jacob Apenes on 8/11/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class WordGrabber {
    var word : String = "LION"
    var mixedLength : Int = 20
    var oLength : Int = 426
    var iLength : Int = 322
    var wordIndexer : UInt32 = 0
    var listIndexer : UInt32 = 0
    var mixedFileContent : NSString? = ""
    var oFileContent : NSString? = ""
    var iFileContent : NSString? = ""
    
    func loadNewWord(lists: Int) -> String {
        mixedFileContent = NSString(contentsOfFile:(NSBundle.mainBundle().pathForResource("mixedwords", ofType:"txt"))!, encoding: NSUTF8StringEncoding, error: nil)!
        oFileContent = NSString(contentsOfFile:(NSBundle.mainBundle().pathForResource("owords", ofType:"txt"))!, encoding: NSUTF8StringEncoding, error: nil)!
        iFileContent = NSString(contentsOfFile:(NSBundle.mainBundle().pathForResource("iwords", ofType:"txt"))!, encoding: NSUTF8StringEncoding, error: nil)!
        word = ""
        
        var mixedArray = mixedFileContent?.componentsSeparatedByString(",")
        var oArray = oFileContent?.componentsSeparatedByString(",")
        var iArray = iFileContent?.componentsSeparatedByString(",")
        
        switch lists {
        case 1:
            wordIndexer = arc4random_uniform(UInt32(oLength)) + 1
            word = oArray![Int(wordIndexer)] as String
            break;
            
        case 2:
            wordIndexer = arc4random_uniform(UInt32(iLength)) + 1
            word = iArray![Int(wordIndexer)] as String
            break;
            
        case 3:
            listIndexer = arc4random_uniform(UInt32(3)) + 1
            switch listIndexer {
            case 1 :
                wordIndexer = arc4random_uniform(UInt32(oLength)) + 1
                word = oArray![Int(wordIndexer)] as String
                break;
                
            case 2 :
                wordIndexer = arc4random_uniform(UInt32(iLength)) + 1
                word = iArray![Int(wordIndexer)] as String
                break;
                
            case 3 :
                wordIndexer = arc4random_uniform(UInt32(mixedLength)) + 1
                word = mixedArray![Int(wordIndexer)] as String
                break;
                
            default:
                println("Something went wrong :(")
                break;
            }
            
            break;
            
        default:
            println("Something went wrong :(")
            break;
        }
        
        return word
    }
    
}