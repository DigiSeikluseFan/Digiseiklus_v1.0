extends Node2D

#spawns player location to scene
var player_location = Vector2(236.82,789.579)
var player_spawn = load("res://src/Actors/Player.tscn")
var checkpoint = null
var isCheckpointPassed = false
var isRightAnswer = false
var questionList

func _ready():
	set_process(true)
	set_process_input(true)
	player_spawn = player_spawn.instance()

	TeleporterData.set("player_location", player_location)
	TeleporterData.set("player_spawn", player_spawn)
	TeleporterData.set("isCHeckpointPassed", isCheckpointPassed)
	TeleporterData.set("checkpoint", checkpoint)
	
			
var questionList1 = { 
	1:{
		"label": "Mida peaksid oma arvutis olevate oluliste failidega tegema? ",
		"answer1": "Mitte kellelegi neist rääkima.",
		"answer2": "Salvestama need igaks juhuks mitmesse erinevasse kohta.",
		"answer_right":"Tegema neist varukoopiad"	
	 
	},
	2:{
		"label": "Kas veebis avaldatud pilti on võimalik kustutada?",
		"answer1":"Jah, alati.",
		"answer_right": "Ei ole.",
		"answer2":"Pole teada."	
		
	},
	3:{
		"label": "Kas internetist leitud pilte võib sotsiaalmeedias vabalt avaldada?",
		"answer_right":"Võib kui piltide omanik seda lubab.",
		"answer2":"Ei või mitte kunagi.",
		"answer1":"Internetis võib kõike vabalt avaldada."
	}
}
var questionList2 = {
	1:{
		"label": "Kuidas reageerid kui sõber kirjutab sulle Messengeris: “Olen lollakas ja hüppan aknast alla.”?",
		"answer1": "Kirjutad vastuseks naeratavad emojid.",
		"answer_right": "Helistad sõbrale ja uurid, kas see oli ikka tema ise kes kirjutas.",
		"answer2": "Ignoreerid teda."	
	},
	2:{
		"label": "Sõber tahab sinult sinu Facebooki konto parooli saada. Kas annad?",
		"answer1": "Kindlasti - ta ju hea sõber!",
		"answer_right": "Üritad leida viisaka võimaluse keelduda.",
		"answer2": "Annad sõbrale vale parooli."
	},
	3:{
		"label": "Mis funktsioon on arvutis tulemüüril?",
		"answer1": "Jahutab arvutit.",
		"answer_right": "Ei lase võõraid internetist sinu arvutile ligi.",
		"answer2": "Kaitseb arvutit viiruste eest."
	}
}
var questionList3 = {
	1:{
		"label": "Milline neist on turvaline salasõna?",
		"answer1": "MinuNimiOnKarl123",
		"answer_right": "5870wJK446",
		"answer2": "Password"
	},
	2:{
		"label": "Internetis enim levinud suhtlusportaal?",
		"answer1": "Instagram",
		"answer_right": "Facebook",
		"answer2": "LinkedIn"
	},
	3:{
		"label": "Portaal, kus inimesed saavad “säutsuda”?",
		"answer1": "Facebook",
		"answer_right": "Twitter",
		"answer2": "Snapchat"
	}
}
var questionList4 = {
	1:{
		"label": "Milline järgnevast on tark käitumine internetis?",
		"answer1": "Võõrale inimesele enda isikuandmete ja aadressi avaldamine.",
		"answer_right": "Isikuandmete mitteavaldamine.",
		"answer2": "Suvalistele inimestele endast piltide saatmine."
	},
	2:{
		"label": "Keda peaksid lisama sotsiaalvõrgustikes sõprade nimekirja?",
		"answer1": "Mingi tüübi, kellega mitu aastat tagasi ühel sünnipäeval korra rääkisid",
		"answer_right": "Inimesi, keda päriselt tunned",
		"answer2": "Suvalised inimesed, keda otsingust leiad"
	},
	3:{
		"label": "Milliseid ekraanilukke on võimalik nutitelefonile peale panna?",
		"answer1": "Sõrmejälg, lihtne avamine ühe nupu abil",
		"answer_right": "Kood, muster, sõrmejälg",
		"answer2": "Kood, muster, lihtne avamine ühe nupu abil"
	}
}
var questionList5 = {
	1:{
		"label": "Milline neist on usaldusväärne pood rakenduste allalaadimiseks?",
		"answer1": "Aliexpress.com",
		"answer_right": "Google Play",
		"answer2": "Ebay"
	},
	2:{
		"label": "Miks pole soovitatav kasutada paroolita WIFI võrke?",
		"answer1": "Need on liiga turvalised",
		"answer_right": "Need ei ole sama turvalised kui parooliga võrgud",
		"answer2": "Need tavaliselt ei tööta"
	},
	3:{
		"label": "Milline neist tunnustest viitab küberkiusamisele?",
		"answer1": "Sõbralikult sotsiaalmeedias pildi kommenteerimine",
		"answer_right": "Ähvardavad, õelad e-kirjad ja tekstisõnumid",
		"answer2": "Luba küsimine enne sinu pildi jagamist"
	}
}
