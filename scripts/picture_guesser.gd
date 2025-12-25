extends "res://scripts/generic_guesser.gd"

var questionPicturePath = "res://data/pictures/QuestionPic.png"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	var image = load(questionPicturePath)
	$Question/QuestionPicture.texture = image
