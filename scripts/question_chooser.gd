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
	match questionType:
		"sound":
			print("WIPsound")
		"picture":
			questionGrid.visible = false
			var newQuestion = pictureScene.instantiate()
			newQuestion.questionType = questionData["type"]
			newQuestion.questionName = questionData["name"]
			newQuestion.questionDifficulty = questionData["difficulty"]
			newQuestion.answerPicPath = questionData["answerPicPath"]
			newQuestion.answer = questionData["answer"]
			newQuestion.picturePath = questionData["picturePath"]
			add_child(newQuestion)
		"text":
			questionGrid.visible = false
			var newQuestion = pictureScene.instantiate()
			newQuestion.questionType = questionData["type"]
			newQuestion.questionName = questionData["name"]
			newQuestion.questionDifficulty = questionData["difficulty"]
			newQuestion.answerPicPath = questionData["answerPicPath"]
			newQuestion.answer = questionData["answer"]
			newQuestion.quote = questionData["quote"]
			add_child(newQuestion)

func load_json_file(path: String) -> Dictionary:
	var file = FileAccess.open(path, FileAccess.READ)
	var parsedFile = JSON.parse_string(file.get_as_text())
	return parsedFile
	
func showQuestions():
	questionGrid.visible = true
