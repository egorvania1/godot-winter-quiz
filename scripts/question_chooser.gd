extends Control

var json_path : String = "res://data/questionData.json"
var questionsData : Dictionary
@onready var questionGrid = $QuestionGrid

const pictureScene: PackedScene = preload("res://scenes/pictureGuesser.tscn")
const soundScene: PackedScene = preload("res://scenes/soundGuesser.tscn")
const textScene: PackedScene = preload("res://scenes/textGuesser.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	questionsData = load_json_file(json_path)
	

func _on_question_pressed(questionName: String) -> void:
	var questionData : Dictionary = questionsData[questionName]
	var questionType = questionData["type"]
	
	questionGrid.visible = false
	var newQuestion
	
	match questionType:
		"sound":
			newQuestion = soundScene.instantiate()
			newQuestion.soundPath = questionData["soundPath"]
		"picture":
			newQuestion = pictureScene.instantiate()
			newQuestion.questionPicturePath = questionData["picturePath"]
		"text":
			newQuestion = textScene.instantiate()
			newQuestion.quote = questionData["quote"]
	
	newQuestion.questionType = questionData["type"]
	newQuestion.questionName = questionData["name"]
	newQuestion.questionDifficulty = questionData["difficulty"]
	newQuestion.answerPicPath = questionData["answerPicPath"]
	newQuestion.answer = questionData["answer"]
	
	add_child(newQuestion)


func load_json_file(path: String) -> Dictionary:
	var file = FileAccess.open(path, FileAccess.READ)
	var parsedFile = JSON.parse_string(file.get_as_text())
	return parsedFile


func showQuestions():
	questionGrid.visible = true
