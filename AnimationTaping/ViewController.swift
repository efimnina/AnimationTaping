//
//  ViewController.swift
//  AnimationTaping
//
//  Created by Нина Ефимова on 16.06.2020.
//  Copyright © 2020 Efim Nina. All rights reserved.
//

import Spring

class ViewController: UIViewController {
    
    @IBOutlet var springAnimationView: SpringView!
    @IBOutlet var animationLabel: UILabel!
    @IBOutlet var springButtom: SpringButton!
    
    var animations = ["fall","shake","flipY","morph","squeeze","wobble",
                      "swing", "pop", "slideUp", "flash"]
    var curves = ["spring", "easeInBack", "linear", "easeOutExpo", "easeInOut",
                  "easeInSine", "easeOutSine", "easeInOutSine", "easeInQuad"]
    var animationNext = ""
    var curveNext = ""
    var animationCurrent = ""
    var curveCurrent = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        springAnimationView.layer.cornerRadius = 20
        springButtom.layer.cornerRadius = 10
        animationNext = animations.randomElement() ?? ""
        curveNext = curves.randomElement() ?? ""
        animationCurrent = animations.randomElement() ?? ""
        curveCurrent = curves.randomElement() ?? ""
    }
    
    @IBAction func showAnimation(_ sender: SpringButton) {
        springButtom.setTitle(animationNext, for: .normal)
        springAnimationView.animation = animationCurrent
        springAnimationView.curve = curveCurrent
        springAnimationView.duration = 1.0
        springAnimationView.animate()
        
        animationLabel.text = "Animation: \(animationCurrent) \nCurve: \(curveCurrent)"
        
        animationCurrent = animationNext
        curveCurrent = curveNext
        animationNext = animations.randomElement() ?? ""
        curveNext = curves.randomElement() ?? ""
    }
}

