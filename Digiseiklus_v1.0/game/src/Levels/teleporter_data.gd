extends Node2D

#spawns player location to scene
var player_location1 = Vector2(236.82,789.579)
var player_location2 = Vector2(63.086, 681.276)
var player_spawn = load("res://src/Actors/Player.tscn")
var isCheckpoint5 = false
var checkpoint = null
var isCheckpointPassed = false
var isRightAnswer = false
var questionList
var isLevel1 = false
var isLevel2 = false
var soundIsON = true


var CP1_location = Vector2(3877.99,811.591)
var CP2_location = Vector2(7402.33,700.833)
var CP3_location = Vector2(11383.663,701.1)
var CP4_location = Vector2(14619.867,810.552)
var CP2_1_location = Vector2(3877.99,811.591)
var CP2_2_location = Vector2(7768.892,815.583)
var CP2_3_location = Vector2(11639.182,816.048)
var CP2_4_location = Vector2(15514.951,708.719)
var CP2_5_location = Vector2(19157.057,817.314)
func _ready():
	set_process(true)
	set_process_input(true)
	player_spawn = player_spawn.instance()
	
	
	TeleporterData.set("player_spawn", player_spawn)
	TeleporterData.set("isCHeckpointPassed", isCheckpointPassed)
	TeleporterData.set("isCheckpoint5", isCheckpoint5)
	TeleporterData.set("checkpoint", checkpoint)
	TeleporterData.set("CP1_location", CP1_location)
	TeleporterData.set("CP2_location", CP2_location)
	TeleporterData.set("CP3_location", CP3_location)
	TeleporterData.set("CP4_location", CP4_location)	
	TeleporterData.set("CP2_1_location", CP2_1_location)
	TeleporterData.set("CP2_2_location", CP2_2_location)
	TeleporterData.set("CP2_3_location", CP2_3_location)
	TeleporterData.set("CP2_4_location", CP2_4_location)
	TeleporterData.set("CP2_5_location", CP2_5_location)
	TeleporterData.set("isLevel1", isLevel1)
	TeleporterData.set("isLevel2", isLevel2)
	TeleporterData.set("soundIsON", soundIsON)
	
	if isLevel1:
		TeleporterData.set("player_location", player_location1)
		print("Level1_player location1")
	elif isLevel2:
		TeleporterData.set("player_location", player_location2)
		print("Level2 player location: ", player_location2)
	
	
