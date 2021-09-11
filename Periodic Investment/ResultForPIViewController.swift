//
//  ResultForPIViewController.swift
//  Swift Practice # 73 Interest Calculator
//
//  Created by Dogpa's MBAir M1 on 2021/9/11.
//

import UIKit

class ResultForPIViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var periodicInvestMoney: Float!
    var periodicInvestRate: Float!
    var periodicInvestYears: Float!
    
    var resultArrayForPI: [RateResultType] = []
    
    @IBOutlet weak var resultInfoFromPICVLabel: UILabel!
    
    @IBOutlet weak var resultTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(periodicInvestMoney!, periodicInvestRate!, periodicInvestYears!)
        resultInfoFromPICVLabel.text = "您計算單位如下：\n每年定期定額金額： $\(periodicInvestMoney!)元\n預期利率： \(periodicInvestRate!)%\n預計投資年數 \(periodicInvestYears!)年\n\n計算結果如下"
        resultTableView.dataSource = self
        resultTableView.delegate = self
        calculatorInvestResult(piMoney: periodicInvestMoney!, piRate: periodicInvestRate!, piYears: periodicInvestYears!)
    }
    
    
    func calculatorInvestResult (piMoney:Float, piRate:Float, piYears:Float) {
        var calculMoney: Float = 0              //初始計算金額
        var moneyAfterCalculator: Float = 0     //當年度複利金額
        var totalInvestMoney: Float = 0         //本金
        let money = piMoney
        let rate = piRate
        let years = piYears
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 1
        
        for i in 1...Int(years) {
            calculMoney += money
            //print("年初\(calculMoney)")
            totalInvestMoney = money * (Float(i))                //儲存當年度本金
            moneyAfterCalculator = (calculMoney * (1/100*rate))
            calculMoney = calculMoney + moneyAfterCalculator //年度複利完後的金額
            //print("年末\(calculMoney)")
            
            resultArrayForPI.append(RateResultType(years: "投資第\(i)年", resultForEverYears: ["本利和 $ \(formatter.string(from: NSNumber(value: calculMoney))!)元","累積本金 $ \(formatter.string(from: NSNumber(value: totalInvestMoney))!)元","累積利息 $ \(formatter.string(from: NSNumber(value: ((calculMoney-totalInvestMoney))))!)元"]))
        
        }
        print(resultArrayForPI.count)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return resultArrayForPI.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        for i in 0...resultArrayForPI.count - 1 {
            if section == i {
                return resultArrayForPI[i].resultForEverYears.count
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        for i in 0...resultArrayForPI.count - 1 {
            if indexPath.section == i {
                cell.textLabel?.text = resultArrayForPI[i].resultForEverYears[indexPath.row]
            }
        }
        return cell
    }


    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        for i in 0...resultArrayForPI.count - 1 {
            if section == i {
                return resultArrayForPI[i].years
            }
        }
        return ""
    }

}
