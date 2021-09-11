//
//  LSIAddPIViewController.swift
//  Swift Practice # 73 Interest Calculator
//
//  Created by Dogpa's MBAir M1 on 2021/9/11.
//

import UIKit

class LSIAddPIViewController: UIViewController {

    //任意地方收鍵盤
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LSIAddPIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        }
        @objc func dismissKeyboard() {
        view.endEditing(true)
        }
    
    @IBOutlet weak var firstLSIMoneyTextField: UITextField!
    @IBOutlet weak var piMoneyTextField: UITextField!
    @IBOutlet weak var interestRateTextField: UITextField!
    @IBOutlet weak var yearsForLSIAndPITextField: UITextField!
    @IBOutlet weak var illustrateLSIPILabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        illustrateLSIPILabel.text = "計算說明：\n單筆投入金額於首年年初投入，定期定額於每年年初投入。第一年複利金額為單筆投入加定期定額之預期利率，利率加單筆加定期定額為年底總計。隔年為上一年度結算金額加上定期定額金額後再進行利率計算。循環至指定年數後結束。"

    }
    
    @IBSegueAction func showResultForLSIPI(_ coder: NSCoder) -> ResultForLSIAddPIViewController? {
        let resultLSIPIVC = ResultForLSIAddPIViewController(coder: coder)
        
        let resultForFirstMoney = Float(firstLSIMoneyTextField.text ?? "")
        let resultForPIMoney = Float(piMoneyTextField.text ?? "")
        let resultForRate = Float(interestRateTextField.text ?? "")
        let resultForYears = Float(yearsForLSIAndPITextField.text ?? "")
        
        if resultForFirstMoney == nil || resultForPIMoney == nil || resultForRate == nil || resultForYears == nil {
            let alertController = UIAlertController(title: "輸入非數字內容" , message: "請返回原畫面再次確認", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "了解", style: .default)
                            alertController.addAction(okAction)
                            present(alertController, animated: true, completion: nil)
        }else{
            resultLSIPIVC?.firstMoneyForLSIPI = resultForFirstMoney
            resultLSIPIVC?.moneyForLSIPI = resultForPIMoney
            resultLSIPIVC?.rateForLSIPI = resultForRate
            resultLSIPIVC?.yearsForLSIPI = resultForYears
            firstLSIMoneyTextField.text = ""
            piMoneyTextField.text = ""
            interestRateTextField.text = ""
            yearsForLSIAndPITextField.text = ""
        }
        return resultLSIPIVC
    }
    


}