var questionList1 = { 
	1:{
		"label": "Mida peaksid oma arvutis olevate oluliste failidega tegema? ",
		"answer1": "Mitte kellelegi neist rääkima.",
		"answer2": "Salvestama need igaks juhuks mitmesse erinevasse kohta.",
		"answer_right": "Tegema neist varukoopiad."	
	 
	},
	2:{
		"label": "Kas veebis avaldatud pilti on võimalik kustutada?",
		"answer1":"Jah, alati.",
		"answer_right": "Ei ole.",
		"answer2":"Pole teada."	
		
	},
	3:{
		"label": "Kas internetist leitud pilte võib sotsiaalmeedias vabalt avaldada?",
		"answer_right": "Võib kui piltide omanik seda lubab.",
		"answer2": "Ei või mitte kunagi.",
		"answer1": "Internetis võib kõike vabalt avaldada."
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

#Level2
var questionList6 = { 
	1:{
		"label": "Esimene nutitelefon, kus kasutatakse inimese identifitseerimiseks sõrmejälje lugejat? ",
		"answer1": "iPhone X",
		"answer2": "Redmi 8",
		"answer_right": "iPhone 5S"	
	},
	2:{
		"label": "Mille järgi tunned internetis ära potentsiaalse valeuudise? ",
		"answer1": "Uudise pealkirjas on sõna “vale”.",
		"answer2": "Uudis ei avane.",
		"answer_right": "Valeuudise veebiaadress on sarnane mõne tuntud uudistekanali veebiaadressiga."	
		
	},
	3:{
		"label": "Kes või mis on veebikonstaabel? ",
		"answer1": "Turvamees, kes veebi turvab",
		"answer2": "Tavaline internetikasutaja",
		"answer_right": "Internetis töötavad politseinikud"
	}
}
var questionList7 = {
	1:{
		 "label": "Kus peaksid kohtuma veebis saadud sõbraga? ",
		"answer1": "Privaatses kohas, kuhu on raske ligi saada",
		"answer2": "Ei tohiks üldse kohtuda, see on ohtlik!",
		"answer_right": "Avalikus kohas, andes sellest ka teada oma vanematele ja sõpradele"
	},
	2:{
		"label": "Vähemalt mitmest erinevast allikast peaksid internetist leitud informatsiooni kontrollima?",
		"answer1": "Kahest",
		"answer2": "Neljast",
		"answer_right": "Kolmest"	
	},
	3:{
		"label": "Kas internetis kehtivad samad viisakusreeglid, mis päris elus?",
		"answer1": "Ei, internet ei ole päris elu.",
		"answer_right": "Jah, kindlasti.",	
		"answer2": "Oleneb olukorrast."
	}
}
var questionList8 = {
	1:{
		"label": "Kuidas kõige paremini oma halba tuju internetis välja elada?",
		"answer1": "Erinevates kommentaariumites.",
		"answer2": "Facebookis piltidele ebasobivaid kommentaare jättes.",
		"answer_right": "Halba tuju ei tohi internetis välja elada."

	},
	2:{
		"label": "Mis on isikuandmed?",
		"answer1": "Sinu isikukood.",
		"answer2": "Kõik avalikud pildid Sinust internetis.",
		"answer_right": "Kõik andmed, mis aitavad Sind tuvastada."
	},
	3:{
		"label": "Mis on Andmekaitse Inspektsioon?",
		"answer1": "Internetipolitsei",
		"answer2": "Virtuaalne koht, kust teiste andmeid kätte võimalik saada.",
		"answer_right": "Asutus, mis selgitab ja annab nõu isikuandmete kasutamise osas"	
	}
}
var questionList9 = {
	1:{
		"label": "Kuidas sotsiaalmeedias küberkiusajaga tegeleda?",
		"answer1": "Ära tee mitte midagi. ",
		"answer2": "Räägi kiusajaga edasi, veidi põnev ka ju.",
		"answer_right": "Blokeeri kiusaja."	
	},
	2:{
		 "label": "Mis on libakonto?",
		"answer1": "Libahundi tehtud Facebooki konto ",
		"answer2": "Kellegi võõra inimese pildiga konto.",
		"answer_right": "Kiusatava inimese kohta tehtud konto, kus jagatakse halvustavat või valet informatsiooni. "

	},
	3:{
		"label": "Kuidas suhtuda uudistesse, mida internetis loed?",
		"answer1": "Skeptiliselt - ära usu mitte midagi. ",
		"answer2": "Usaldavalt - iga uudis võib sisaldada mingit tõde.",
		"answer_right": "Kriitiliselt - jaga vaid neid uudiseid, mis on usutavad."
	}
}
var questionList10 = {
	1:{
		"label": "Mida pead tegema peale internetis keskkonna kasutamist?",
		"answer1": "Brauseri akna ristist kinni panema.",
		"answer2": "Akna lahti jätma, et sõber ka kasutada saaks.",
		"answer_right": "Keskkonnast välja logima."	
	},
	2:{
		"label": "Mis on kõige turvalisem viis internetis e-teenustesse sisselogimisel?",
		"answer1": "Parool",
		"answer2": "Läbi e-maili",
		"answer_right": "ID-kaart"

	},
	3:{
		"label": "Miks on rakendustes “jäta-mind-meelde” võimaluse kasutamine mittesoovitatav?",
		"answer1": "See tegelikult ei jäta midagi meelde.",
		"answer2": "See vähendab Sinu seadme mälumahtu märgatavalt.",
		"answer_right": "See teeb Sinu andmetele ligipääsu väga lihtsaks"	
	}
}
