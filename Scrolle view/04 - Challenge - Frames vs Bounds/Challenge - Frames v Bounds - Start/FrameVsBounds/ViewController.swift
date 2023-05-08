

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var innerView: UIView!
  
  @IBOutlet weak var frameXSlider: UISlider!
  @IBOutlet weak var boundsXSlider: UISlider!
  @IBOutlet weak var frameYSlider: UISlider!
  @IBOutlet weak var boundsYSlider: UISlider!

  @IBOutlet weak var frameOriginLabel: UILabel!
  @IBOutlet weak var boundsOriginLabel: UILabel!
  @IBOutlet weak var frameYOriginLabel: UILabel!
  @IBOutlet weak var boundsYOriginLabel: UILabel!
  
  //MARK:- Challenge

  
  @IBAction func frameXSliderChanged(_ sender: AnyObject) {
    //TODO: Update the frame's x value based on the slider
      containerView.frame.origin.x = CGFloat(frameXSlider.value)
    updateLabels()
  }
  
   @IBAction func boundsXSliderChanged(_ sender: AnyObject) {
    //TODO: Update the bounds' x value based on the slider
       containerView.bounds.origin.x = CGFloat(boundsXSlider.value)
    updateLabels()
  }

  @IBAction func frameYSliderChanged(_ sender: AnyObject) {
    //TODO: Update the frame's y value based on the slider
      containerView.frame.origin.y = CGFloat(frameYSlider.value)
    updateLabels()
  }

  @IBAction func boundsYSliderChanged(_ sender: AnyObject) {
    //TODO: Update the bounds' y value based on the slider
      containerView.bounds.origin.y = CGFloat(boundsYSlider.value)
    updateLabels()
  }

  //MARK:-
  override func viewDidLoad() {
    super.viewDidLoad()
    
    frameXSlider.value = Float(containerView.frame.origin.x)
    boundsXSlider.value = Float(containerView.bounds.origin.x)
    
    frameYSlider.value = Float(containerView.frame.origin.y)
    boundsYSlider.value = Float(containerView.bounds.origin.y)
      
     
    
    updateLabels()
  }

  fileprivate func updateLabels() {
    frameOriginLabel.text = "Frame x origin = \(Int(containerView.frame.origin.x))"
    boundsOriginLabel.text = "Bounds x origin = \(Int(containerView.bounds.origin.x))"
    frameYOriginLabel.text = "Frame y origin = \(Int(containerView.frame.origin.y))"
    boundsYOriginLabel.text = "Bounds y origin = \(Int(containerView.bounds.origin.y))"
  }

}
