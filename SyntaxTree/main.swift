//
//  main.swift
//  SyntaxTree
//
//  Created by Yash Shah on 14/04/2022.
//

import Foundation

// Test tree
let N = X(label: "N", value: "Noun")
let NBar = XBar(label: "N-Bar", adjunct: nil, xBar: nil, head: N, compliment: nil)
let NP = XP(label: "NP", spec: nil, xBar: NBar)

let D = X(label: "D", value: "The")
let DBar1 = XBar(label: "D'", adjunct: nil, xBar: nil, head: D, compliment: NP)
let DBar2 = XBar(label: "D'", adjunct: nil, xBar: DBar1, head: nil, compliment: nil)
let DP = XP(label: "DP", spec: nil, xBar: DBar2)

print(DP)

// test bracket matching
let CPstr = "[CP [C' [C Ø][TP [DP_a [D' [D ][NP [N' [N ]]]]][T' [T ][VoiceP/PassP t <a> [Voice’/Pass' [Voice/Pass][VP t <a> [V' [V ][DP/CP/PP]]]]]]]]]"

let DPstr = "[DP [D' [D ][NP [N' [N ]]]]]"

let PPstr = "[PP [P' [P ][DP ]]]"

let XPstr = "[XP [X’ [X]]]"

//print(validateBracketPairs(string: CPstr),
//	  validateBracketPairs(string: DPstr),
//	  validateBracketPairs(string: PPstr),
//	  validateBracketPairs(string: XPstr))
