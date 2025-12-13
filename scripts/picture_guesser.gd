extends "res://scripts/generic_guesser.gd"

var picturePath

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	var image = Image.load_from_file(picturePath)
	$Question/Picture.texture = ImageTexture.create_from_image(image)
