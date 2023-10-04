//
//  ContentView.swift
//  algorithymsDemo
//
//  Created by Mac on 08/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .onAppear {
            calulateSomething()
        }
        .padding()
    }
    
    func calulateSomething() {
        let message = "this is really a very awesome message"
        print("mine \(splitMessage(message, 9))")
    }
    
    func splitMessage(_ message: String, _ limit: Int) -> [String] {
        var result: [String] = []
        let available = limit - 3
        var a = 0
        for i in 0...(available - 2) {
            let max = 9 * 10^i
            
        }
        return result
    }
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    
    func get(index: Int) -> ListNode? {
        var curr = 1
        var temp: ListNode? = self
        while temp != nil, curr < index {
            if temp?.next == nil {
                return nil
            }
            
            temp = temp?.next
            curr += 1
        }
        return temp
    }
    
    static func convert(arr: [Int]) -> ListNode? {
        var node = ListNode(arr.first!)
        var cur = node
        for i in 1..<arr.count {
            cur.next = ListNode(arr[i])
            cur = cur.next!
        }
        return node
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension String {
    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
    
    func digitsOnly() -> String{
        let newString = components(separatedBy:CharacterSet.decimalDigits.inverted)
            .joined()
        
        return newString
    }
}
