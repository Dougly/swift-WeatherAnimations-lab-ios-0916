//
//  ViewController.swift
//  WeatherAnimations
//
//  Created by Ian Rahman on 10/11/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    let screenSize = UIScreen.main.bounds

    let sun = UIImageView(image: UIImage(named: "Sun"))
    let moon = UIImageView(image: UIImage(named: "Moon"))
    let cloud = UIImageView(image: UIImage(named: "Cloud"))
    let lightning = UIImageView(image: UIImage(named: "Lightning"))
    
    var sunCenterX: NSLayoutConstraint!
    var sunCenterY: NSLayoutConstraint!
    var moonCenterX: NSLayoutConstraint!
    var moonCenterY: NSLayoutConstraint!
    var cloudCenterY: NSLayoutConstraint!
    
    let stormButton = UIButton()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        
        self.view.addSubview(sun)
        sun.translatesAutoresizingMaskIntoConstraints = false
        sun.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25).isActive = true
        sun.heightAnchor.constraint(equalTo: sun.widthAnchor).isActive = true
        sunCenterX = sun.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: screenSize.width * 0.75)
        sunCenterX.isActive = true
        sunCenterY = sun.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        sunCenterY.isActive = true
        
        self.view.addSubview(moon)
        moon.translatesAutoresizingMaskIntoConstraints = false
        moon.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25).isActive = true
        moon.heightAnchor.constraint(equalTo: moon.widthAnchor).isActive = true
        moonCenterX = moon.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: screenSize.width * 0.75)
        moonCenterX.isActive = true
        moonCenterY = moon.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        moonCenterY.isActive = true
        
        self.view.addSubview(stormButton)
        stormButton.translatesAutoresizingMaskIntoConstraints = false
        stormButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stormButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: screenSize.height * 0.25).isActive = true
        stormButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2).isActive = true
        stormButton.widthAnchor.constraint(equalTo: stormButton.heightAnchor).isActive = true
        stormButton.setTitle("⚡️", for: .normal)
        stormButton.layer.borderWidth = 2
        stormButton.layer.borderColor = UIColor.gray.cgColor
        stormButton.layer.backgroundColor = UIColor.white.cgColor
        stormButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    
        self.view.addSubview(cloud)
        cloud.translatesAutoresizingMaskIntoConstraints = false
        cloud.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cloudCenterY = cloud.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: screenSize.height * 0.1)
        cloudCenterY.isActive = true
        cloud.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        cloud.heightAnchor.constraint(equalTo: cloud.widthAnchor, multiplier: 552/1092).isActive = true
        cloud.alpha = 0
        
        self.view.addSubview(lightning)
        lightning.translatesAutoresizingMaskIntoConstraints = false
        lightning.widthAnchor.constraint(equalTo: cloud.widthAnchor, multiplier: 0.25).isActive = true
        lightning.heightAnchor.constraint(equalTo: lightning.widthAnchor, multiplier: 423/333).isActive = true
        lightning.topAnchor.constraint(equalTo: cloud.bottomAnchor).isActive = true
        lightning.centerXAnchor.constraint(equalTo: cloud.centerXAnchor).isActive = true
        lightning.alpha = 0
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        cycleBetweenColors(view: self.view)
        sunArch()
        moonArch()

    }
    
    func buttonClicked (_ sender: UIButton!) {
        animateCloud()
        animateLightning()
    }
    
    
    func cycleBetweenColors (view: UIView) {
        
        UIView.animateKeyframes(withDuration: 20, delay: 0, options: [.repeat, .allowUserInteraction], animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.2, animations: {
                view.backgroundColor = .cyan
                self.view.layoutIfNeeded()
            })
            
            UIView.addKeyframe(withRelativeStartTime: 9/20, relativeDuration: 0.2, animations: {
                view.backgroundColor = .blue
                self.view.layoutIfNeeded()
            })
            
            UIView.addKeyframe(withRelativeStartTime: 11/20, relativeDuration: 0.2, animations: {
                view.backgroundColor = .black
                self.view.layoutIfNeeded()
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.9, relativeDuration: 0.1, animations: {
                view.backgroundColor = .blue
                self.view.layoutIfNeeded()
            })
            
            
            }, completion: nil)
    }
    
    func sunArch () {

        UIView.animateKeyframes(withDuration: 20, delay: 0, options: [.repeat, .calculationModeCubic, .allowUserInteraction], animations: {
           
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.2, animations: {
                self.sunCenterX.isActive = false
                self.sunCenterY.isActive = false
                self.sunCenterX = self.sun.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
                self.sunCenterY = self.sun.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: self.screenSize.height * -0.25)
                self.sunCenterX.isActive = true
                self.sunCenterY.isActive = true
                self.view.layoutIfNeeded()
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.2, animations: {
                self.sunCenterX.isActive = false
                self.sunCenterY.isActive = false
                self.sunCenterX = self.sun.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: self.screenSize.width * -0.75)
                self.sunCenterY = self.sun.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
                self.sunCenterX.isActive = true
                self.sunCenterY.isActive = true
                self.view.layoutIfNeeded()
            })
            
            }, completion: nil)
    }
    
    func moonArch () {
        
        UIView.animateKeyframes(withDuration: 20, delay: 0, options: [.repeat, .calculationModeCubic, .allowUserInteraction], animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.2, animations: {
                self.moonCenterX.isActive = false
                self.moonCenterY.isActive = false
                self.moonCenterX = self.moon.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
                self.moonCenterY = self.moon.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: self.screenSize.height * -0.25)
                self.moonCenterX.isActive = true
                self.moonCenterY.isActive = true
                self.view.layoutIfNeeded()
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.2, animations: {
                self.moonCenterX.isActive = false
                self.moonCenterY.isActive = false
                self.moonCenterX = self.moon.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: self.screenSize.width * -0.75)
                self.moonCenterY = self.moon.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
                self.moonCenterX.isActive = true
                self.moonCenterY.isActive = true
                self.view.layoutIfNeeded()
            })
            
            }, completion: nil)
    }
    
    func animateCloud () {
        
        UIView.animateKeyframes(withDuration: 8, delay: 0, options: [.calculationModeCubic,], animations: { 
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.3, animations: {
                self.cloudCenterY.isActive = false
                self.cloudCenterY = self.cloud.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: self.screenSize.height * -0.2)
                self.cloud.alpha = 1
                self.cloudCenterY.isActive = true
                self.view.layoutIfNeeded()
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.3, animations: {
                self.cloudCenterY.isActive = false
                self.cloudCenterY = self.cloud.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
                self.cloudCenterY.isActive = true
                self.view.layoutIfNeeded()
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.3, animations: {
                self.cloudCenterY.isActive = false
                self.cloudCenterY = self.cloud.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: self.screenSize.height * -0.2)
                self.cloudCenterY.isActive = true
                self.view.layoutIfNeeded()
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.9, relativeDuration: 0.2, animations: {
                self.cloudCenterY.isActive = false
                self.cloudCenterY = self.cloud.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: self.screenSize.height * 0.1)
                self.cloudCenterY.isActive = true
                self.cloud.alpha = 0
                self.view.layoutIfNeeded()
            })
            
            }, completion: nil)
    }
    
    func animateLightning () {

        UIView.animateKeyframes(withDuration: 1, delay: 3, options: .autoreverse, animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0, animations: { 
                self.lightning.alpha = 0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 1/6, relativeDuration: 0, animations: {
                self.lightning.alpha = 1
            })
            
            UIView.addKeyframe(withRelativeStartTime: 2/6, relativeDuration: 0, animations: {
                self.lightning.alpha = 0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 3/6, relativeDuration: 0, animations: {
                self.lightning.alpha = 1
            })
            
            UIView.addKeyframe(withRelativeStartTime: 4/6, relativeDuration: 0, animations: {
                self.lightning.alpha = 0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 5/6, relativeDuration: 0, animations: {
                self.lightning.alpha = 1
            })
            
            UIView.addKeyframe(withRelativeStartTime: 6/6, relativeDuration: 0, animations: {
                self.lightning.alpha = 0
            })
            
            }, completion: nil)
    }
    
    
}



























