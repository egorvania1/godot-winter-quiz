extends Control

var questionType
var questionName = "This is a name"
var questionDifficulty = "This is difficulty"
var answerPicPath = "res://data/pictures/AnswerPic.png"
var answer = "Here is the answer"

@onready var questionGroup = $Question
@onready var answerGroup = $Answer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Header/Topic.text = questionName
	$Header/Difficulty.text = questionDifficulty
	var answerImage = load(answerPicPath)
	$Answer/VBoxContainer/AnswerPicture.texture = answerImage
	$Answer/VBoxContainer/AnswerLabel.text = answer
	
	$Close.pressed.connect(_on_close_pressed)
	$Show.toggled.connect(_on_show_toggled)
	
func _on_close_pressed():
	get_parent().showQuestions()
	queue_free()
	
func _on_show_toggled(toggled_on: bool):
	if toggled_on:
		questionGroup.visible = false
		answerGroup.visible = true
	else:
		questionGroup.visible = true
		answerGroup.visible = false
