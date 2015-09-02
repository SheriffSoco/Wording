// Playground - noun: a place where people can play

import UIKit

//
//  WordGrabber.swift
//  Wording
//
//  Created by Jacob Apenes on 8/11/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

var newCharacter : String = ""
var word = "WORD"


for ii in 0...3 {
    newCharacter = word.substringWithRange(Range<String.Index>(start: advance(word.startIndex, ii), end: advance(word.endIndex, ii-3)))
    println("\(ii): \(newCharacter)")
}
