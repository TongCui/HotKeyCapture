//
//  HotKeyCombo.swift
//  HotKeyCapture
//
//  Created by CodeHex on 2016/02/20.
//  Copyright © 2016年 CodeHex. All rights reserved.
//

import Carbon

public class HotKeyCombo {
    
    private var mKeyCode = 0
    private var mModifiers = 0
    
    public var description: String {
        get {
            return self.isValidHotKeyCombo() ? HotKeyCombo.stringForCombo(modifiers: self.modifiers, keyCode: self.keyCode) : "(None)"
        }
    }
    
    public var keyCode: Int {
        get {
            return mKeyCode
        }
    }
    
    public var modifiers: Int {
        get {
            return mModifiers
        }
    }
    
    public init(keyCode: Int, modifiers: Int) {
        self.mKeyCode = keyCode
        self.mModifiers = modifiers
    }
    
    public func isValidHotKeyCombo() -> Bool {
        return mKeyCode >= 0 && mModifiers > 0
    }
    
    public func isClearCombo() -> Bool {
        return mKeyCode == -1 && mModifiers == -1
    }
    
    public class func clearKeyCombo() -> HotKeyCombo {
        return self.keyComboWithKeyCode(keyCode: -1, modifiers: -1)
    }
    
    public class func keyComboWithKeyCode(keyCode keyCode: Int, modifiers: Int) -> HotKeyCombo {
        return HotKeyCombo(keyCode: keyCode, modifiers: modifiers)
    }
    
    public class func stringForCombo(modifiers modifiers: Int, keyCode: Int) -> String {
        
        let modToChar = [
            "⌘" : cmdKey,
            "⌥" : optionKey,
            "⌃" : controlKey,
            "⇧" : shiftKey,
            //"⇪" : alphaLock // Ignore?
        ]
        
        var str = ""
        for (ToChar, mod) in modToChar {
            if modifiers & mod > 0 {
                str += ToChar
            }
        }
        
        let dic = self.keyCodesDictionary
        let key = String(format: "%d", keyCode)
        
        return str + (dic[key] != nil ? String(dic[key]!) : String(format: "%X", keyCode))
    }
    
    public class var keyCodesDictionary: [String:String] {
        get {
            return [
                "0":"A",
                "1":"S",
                "2":"D",
                "3":"F",
                "4":"H",
                "5":"G",
                "6":"Z",
                "7":"X",
                "8":"C",
                "9":"V",
                "10":"$",
                "11":"B",
                "12":"Q",
                "13":"W",
                "14":"E",
                "15":"R",
                "16":"Y",
                "17":"T",
                "18":"1",
                "19":"2",
                "20":"3",
                "21":"4",
                "22":"6",
                "23":"5",
                "24":"=",
                "25":"9",
                "26":"7",
                "27":"-",
                "28":"8",
                "29":"0",
                "30":"]",
                "31":"O",
                "32":"U",
                "33":"[",
                "34":"I",
                "35":"P",
                "36":"Return",
                "37":"L",
                "38":"J",
                "39":"'",
                "40":"K",
                "41":";",
                "42":"\\",
                "43":",",
                "44":"/",
                "45":"N",
                "46":"M",
                "47":".",
                "48":"Tab",
                "49":"Space",
                "50":"`",
                "51":"Delete",
                "53":"ESC",
                "55":"Command",
                "56":"Shift",
                "57":"Caps Lock",
                "58":"Option",
                "59":"Control",
                "65":"Pad .",
                "67":"Pad *",
                "69":"Pad +",
                "71":"Clear",
                "75":"Pad /",
                "76":"Pad Enter",
                "78":"Pad -",
                "81":"Pad =",
                "82":"Pad 0",
                "83":"Pad 1",
                "84":"Pad 2",
                "85":"Pad 3",
                "86":"Pad 4",
                "87":"Pad 5",
                "88":"Pad 6",
                "89":"Pad 7",
                "91":"Pad 8",
                "92":"Pad 9",
                "96":"F5",
                "97":"F6",
                "98":"F7",
                "99":"F3",
                "100":"F8",
                "101":"F9",
                "103":"F11",
                "105":"F13",
                "107":"F14",
                "109":"F10",
                "111":"F12",
                "113":"F15",
                "114":"Ins",
                "115":"Home",
                "116":"Page Up",
                "117":"Del",
                "118":"F4",
                "119":"End",
                "120":"F2",
                "121":"Page Down",
                "122":"F1",
                "123":"Left Arrow",
                "124":"Right Arrow",
                "125":"Down Arrow",
                "126":"Up Arrow"
            ]
        }
    }
    
}
