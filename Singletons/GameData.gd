extends Node


var tower_data = {
	"gunt1":{
		"damage": 1,
		"fire_rate": 1.0,
		"range": 450,
		"cost": 10,
		"category": "projectile"
	},
	
	"missilet1":{
		"damage": 100,
		"fire_rate": 3.0,
		"range": 550,
		"cost": 20,
		"category": "missile"
	},
	
	"doubleshootert1":{
		"damage": 2,
		"fire_rate": 1.5,
		"range": 220,
		"cost": 45,
		"category": "projectile"
	},
	
	"tripleshootert1":{
		"damage": 6,
		"fire_rate": 2,
		"range": 450,
		"cost": 50,
		"category": "projectile"
	}
}

var questions = {
	##
	## ACID | Base | POLYATOMIC | Neither Questions
	##
	"1":{
		"Question": "What is BaCrO\u2084?",
		"Answer": "Base",
		"Options": {
			"1": "Acid",
			"2": "Base",
			"3": "Polyatomic",
			"4": "Neither"
		}
	},

	"2":{
		"Question": "What is AgCl?",
		"Answer": "Neither",
		"Options": {
			"1": "Acid",
			"2": "Base",
			"3": "Polyatomic",
			"4": "Neither"
		}
	},

	"3":{
		"Question": "What is CCl\u2084?",
		"Answer": "Neither",
		"Options": {
			"1": "Acid",
			"2": "Base",
			"3": "Polyatomic",
			"4": "Neither"
		}
	},

	"4":{
		"Question": "What is HCLO\u2084?",
		"Answer": "Acid",
		"Options": {
			"1": "Acid",
			"2": "Base",
			"3": "Polyatomic",
			"4": "Neither"
		}
	},

	"5":{
		"Question": "What is HNO\u2082?",
		"Answer": "Acid",
		"Options": {
			"1": "Acid",
			"2": "Base",
			"3": "Polyatomic",
			"4": "Neither"
		}
	},

	"6":{
		"Question": "What is C\u2083H\u2088",
		"Answer": "Neither",
		"Options": {
			"1": "Acid",
			"2": "Base",
			"3": "Polyatomic",
			"4": "Neither"
		}
	}
	
	
}
