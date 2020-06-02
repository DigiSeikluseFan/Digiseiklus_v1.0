extends Node2D
export (String, FILE, "*.tscn") var level_scene
export (String) var question
export (String) var randAnswer
export (String) var answer1
export (String) var answer2
export (String) var answer3
export (Array)  var answers


var questionList = {}
var randomList

onready var button_right = get_node("VASTA")

var rightAnswer 

func _ready():
	AudioEffects.get_node("küsimuse_taust").play()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	randomize()
	if CheckpointRed1.isCheckpoint1:
		print(CheckpointRed1.isCheckpoint1, "checkpoint 1 küsimused")
		questionList = TeleporterData.questionList1
		randomList = questionList[randi() % questionList.size()+1]	
	elif TeleporterData.isCheckpointPassed and CheckpointRed2.isCheckpoint2:
		questionList = TeleporterData.questionList2
		randomList = questionList[randi() % questionList.size()+1]
	elif TeleporterData.isCheckpointPassed and CheckpointRed3.isCheckpoint3:
		questionList = TeleporterData.questionList3
		randomList = questionList[randi() % questionList.size()+1]
	elif TeleporterData.isCheckpointPassed and TeleporterData.checkpoint == CheckpointRed3:
		questionList = TeleporterData.questionList4
		randomList = questionList[randi() % questionList.size()+1]
	elif TeleporterData.isCheckpointPassed and CheckpointRed4.isCheckpoint4:
		questionList = TeleporterData.questionList4
		randomList = questionList[randi() % questionList.size()+1]
	elif TeleporterData.isCheckpointPassed and CheckpointRed5.isCheckpoint5:
		questionList = TeleporterData.questionList5
		randomList = questionList[randi() % questionList.size()+1]
		TeleporterData.isCheckpoint5 = true
	elif CheckpointRed21.isCheckpoint2_1:
		questionList = TeleporterData.questionList6
		randomList = questionList[randi() % questionList.size()+1]
	elif TeleporterData.isCheckpointPassed and CheckpointRed22.isCheckpoint2_2:
		questionList = TeleporterData.questionList7
		randomList = questionList[randi() % questionList.size()+1]
	elif TeleporterData.isCheckpointPassed and CheckpointRed23.isCheckpoint2_3:
		questionList = TeleporterData.questionList8
		randomList = questionList[randi() % questionList.size()+1]
	elif TeleporterData.isCheckpointPassed and CheckpointRed24.isCheckpoint2_4:
		questionList = TeleporterData.questionList9
		randomList = questionList[randi() % questionList.size()+1]
	elif TeleporterData.isCheckpointPassed and CheckpointRed25.isCheckpoint2_5:
		questionList = TeleporterData.questionList10
		randomList = questionList[randi() % questionList.size()+1]
	else:
		print("Rohkem pole Checkpointi")
		
		
	question = randomList.get("label")
	get_node("Question").set_text(question)
	
	var answersL = []
	for ans in randomList.values():
#		print(ans)
		if ans == randomList.get("answer1") or ans == randomList.get("answer2"): 
			answersL.insert(0, ans)
		else: 
			if ans == randomList.get("answer_right"):
					rightAnswer = ans
					answersL.insert(0, ans)
	
	answersL.shuffle()
	
	get_node("Vastuste_container/RadioBtn_conteiner/Vastus1").set_text(answersL[0]) 
	get_node("Vastuste_container/RadioBtn_conteiner/Vastus2").set_text(answersL[1])    
	get_node("Vastuste_container/RadioBtn_conteiner/Vastus3").set_text(answersL[2])
	
	button_right.connect("pressed", self, "_on_VASTA_pressed", [get_name()])
var counter = 0	

func _on_Vastus1_pressed():
	if rightAnswer == get_node("Vastuste_container/RadioBtn_conteiner/Vastus1").text:
		counter += 1
		TeleporterData.isCheckpointPassed = true
		print(counter)
	else:
		if counter >= 1:
			counter = 0

func _on_Vastus2_pressed():
	if  rightAnswer == get_node("Vastuste_container/RadioBtn_conteiner/Vastus2").text:
		counter += 1
		TeleporterData.isCheckpointPassed = true
		print(counter)
	else:
		if counter >= 1:
			counter = 0
	
func _on_Vastus3_pressed():
	if rightAnswer == get_node("Vastuste_container/RadioBtn_conteiner/Vastus3").text:
		counter += 1
		print(counter)
		TeleporterData.isCheckpointPassed = true
	else:
		if counter >= 1:
			counter = 0
	

func _on_VASTA_pressed():
	if counter >= 1 and !TeleporterData.isCheckpoint5:
		get_tree().change_scene("res://src/Question_AnswerRight.tscn")
	elif counter >=1 and TeleporterData.isCheckpoint5 and TeleporterData.isLevel1:
		get_tree().change_scene("res://src/Tase_läbitud.tscn")	
	else:
		print("Vale vastus; ", counter)
		get_tree().change_scene("res://src/Question_AnswerWrong.tscn")	
		

