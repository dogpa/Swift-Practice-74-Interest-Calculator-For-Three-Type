//
//  ResultForLSIAddPIViewController.swift
//  Swift Practice # 73 Interest Calculator
//
//  Created by Dogpa's MBAir M1 on 2021/9/11.
//

import UIKit

class ResultForLSIAddPIViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var firstMoneyForLSIPI: Float!
    var moneyForLSIPI: Float!
    var rateForLSIPI: Float!
    var yearsForLSIPI: Float!
    
    var resultArrayForLSIPI:[RateResultType] = []
    
    @IBOutlet weak var resultLSIPILabel: UILabel!
    
    @IBOutlet weak var LSIPITableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLSIPILabel.text = "您計算單位如下：\n初始單筆投入金額： $ \(firstMoneyForLSIPI!)元\n每年定期定額金額： $ \(moneyForLSIPI!)元\n預期利率： \(rateForLSIPI!)%\n預計投資年數 \(yearsForLSIPI!)年\n\n計算結果如下"
        LSIPITableView.dataSource = self
        LSIPITableView.delegate = self
        calculatorLSIPI(lsipiFirstMoney: firstMoneyForLSIPI!, lsipiPImoney: moneyForLSIPI!, lsipiRate: rateForLSIPI!, lsipiYears: yearsForLSIPI!)
       
    }
    
    func calculatorLSIPI (lsipiFirstMoney: Float, lsipiPImoney: Float, lsipiRate: Float, lsipiYears: Float) {
        var calculatorMoney: Float = 0              //計算金額
        var moneyAfterCalculatorLSIPI: Float = 0    //當年度複利
        var totalInvestMoneyLSIPI: Float = 0        //本金計算
        let firstMoney = lsipiFirstMoney
        let money = lsipiPImoney
        let rate = lsipiRate
        let years = lsipiYears
        
        calculatorMoney = firstMoney                //先加入單筆投入的資金
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 1
        
        for i in 1...(Int(years)) {
            calculatorMoney += money
            totalInvestMoneyLSIPI = firstMoney + ((Float(i) * money))
            moneyAfterCalculatorLSIPI = (calculatorMoney) * (1 / 100 * rate)
            calculatorMoney += moneyAfterCalculatorLSIPI
            
            resultArrayForLSIPI.append(RateResultType(years: "投資第\(i)年", resultForEverYears: ["本利和 $ \(formatter.string(from: NSNumber(value: calculatorMoney))!)元","累積本金 $ \(formatter.string(from: NSNumber(value: totalInvestMoneyLSIPI))!)元","累積利息 $ \(formatter.string(from: NSNumber(value: ((calculatorMoney-totalInvestMoneyLSIPI))))!)元"]))
            //print(resultArrayForLSIPI[i-1])
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return resultArrayForLSIPI.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        for i in 0...resultArrayForLSIPI.count - 1 {
            if section == i {
                return resultArrayForLSIPI[i].resultForEverYears.count
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        for i in 0...resultArrayForLSIPI.count - 1 {
            if indexPath.section == i {
                cell.textLabel?.text = resultArrayForLSIPI[i].resultForEverYears[indexPath.row]
            }
        }
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        for i in 0...resultArrayForLSIPI.count - 1 {
            if section == i {
                return resultArrayForLSIPI[i].years
            }
        }
        return ""
    }

}
