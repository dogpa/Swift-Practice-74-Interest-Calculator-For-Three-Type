//
//  LumSumInvestingViewController.swift
//  Swift Practice # 73 Interest Calculator
//
//  Created by Dogpa's MBAir M1 on 2021/9/10.
//

import UIKit

class LumSumInvestingViewController: UIViewController {
    
    //任意地方收鍵盤
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LumSumInvestingViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        }
        @objc func dismissKeyboard() {
        view.endEditing(true)
        }
    
    
    @IBOutlet weak var lumpSumMoneyTextField: UITextField!          //輸入投資金額
    
    @IBOutlet weak var lumpSumInterestRateTextField: UITextField!   //輸入預期的利率
    
    @IBOutlet weak var lumpSumInvestYearsTextField: UITextField!    //輸入投資的年份區間
    
    @IBOutlet weak var illustrateLabel: UILabel!                    //顯示計算方法
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //輸入計算的方法的字串
        illustrateLabel.text = "計算說明：\n 計算方式為第一年年初投入單筆資金，於年度間取得預期利率之複利後加總後，再進入下一年度取得預期複利加總至指定投資年數年底結束。"
        
        //執行隨意位置收鍵盤
        self.hideKeyboardWhenTappedAround()
        
    }
    
    
    
    
    @IBSegueAction func showLSIResult(_ coder: NSCoder) -> ResultForLSIViewController? {
        
        
        let controller = ResultForLSIViewController(coder: coder)   //指派controller取得下一頁ResultForLSIViewController
        let money = Float(lumpSumMoneyTextField.text ?? "")         //嘗試取得輸入的單筆投入金額數字轉型成為Float若無法取得回傳空字串
        let rate = Float(lumpSumInterestRateTextField.text ?? "")   //嘗試取得輸入的預期利率數字轉型成為Float若無法取得回傳空字串
        let year = Float(lumpSumInvestYearsTextField.text ?? "")    //嘗試取得輸入的投資年份數字轉型成為Float若無法取得回傳空字串
        
        //print("型別為 錢\(type(of: money)), 利率\(type(of: rate)) 年\(type(of: year))  ")
        //print(money, rate, year)
        
        //檢查上面的三個數字是否有值(是否輸入為數字)，若無值(沒輸入數字)則跳出警告
        if money == nil || rate == nil || year == nil {
            let alertController = UIAlertController(title: "輸入非數字內容" , message: "請返回原畫面再次確認", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "了解", style: .default)
                            alertController.addAction(okAction)
                            present(alertController, animated: true, completion: nil)
            
        }else{
            
            //若成功轉型，將剛剛轉型FLoat的三個值傳給下一頁已經指派好的三個變數使用
            controller?.lumpSumNumber = money       //下一頁的lumpSumNumber為money       單筆投入金額
            controller?.interestRateForLSV = rate   //下一頁的interestRateForLSV為rate   預期利率
            controller?.yearsForLSV = year          //下一頁的yearsForLSV為year          投資年數
            
            //取得資料後將下列三個TextField先變成空字串，以免返回到這頁TextField仍有值
            lumpSumInvestYearsTextField.text = ""
            lumpSumMoneyTextField.text = ""
            lumpSumInterestRateTextField.text = ""
        }
        
        return controller   //跳到下一頁
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
