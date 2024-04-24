extends Node


var tower_data = {
	"gunt1":{
		"damage": 1,
		"fire_rate": 1.0,
		"range": 450,
		"cost": 20,
		"category": "projectile"
	},
	
	"missilet1":{
		"damage": 100,
		"fire_rate": 3.0,
		"range": 550,
		"cost": 45,
		"category": "missile"
	},
	
	"doubleshootert1":{
		"damage": 2,
		"fire_rate": 1.5,
		"range": 220,
		"cost": 60,
		"category": "projectile"
	},
	
	"tripleshootert1":{
		"damage": 6,
		"fire_rate": 2,
		"range": 450,
		"cost": 150,
		"category": "projectile"
	}
}



var questions = {
	##
	## ACID | Base | POLYATOMIC | Neither Questions
	##
	"1":{
		"Question": "What is BaCrO4",
		"Answer": "Salt",
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
			"3": "Salt",
			"4": "Neither"
		}
	},

	"3":{
		"Question": "What is CCl4",
		"Answer": "Neither",
		"Options": {
			"1": "Acid",
			"2": "Base",
			"3": "Polyatomic",
			"4": "Neither"
		}
	},

	"4":{
		"Question": "What is HCLO4",
		"Answer": "Acid",
		"Options": {
			"1": "Acid",
			"2": "Base",
			"3": "Polyatomic",
			"4": "Noble Gas"
		}
	},

	"5":{
		"Question": "What is HNO2",
		"Answer": "Acid",
		"Options": {
			"1": "Base",
			"2": "Acid",
			"3": "Polyatomic",
			"4": "Neither"
		}
	},

	"6":{
		"Question": "What is C3H8",
		"Answer": "Neither",
		"Options": {
			"1": "Acid",
			"2": "Salt",
			"3": "Neither",
			"4": "Base"
		}
	},

	"7":{
		"Question": "What is CH3COOH?",
		"Answer": "Acid",
		"Options": {
			"1": "Acid",
			"2": "Base",
			"3": "Polyatomic",
			"4": "Neither"
		}
	},

	"8":{
		"Question": "What is MgC2O4",
		"Answer": "Base",
		"Options": {
			"1": "Acid",
			"2": "Base",
			"3": "Polyatomic",
			"4": "Neither"
		}
	},

	"9":{
		"Question": "What is HCN?",
		"Answer": "Acid",
		"Options": {
			"1": "Acid",
			"2": "Base",
			"3": "Polyatomic",
			"4": "Neither"
		}
	},

	"10":{
		"Question": "What is CH4?",
		"Answer": "Neither",
		"Options": {
			"1": "Acid",
			"2": "Base",
			"3": "Polyatomic",
			"4": "Neither"
		}
	},

	"11":{
		"Question": "What is CaCO3",
		"Answer": "Base",
		"Options": {
			"1": "Acid",
			"2": "Base",
			"3": "Polyatomic",
			"4": "Neither"
		}
	},

	"12":{
		"Question": "What is K2SO3",
		"Answer": "Base",
		"Options": {
			"1": "Acid",
			"2": "Base",
			"3": "Polyatomic",
			"4": "Neither"
		}
	},

	"13":{
		"Question": "What is NO3",
		"Answer": "Polyatomic",
		"Options": {
			"1": "Acid",
			"2": "Base",
			"3": "Polyatomic",
			"4": "Neither"
		}
	},

	"14":{
		"Question": "What is SO4",
		"Answer": "Polyatomic",
		"Options": {
			"1": "Acid",
			"2": "Base",
			"3": "Polyatomic",
			"4": "Neither"
		}
	},

	"15":{
		"Question": "What is NO2",
		"Answer": "Polyatomic",
		"Options": {
			"1": "Acid",
			"2": "Base",
			"3": "Polyatomic",
			"4": "Neither"
		}
	},

	##
	## BALANCE EQUATIONS
	##
	"16":{
		"Question": "What is the products and balance for the acid-base equation KNO2 (aq) + HClO4 (aq) 2 ?",
		"Answer": "HNO2 (aq) + K (aq) + ClO4 (aq)",
		"Options": {
			"1": "HNO2 (aq) + K (aq) + ClO4 (aq)",
			"2": "HNO2 (aq) + K (aq) + ClO4 (aq) + H2O (l)",
			"3": "HNO2 (aq) + K (aq) + ClO4 (aq) + H2O (l) + O2 (g)",
			"4": "No Reaction"
		}
	},

	"17":{
		"Question": "What is the products and balance for the acid-base equation KNO3 (aq) + HClO4 (aq) 2",
		"Answer": "No Reaction",
		"Options": {
			"1": "HNO2 (aq) + K (aq) + ClO4 (aq)",
			"2": "HNO2 (aq) + K (aq) + ClO4 (aq) + H2O (l)",
			"3": "HNO2 (aq) + K (aq) + ClO4 (aq) + H2O (l) + O2 (g)",
			"4": "No Reaction"
		}
	},

	"18":{
		"Question": "What is the products and balance for the acid-base equation HCl (aq) + H2O (l) 2",
		"Answer": "H3O4 (aq) + Cl (aq)",
		"Options": {
			"1": "H3O4 (aq) + Cl (aq) + O2 (g)",
			"2": "H3O4 (aq) + Cl (aq)",
			"3": "H3O4 (aq) + Cl (aq) + O2 (g) + H2O (l)",
			"4": "No Reaction"
		}
	},

	"19":{
		"Question": "What is the products and balance for the acid-base equation HCN (aq) + H2O (l) 2",
		"Answer": "H3O (aq) + CN (aq)",
		"Options": {
			"1": "H3O (aq) + CN (aq) + O2 (g)",
			"2": "H3O (aq) + CN (aq)",
			"3": "H3O (aq) + CN (aq) + O2 (g) + H2O (l)",
			"4": "No Reaction"
		}
	},

	"20":{
		"Question": "What is the products and balance for the acid-base equation KClO4 (aq) + HBr (aq) 2",
		"Answer": "No Reaction",
		"Options": {
			"1": "HClO4 (aq) + KBr (aq)",
			"2": "HClO4 (aq) + KBr (aq) + H2O (l)",
			"3": "HClO4 (aq) + KBr (aq) + H2O (l) + O2 (g)",
			"4": "No Reaction"
		}
	},
	"21":{
		"Question": "What is CH3-NH2",
		"Answer": "Base",
		"Options": {
			"1": "Acid",
			"2": "Base",
			"3": "Polyatomic",
			"4": "Neither"
		}
	},
	"22":{
		"Question": "What is Mg(OH)2",
		"Answer": "Base",
		"Options": {
			"1": "Acid",
			"2": "Base",
			"3": "Polyatomic",
			"4": "Neither"
		}
	},
	"23":{
		"Question": "What is HCl",
		"Answer": "Acid",
		"Options": {
			"1": "Acid",
			"2": "Base",
			"3": "Polyatomic",
			"4": "Neither"
		}
	},
	"24":{
		"Question": "What is HNO3",
		"Answer": "Acid",
		"Options": {
			"1": "Acid",
			"2": "Base",
			"3": "Polyatomic",
			"4": "Neither"
		}
	},
	"25":{
		"Question": "What is K3PO4",
		"Answer": "Base",
		"Options": {
			"1": "Acid",
			"2": "Base",
			"3": "Polyatomic",
			"4": "Neither"
		}
	},
	"26":{
		"Question": "What is KNO3",
		"Answer": "Neither",
		"Options": {
			"1": "Acid",
			"2": "Base",
			"3": "Polyatomic",
			"4": "Neither"
		}
	},
	"27":{
		"Question": "What is KNO2",
		"Answer": "Neither",
		"Options": {
			"1": "Acid",
			"2": "Base",
			"3": "Polyatomic",
			"4": "Neither"
		}
	},
	
	
}
