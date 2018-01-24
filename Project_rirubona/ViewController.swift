//
//  ViewController.swift
//  Project_rirubona
//
//  Created by 김형철 on 2017. 10. 3..
//  Copyright © 2017년 misono. All rights reserved.
//
import UIKit
enum SelectedButtonTag: Int {
    case Zero = 0
    case First
    case Second
    case Third
    case Forth
    case Fifth
    case Sixth
    case Sevneth
    case Eighth
    case Nineth
    case result = 50
    case plus = 100
    case minus
    case multi
    case divide
    case percent
    case sin = 200
    case cos
    case tan
    
}
class ViewController: UIViewController {

    var first_Number:Double?
    var second_Number:Double?
    var temp_Number:Double? = 0
    var result_Number:Double?
    var flag = 0
    var temp_flag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   // @IBOutlet weak var entry_label: UILabel!
    @IBOutlet weak var Screen: UILabel!
    @IBAction func Reset(_ sender: UIButton) {
        self.Screen.text = "0"
        first_Number = nil
        second_Number = nil
        result_Number = nil
        temp_Number! = 0.0
        flag = 0;
        temp_flag = 0;
    }
    @IBAction func sankaku(_ sender: UIButton) { // 개발중
        if(first_Number == nil) //입력한 수가 없었을때
        {
            self.Screen.text = "Error first press the number"
            temp_Number! = 0.0
            flag = 0;
        }
        else{
            switch sender.tag
            {
            case SelectedButtonTag.sin.rawValue: self.Screen.text = "Sin"; flag = 200; result_Number = sin(first_Number! * .pi / 180); self.Screen.text = String(describing: result_Number!);
            case SelectedButtonTag.cos.rawValue: self.Screen.text = "Cos"; flag = 201; result_Number = cos(first_Number! * .pi / 180); self.Screen.text = String(describing: result_Number!);
            case SelectedButtonTag.tan.rawValue: self.Screen.text = "Tan"; flag = 202; result_Number = tan(first_Number! * .pi / 180); self.Screen.text = String(describing: result_Number!);
            default:break
            }
        }
    }
    @IBAction func Calculate(_ sender: UIButton) {
        if(temp_Number == 0)
        {
            switch sender.tag // 연산기호 받았을때 temp에 처음 입력받은 수 저장.
            {
            case SelectedButtonTag.plus.rawValue: self.Screen.text = "+"; flag = 100; temp_Number = first_Number;
            first_Number = 0.0
            case SelectedButtonTag.minus.rawValue: self.Screen.text = "-"; flag = 101; temp_Number = first_Number;
            first_Number = 0.0
            case SelectedButtonTag.multi.rawValue: self.Screen.text = "x"; flag = 102; temp_Number = first_Number;
            first_Number = 0.0
            case SelectedButtonTag.divide.rawValue: self.Screen.text = "/"; flag = 103; temp_Number = first_Number;
            first_Number = 0.0
            case SelectedButtonTag.percent.rawValue: self.Screen.text = "%"; flag = 104; temp_Number = first_Number;
            first_Number = 0.0
            default:break
            }
        }
        else{               // 연속 계산할때, 기존에 있던 temp랑 새로 입력받은 first랑 계산
            temp_flag = flag //전에 누른 연산자 저장하고 뒤에있는거 계산
            if(temp_flag == 100)
            {
                result_Number = temp_Number! + first_Number!
            }
            else if(temp_flag == 101)
            {
                result_Number = temp_Number! - first_Number!
            }
            else if(temp_flag == 102)
            {
                result_Number = temp_Number! * first_Number!
                
            }
            else if(temp_flag == 103)
            {
                result_Number = temp_Number! / first_Number!
                
            }
            else if(temp_flag == 104)
            {
                result_Number = (temp_Number?.truncatingRemainder(dividingBy: first_Number!))!
            }
            switch sender.tag // 연속 계산의 다음 연산자 받기 temp는 전에 계산한 결과가 temp로 들어간다.
            {
            case SelectedButtonTag.plus.rawValue: self.Screen.text = "+"; flag = 100; temp_Number = result_Number;
            first_Number = 0.0
            case SelectedButtonTag.minus.rawValue: self.Screen.text = "-"; flag = 101; temp_Number = result_Number;
            first_Number = 0.0
            case SelectedButtonTag.multi.rawValue: self.Screen.text = "x"; flag = 102; temp_Number = result_Number;
            first_Number = 0.0
            case SelectedButtonTag.divide.rawValue: self.Screen.text = "/"; flag = 103; temp_Number = result_Number;
            first_Number = 0.0
            case SelectedButtonTag.percent.rawValue: self.Screen.text = "%"; flag = 104; temp_Number = result_Number;
            first_Number = 0.0
            default:break
            }
        }
    }
    @IBAction func Result_display(_ sender: UIButton) { //최종 연산 마지막으로 플레그들어온걸 계산함
        
        if(flag == 100)
        {
            result_Number = temp_Number! + first_Number!
        }
        else if(flag == 101)
        {
            result_Number = temp_Number! - first_Number!
        }
        else if(flag == 102)
        {
            result_Number = temp_Number! * first_Number!
            
        }
        else if(flag == 103)
        {
            result_Number = temp_Number! / first_Number!
            
        }
        else if(flag == 104)
        {
            result_Number = (temp_Number?.truncatingRemainder(dividingBy: first_Number!))!
        }
        self.Screen.text = String(describing: result_Number!);
        flag = 0
        first_Number = 0
    }
    @IBAction func numbers(_ sender: UIButton) {
        if(first_Number == nil)
        {
            switch sender.tag
            {
                case SelectedButtonTag.Zero.rawValue: self.Screen.text = "0"; first_Number = 0
                case SelectedButtonTag.First.rawValue: self.Screen.text = "1"; first_Number = 1
                case SelectedButtonTag.Second.rawValue: self.Screen.text = "2"; first_Number = 2
                case SelectedButtonTag.Third.rawValue: self.Screen.text = "3"; first_Number = 3
                case SelectedButtonTag.Forth.rawValue: self.Screen.text = "4"; first_Number = 4
                case SelectedButtonTag.Fifth.rawValue: self.Screen.text = "5"; first_Number = 5
                case SelectedButtonTag.Sixth.rawValue: self.Screen.text = "6"; first_Number = 6
                case SelectedButtonTag.Sevneth.rawValue: self.Screen.text = "7"; first_Number = 7
                case SelectedButtonTag.Eighth.rawValue: self.Screen.text = "8"; first_Number = 8
                case SelectedButtonTag.Nineth.rawValue: self.Screen.text = "9"; first_Number = 9
                default:break
            }
        }
        else
        {
            first_Number! *= 10
            switch sender.tag
            {
            case SelectedButtonTag.Zero.rawValue: second_Number = 0 ;
            second_Number = 0;
            first_Number? += second_Number!;
            self.Screen.text = String(describing: first_Number!);
            case SelectedButtonTag.First.rawValue: second_Number = 1 ; second_Number = 1; first_Number? += second_Number!; self.Screen.text = String(describing: first_Number!);
            case SelectedButtonTag.Second.rawValue: second_Number = 2 ; second_Number = 2; first_Number? += second_Number!; self.Screen.text = String(describing: first_Number!);
            case SelectedButtonTag.Third.rawValue: second_Number = 3 ; second_Number = 3; first_Number? += second_Number!; self.Screen.text = String(describing: first_Number!);
            case SelectedButtonTag.Forth.rawValue: second_Number = 4 ;second_Number = 4; first_Number? += second_Number!; self.Screen.text = String(describing: first_Number!);
            case SelectedButtonTag.Fifth.rawValue: second_Number = 5 ; second_Number = 5; first_Number? += second_Number!; self.Screen.text = String(describing: first_Number!);
            case SelectedButtonTag.Sixth.rawValue: second_Number = 6 ; second_Number = 6; first_Number? += second_Number!; self.Screen.text = String(describing: first_Number!);
            case SelectedButtonTag.Sevneth.rawValue: second_Number = 7 ; second_Number = 7; first_Number? += second_Number!; self.Screen.text = String(describing: first_Number!);
            case SelectedButtonTag.Eighth.rawValue: second_Number = 8 ; second_Number = 8; first_Number? += second_Number!; self.Screen.text = String(describing: first_Number!);
            case SelectedButtonTag.Nineth.rawValue: second_Number = 9 ; second_Number = 9; first_Number? += second_Number!; self.Screen.text = String(describing: first_Number!);
            default:break
            }
        }
    }
}


