//
//  ViewController.swift
//  SeSACEmotionDiary
//
//  Created by ungq on 1/2/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var emotionButtons: [UIButton]!
    @IBOutlet var emotionLabels: [UILabel]!
                                        
    let emotionLabelTitle: [String] = ["행복해", "사랑해", "좋아해", "당황해", "속상해", "우울해", "심심해", "짜증나", "힘들어"]
    
    let emotionImage: [UIImage] = [.slime1, .slime2, .slime3, .slime4, .slime5, .slime6, .slime7, .slime8, .slime9]
    
    var count: [Int] = [
        UserDefaults.standard.integer(forKey: "행복해"),
        UserDefaults.standard.integer(forKey: "사랑해"),
        UserDefaults.standard.integer(forKey: "좋아해"),
        UserDefaults.standard.integer(forKey: "당황해"),
        UserDefaults.standard.integer(forKey: "속상해"),
        UserDefaults.standard.integer(forKey: "우울해"),
        UserDefaults.standard.integer(forKey: "심심해"),
        UserDefaults.standard.integer(forKey: "짜증나"),
        UserDefaults.standard.integer(forKey: "힘들어")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBrown
        
        setNavigationItem()
        
        for index in 0...emotionButtons.count-1 {
            designButton(button: emotionButtons[index], image: emotionImage[index])
            designLabel(label: emotionLabels[index], text: emotionLabelTitle[index], count: count[index])
        }
    }

    @IBAction func emotionButtonClicked(_ sender: UIButton) {
        let index = sender.tag
        count[index] += 1
        UserDefaults.standard.set(count[index], forKey: emotionLabelTitle[index])
        emotionLabels[index].text = "\(emotionLabelTitle[index]) \(UserDefaults.standard.integer(forKey: emotionLabelTitle[index]))"
    }
    
    func setNavigationItem() {
        navigationItem.title = "감정 다이어리"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: .none)
    }
    
    func designButton(button: UIButton, image: UIImage) {
        button.setImage(image, for: .normal)
    }
    
    func designLabel(label: UILabel, text: String, count: Int) {
        label.text = "\(text) \(count)"
    }

}

