//
//  PeriodicInvestmentViewController.swift
//  Swift Practice # 73 Interest Calculator
//
//  Created by Dogpa's MBAir M1 on 2021/9/11.
//

import UIKit

class PeriodicInvestmentViewController: UIViewController {

    //任意地方收鍵盤
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(PeriodicInvestmentViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        }
        @objc func dismissKeyboard() {
        view.endEditing(true)
        }
    
    
    @IBOutlet weak var periodicMoneyTextField: UITextField!
    
    @IBOutlet weak var pIInterestRateTextField: UITextField!
    
    @IBOutlet weak var periodicInverestYearsTextField: UITextField!
    
    @IBOutlet weak var illustrateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        illustrateLabel.text = "計算說明：\n每年年初投入指定金額後在年度間取得預期之利率，加總後為每年底之金額，隔年年初再以去年底金額加上當年度定期投入金額後於年間取得預期之複利，一路循環之指定年數後結算金額。"
        
        


    }
    
    @IBSegueAction func showResultForPI(_ coder: NSCoder) -> ResultForPIViewController? {
        let resultPIcontroller = ResultForPIViewController(coder: coder)
        
        let moneyForPIResult = Float(periodicMoneyTextField.text ?? "")
        let rateForPIResult = Float(pIInterestRateTextField.text ?? "")
        let yearsForPIResult = Float(periodicInverestYearsTextField.text ?? "")
        
        if moneyForPIResult == nil || rateForPIResult == nil || yearsForPIResult == nil {
            let alertController = UIAlertController(title: "輸入非數字內容" , message: "請返回原畫面再次確認", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "了解", style: .default)
                            alertController.addAction(okAction)
                            present(alertController, animated: true, completion: nil)
            
        }else{
            resultPIcontroller?.periodicInvestMoney = moneyForPIResult
            resultPIcontroller?.periodicInvestRate = rateForPIResult
            resultPIcontroller?.periodicInvestYears = yearsForPIResult
            
            periodicMoneyTextField.text = ""
            pIInterestRateTextField.text = ""
            periodicInverestYearsTextField.text = ""
        }
        return resultPIcontroller
    }
    

}
