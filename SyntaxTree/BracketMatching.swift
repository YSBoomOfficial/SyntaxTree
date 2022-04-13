//
//  BracketMatching.swift
//  SyntaxTree
//
//  Created by Yash Shah on 14/04/2022.
//

import Foundation

// sees if a string with brackets is is balanced
func validateBracketPairs(string: String) -> Bool {
	var stack = [String.Element]()

	for elem in Array(string) {
		switch elem {
			case "{", "[", "(", "\\":
				if elem == "\\" { continue } // escape char "\" eg: "\[test\]" -> "[test]"
//				print("adding: \(elem)")
				stack.append(elem)
			case "}", "]", ")":
				if stack.isEmpty
					|| (elem == "}" && stack.last != "{")
					|| (elem == "]" && stack.last != "[")
					|| (elem == ")" && stack.last != "(") {
					return false
				}
//				print("removing: \(stack.last)")
				stack.removeLast()
			default:
				continue
		}
	}

	if !stack.isEmpty { print(stack)}
	return stack.isEmpty
}
