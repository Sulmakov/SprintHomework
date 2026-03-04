//
//  ViewController.swift
//  Counter
//
//  Created by Павел Работа on 04.03.2026.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var counterValue: UILabel!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var buttonMinus: UIButton!
    @IBOutlet weak var buttonClear: UIButton!
    @IBOutlet weak var historyOfChanges: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        historyOfChanges.text = "История изменений"
        
        counterValue.text = "Значение счетчика: 0"
        
        buttonPlus.setTitle("+", for: .normal)
        buttonPlus.backgroundColor = .systemRed
        buttonPlus.tintColor = .black
        
        buttonMinus.setTitle("-", for: .normal)
        buttonMinus.backgroundColor = .systemBlue
        buttonMinus.tintColor = .black
        
        buttonClear.setTitle("Сбросить", for: .normal)
        buttonClear.backgroundColor = .systemYellow
        buttonClear.tintColor = .black
    }
   var value = 0
   var history: [String] = []
    
    func addHistoryEntry(message: String) {
        let timestamp = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .short)
        let entry = "\(timestamp): \(message)"
        history.append(entry)
        updateHistoryDisplay()
    }
    
    // Обновление текстового поля истории
    func updateHistoryDisplay() {
        // Объединяем все записи с переносом строки
        historyOfChanges.text = history.joined(separator: "\n")
        
        // Прокрутка вниз, чтобы видеть последнюю запись
        if !history.isEmpty {
            let range = NSRange(location: historyOfChanges.text.count - 1, length: 1)
            historyOfChanges.scrollRangeToVisible(range)
        }
    }
    
    @IBAction func buttonPlusDidTap(_ sender: Any) {
        value += 1
        counterValue.text = "Значение счетчика: \(value)"
        addHistoryEntry(message: "Значение изменено на +1")
    }
    
    @IBAction func buttonMinusDidTap(_ sender: Any) {
        if value > 0 {
            value -= 1
            counterValue.text = "Значение счетчика: \(value)"
            addHistoryEntry(message: "Значение изменено на -1")
        } else { addHistoryEntry(message: "Попытка уменьшить значение счетчика ниже 0")
        }
    }
    
    @IBAction func buttonClearDidTap(_ sender: Any) {
        value = 0
        counterValue.text = "Значение счетчика: \(value)"
        addHistoryEntry(message: "Значение сброшено")
    }
    
    
    
    
}
