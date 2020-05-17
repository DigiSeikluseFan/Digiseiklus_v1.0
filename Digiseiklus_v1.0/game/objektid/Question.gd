extends Node2D
export (String, FILE, "*.tscn") var level_scene
export (String) var question
export (String) var randAnswer
export (String) var answer1
export (String) var answer2
export (String) var answer3
export (Array)  var answers

var questionList = TeleporterData.questionList1
var randomList


onready var button_right = get_node("VASTA")

var rightAnswer 
func _ready():
	
	randomize()
	if CheckpointRed1.isCheckpoint1:
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
	else:
		print("Rohkem pole Checkpointi")
		
		
	question = randomList.get("label")
	get_node("Question").set_text(question)
	
	var answersL = []
	for ans in randomList.values():
		if ans == randomList.get("answer1") or ans == randomList.get("answer2"): 
			answersL.insert(0, ans)
		else: 
			if ans == randomList.get("answer_right"):
				rightAnswer = ans
				answersL.insert(0, ans)
					

	get_node("Vastuste_container/RadioBtn_conteiner/Vastus1").set_text(answersL[0]) 
	get_node("Vastuste_container/RadioBtn_conteiner/Vastus2").set_text(answersL[1])    
	get_node("Vastuste_container/RadioBtn_conteiner/Vastus3").set_text(answersL[2])
	
	button_right.connect("pressed", self, "_on_VASTA_pressed", [get_name()])
var counter = 0	

func _on_Vastus1_pressed():
	if rightAnswer == get_node("Vastuste_container/RadioBtn_conteiner/Vastus1").text:
		counter += 1
		print(counter, rightAnswer)
		TeleporterData.isCheckpointPassed = true
	else:
		print("Vale vastus")

func _on_Vastus2_pressed():
	if  rightAnswer == get_node("Vastuste_container/RadioBtn_conteiner/Vastus2").text:
		counter += 1
		print(counter, rightAnswer)
		TeleporterData.isCheckpointPassed = true
	else:
		print("Vale vastus")
	

func _on_Vastus3_pressed():
	if rightAnswer == get_node("Vastuste_container/RadioBtn_conteiner/Vastus3").text:
		counter += 1
		print(counter," ", rightAnswer)
		TeleporterData.isCheckpointPassed = true
	else:
		print("vale vastus")
	

func _on_VASTA_pressed():
	if counter >= 1:
		get_tree().change_scene("res://objektid/Question_AnswerRight.tscn")
	else:
		get_tree().change_scene("res://objektid/Question_AnswerWrong.tscn")	

