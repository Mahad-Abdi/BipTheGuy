//
//  ViewController.swift
//  BipTheGuy
//
//  Created by Mahad Abdi on 2/14/22.
//
import AVFoundation
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func playSound(name: String) {
        if let sound = NSDataAsset(name: name) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("ERROR: \(error.localizedDescription). Could not initialize AVAudioPlayer Object")
            }
        }
        else {
            print("Error: Could not read data from file \(name)")
        }
    }

    @IBAction func punchButtonPressed(_ sender: UIButton) {
        let originalImageFrame = imageView.frame
        let imageWidthShrink: CGFloat = 20
        let imageHeightShrink: CGFloat = 20
        let smallerImageFrame = CGRect (
            x: imageView.frame.origin.x + imageWidthShrink,
            y: imageView.frame.origin.y + imageHeightShrink,
            width: imageView.frame.width - (imageWidthShrink * 2),
            height : imageView.frame.height - (imageHeightShrink * 2))
    imageView.frame = smallerImageFrame
    playSound(name: "punchSound")
    UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10.0 ) {
        self.imageView.frame = originalImageFrame
        
    }
                       
        
    }
    
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        let originalImageFrame = imageView.frame
        let imageWidthShrink: CGFloat = 20
        let imageHeightShrink: CGFloat = 20
        let smallerImageFrame = CGRect (
            x: imageView.frame.origin.x + imageWidthShrink,
            y: imageView.frame.origin.y + imageHeightShrink,
            width: imageView.frame.width - (imageWidthShrink * 2),
            height : imageView.frame.height - (imageHeightShrink * 2))
    imageView.frame = smallerImageFrame
    playSound(name: "punchSound")
    UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10.0 ) {
        self.imageView.frame = originalImageFrame
        
    }
    }
    

}
