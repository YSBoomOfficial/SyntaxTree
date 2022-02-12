import Foundation

/*
 – All phrases have a head (X), a bar level (X′), and a phrasal level (XP).
 // MARK: XP -> X' -> X
 – Specifier: sister of X′, daughter of XP
 // MARK: XP -> Spec X'
 – Adjunct: sister and daughter of X′
 // MARK: X' -> Adjunct X'
 – Complement: sister of X, daughter of X′
 // MARK: X' -> X Complement
 */

func spc(_ amt: String) -> String {
	var result = ""
	for _ in 1..<Int(amt.count/2) {
		result += " "
	}
	return result
}

class Node {
	var label: String
	
	init(label: String) {
		self.label = label
	}
}

class XP: Node {
	var spec: XP?
	var xBar: XBar
	
	init(label: String, spec: XP?, xBar: XBar) {
		self.spec = spec
		self.xBar = xBar
		super.init(label: label)
	}
	
	func getXP() -> String {
		if spec == nil {
			return "\(label)\n\(spc(label))|\n\(xBar.geteXbar())"
		} else {
			return "\(label)\n\(spc(label))/\\\n\(spec?.getXP() ?? "XP") \(xBar.geteXbar())"
		}
	}
}

class XBar: Node {
	var adjunct: XP?
	var xBar: XBar?
	var head: X?
	var compliment: XP?

	init(label: String, adjunct: XP?, xBar: XBar?, head: X?, compliment: XP?) {
		self.adjunct = adjunct
		self.xBar = xBar
		self.head = head
		self.compliment = compliment
		super.init(label: label)
	}

	func geteXbar() -> String {
		if adjunct == nil, compliment == nil, xBar == nil, head != nil {
			return "\(label)\n\(spc(label))|\n\(head?.getX() ?? "head")"
		} else if adjunct == nil, xBar == nil, compliment != nil, head != nil {
			return"\(label)\n\(spc(label))/\\\n\(head?.getX() ?? "head") \(compliment?.getXP() ?? "XP")"
		} else if adjunct != nil, xBar != nil, compliment == nil, head == nil {
			return"\(label)\n\(spc(label))/\\\n\(adjunct?.getXP() ?? "XP") \(xBar?.geteXbar() ?? "XBar")"
		} else if adjunct == nil, compliment == nil, xBar != nil, head == nil {
			return "\(label)\n\(spc(label))|\n\(xBar?.geteXbar() ?? "XBar")"
		}
		return "Shouldn't be here"
	}
}

class X: Node {
	var value: String
	
	init(label: String, value: String) {
		self.value = value
		super.init(label: label)
	}
	
	func getX() -> String {
		return "\(label)\n\(value)"
	}
}

let N = X(label: "N", value: "Noun")
let NBar = XBar(label: "N-Bar", adjunct: nil, xBar: nil, head: N, compliment: nil)
let NP = XP(label: "NP", spec: nil, xBar: NBar)

let D = X(label: "D", value: "The")
let DBar1 = XBar(label: "D'", adjunct: nil, xBar: nil, head: D, compliment: NP)
let DBar2 = XBar(label: "D'", adjunct: nil, xBar: DBar1, head: nil, compliment: nil)
let DP = XP(label: "DP", spec: nil, xBar: DBar2)

print(DP.getXP())

