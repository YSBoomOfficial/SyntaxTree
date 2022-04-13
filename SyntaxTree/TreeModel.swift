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

class Node: CustomStringConvertible {
	var label: String
	
	init(label: String) {
		self.label = label
	}
	var description: String { label }
}

class XP: Node {
	var spec: XP?
	var xBar: XBar
	
	init(label: String, spec: XP?, xBar: XBar) {
		self.spec = spec
		self.xBar = xBar
		super.init(label: label)
	}

	override var description: String {
		if spec == nil {
			return "\(label)\n|\n\(xBar.description)"
		} else {
			return "\(label)\n/\\\n\(spec?.description ?? "XP") \(xBar.description)"
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

	override var description: String {
		if adjunct == nil, compliment == nil, xBar == nil, head != nil {
			return "\(label)\n|\n\(head?.description ?? "head")"
		} else if adjunct == nil, xBar == nil, compliment != nil, head != nil {
			return"\(label)\n/\\\n\(head?.description ?? "head") \(compliment?.description ?? "XP")"
		} else if adjunct != nil, xBar != nil, compliment == nil, head == nil {
			return"\(label)\n/\\\n\(adjunct?.description ?? "XP") \(xBar?.description ?? "XBar")"
		} else if adjunct == nil, compliment == nil, xBar != nil, head == nil {
			return "\(label)\n|\n\(xBar?.description ?? "XBar")"
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

	override var description: String {
		"\(label)\n\(value)"
	}
}
