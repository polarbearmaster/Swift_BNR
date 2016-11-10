//
//  ViewController.swift
//  VocalTextEdit
//
//  Created by kenny on 09/11/2016.
//  Copyright © 2016 yuneec. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSSpeechSynthesizerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        speechSynthesizer.delegate = self
        isSpeaking = false
    }
    
    @IBOutlet var textView: NSTextView!
    @IBOutlet weak var playButton: NSButton!
    @IBOutlet weak var stopButton: NSButton!
    @IBOutlet weak var progressIndicator: NSProgressIndicator!
    
    let speechSynthesizer = NSSpeechSynthesizer()
    var isSpeaking: Bool = false {
        didSet {
            playButton.enabled = !isSpeaking
            stopButton.enabled = isSpeaking
            progressIndicator.hidden = !isSpeaking
        }
    }
    var contents: String? {
        get {
            return textView.string
        }
        set {
            textView.string = newValue
        }
    }
    
    @IBAction func speakButtonClicked(sender: NSButton) {
        if let contents = textView.string where !contents.isEmpty {
            speechSynthesizer.startSpeakingString(contents)
            progressIndicator.maxValue = Double(contents.characters.count)
            progressIndicator.doubleValue = 0
            isSpeaking = true
        } else {
            speechSynthesizer.startSpeakingString("The document is empty.")
        }
    }
    
    @IBAction func stopButtonClicked(sender: NSButton) {
        speechSynthesizer.stopSpeaking()
    }
    
    func speechSynthesizer(sender: NSSpeechSynthesizer, didFinishSpeaking finishedSpeaking: Bool) {
         isSpeaking = false
    }
    
    func speechSynthesizer(sender: NSSpeechSynthesizer, willSpeakWord characterRange: NSRange, ofString string: String) {
        progressIndicator.incrementBy(Double(characterRange.length + 1))
    }
}

