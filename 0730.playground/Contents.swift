import Foundation

//func AlphaToInt(_ alpha: Character) -> UInt8 {
//    return (alpha).asciiValue ?? 0
//}
//
//func solution(_ name:String) -> Int {
//    let start = Array.init(repeating: 65, count: name.count)
//    var tomove: [Character] = []
//
//    for index in name {
//    }
//
//    print(tomove)
//
//    return 0
//}

//let string = "hope"
//let char = string[string.index(string.startIndex, offsetBy: 2)]
//char.asciiValue

//solution("AABABBAA")

//65 66 67 ... 90
//0 1 2 ... 25
//26-1 25
//26-2 24

//func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
//    var lostarr = lost.sorted()
//    var reservearr = reserve.sorted()
//    var saved = 0
//
//    for i in reservearr {
//        if lostarr.contains(i) {
//            lostarr.remove(at: lostarr.firstIndex(of: i)!)
//            reservearr.remove(at: reservearr.firstIndex(of: i)!)
//        }
//    }
//
//    for i in reservearr {
//        if lostarr.contains(i-1) {
//            saved += 1
//            lostarr.remove(at: lostarr.firstIndex(of: i-1)!)
//        }
//        else if lostarr.contains(i+1) {
//            saved += 1
//            lostarr.remove(at: lostarr.firstIndex(of: i+1)!)
//        }
//    }
//
//    print(lostarr)
//    return n-lostarr.count
//}

//solution(7, [2,3,4], [1,2,3,6])

import Foundation

func solution(_ number:String, _ k:Int) -> String {
    let numberToArr = number.map{ $0 }
    var deletedCount = 0
    var Stack: [Character] = []
    var index = 0
    
    while deletedCount < k, index < numberToArr.count {
        let nownum = numberToArr[index]
        
        
//        if Stack.isEmpty {
//            Stack.append(nownum)
//            index += 1
//            continue
//        }
//
//        if let peek = Stack.last, peek < nownum {
//            Stack = Stack.dropLast()
//            deletedCount += 1
//            continue
//        }
        
        Stack.append(nownum)
        index += 1
    }
    
    Stack.append(contentsOf: numberToArr[index...])
    
    if deletedCount < k {
        return Stack[0..<numberToArr.count-k].reduce(""){"\($0)\($1)"}
    }
    
    return Stack.reduce("", { "\($0)\($1)" })
}

func solution2(_ number: String, _ k:Int) -> String {
    var numArr: [Character] = number.map { $0 }
    var stack: [Character] = []
    var delete: Int = 0
    var i: Int = 0
    
    while delete < k && i < numArr.count {
        print(stack)
        // 스택이 비어있으면
        // 현재 인덱스의 숫자를 넣는다. (i 증가)
        guard let last = stack.last else {
            stack.append(numArr[i])
            print("append \(numArr[i])")
            i += 1
            continue
        }
        
        // 스택의 마지막 숫자보다 현재 인덱스의 숫자가 크면
        // 스택의 마지막 숫자를 꺼내고 현재 인덱스의 숫자를 넣는다.
        if last < numArr[i] {
            stack.removeLast()
            print("removw \(last)")
            delete += 1
            continue
        }
        
        // 스택에 현재 인덱스의 숫자를 넣는다.(i 증가)
        stack.append(numArr[i])
        print("append \(numArr[i])")
        i += 1
    }
    
    // k개의 숫자를 제거 완료한 경우
    // 아직 탐색 못한 숫자들까지 합친다.
    if delete >= k {
        stack.append(contentsOf: numArr[i...])
    }
    
    // 인덱스를 끝까지 탐색했는데도 k개 제거하지 못했을 경우
    // 뒤에서부터 k개는 제거한다
    if i >= numArr.count {
        return stack[0..<numArr.count-k].reduce(""){"\($0)\($1)"}
    }
    
    return stack.reduce(""){"\($0)\($1)"}
}

//solution("4177252841", 4)

var testArray = Array.init(repeating: 5, count: 100)

func checkTime() {
    var startTime = CFAbsoluteTimeGetCurrent()
    
    testArray.removeLast()
    
    var durationTime = CFAbsoluteTimeGetCurrent() - startTime
    print("removeLast 경과 시간: \(durationTime)")
    
    testArray = Array.init(repeating: 5, count: 100)
    
    startTime = CFAbsoluteTimeGetCurrent()
    
    testArray = testArray.dropLast()
    
    durationTime = CFAbsoluteTimeGetCurrent() - startTime
    print("dropLast 경과 시간: \(durationTime)")
}

checkTime()

// guard 랑 removeLast 차이인가..

