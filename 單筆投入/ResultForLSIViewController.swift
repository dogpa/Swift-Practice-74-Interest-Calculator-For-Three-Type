//
//  ResultForLSIViewController.swift
//  Swift Practice # 73 Interest Calculator
//
//  Created by Dogpa's MBAir M1 on 2021/9/10.
//

import UIKit

class ResultForLSIViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //下列三個變數指派為Float，並等帶前一頁傳值給這三個變數
    var lumpSumNumber : Float!
    var interestRateForLSV : Float!
    var yearsForLSV: Float!
    
    //建立一個空Array，裏面存放類型為自定義的RateResultType
    var resultArrayForEverYears: [RateResultType] = []
    
    
    @IBOutlet weak var investInfoFromLSIVCLabel: UILabel!   //顯示計算的相關值
    
    @IBOutlet weak var resultTableView: UITableView!        //顯示複利結果
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //print(type(of: lumpSumNumber!), type(of: interestRateForLSV!), type(of: yearsForLSV!))
        //print(lumpSumNumber!, interestRateForLSV!, yearsForLSV!)

        resultTableView.delegate = self     //指派delegate
        resultTableView.dataSource = self   //指派dataSource
        
        //執行自定義的 resultForLSI Function，並帶入指定的值進行計算。
        resultForLSI(money: lumpSumNumber, rate: interestRateForLSV, years: yearsForLSV)
        
        //顯示上一頁的輸入的值
        investInfoFromLSIVCLabel.text = "您投入本金為 $\(lumpSumNumber!) 元\n您預設年利率為 \(interestRateForLSV!) %\n您預計投資\(yearsForLSV!) 年\n\n計算結果如下"
    }
    
    
    //自定義單一投入複利計算公式
    func resultForLSI (money:Float, rate:Float , years:Float) {
        let firstTimesMoneyForInvest:Float = money  //最初投入金額
        var money: Float = money                    //跟隨計算結果改變的複利結果
        let rate: Float = rate                      //預計年利率
        let years: Float = years                    //預計投資年數
        
        for i in 1...Int(years) {
            
            money = money + (money * 1 / 100 * rate)    //複利計算
            
            //將計算結果轉型字串後加入到 resultArrayForEverYears中
            resultArrayForEverYears.append(RateResultType(years: "投資第 \(i) 年", resultForEverYears: ["本利和為： $\(String(format: "%.2f", arguments: [money]))","累積利息： $\(String(format: "%.2f", arguments: [money - firstTimesMoneyForInvest]))"]))
            
        }
        
        //print(resultArrayForEverYears)
    }
    
    

    //顯示的Sections區域數
    func numberOfSections(in tableView: UITableView) -> Int {
        return resultArrayForEverYears.count
    }
    
    //每個Sections顯示的Row數
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        for i in 0...resultArrayForEverYears.count - 1{
            if section == i {
                return resultArrayForEverYears[i].resultForEverYears.count
            }
            return resultArrayForEverYears[i].resultForEverYears.count
        }

        return 0
    }
    
    //Row顯示的內容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        for i in 0...resultArrayForEverYears.count - 1 {
            if indexPath.section == i {
                cell.textLabel?.text = resultArrayForEverYears[i].resultForEverYears[indexPath.row]
            }
        }
        return cell
    }
    
    //每個Sections的標題
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        for i in 0...resultArrayForEverYears.count - 1 {
            if section == i {
                return resultArrayForEverYears[i].years
            }
        }
        return ""
        
    }
    

}
