extends "res://scripts/generic_guesser.gd"

var quote

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	$Question/Quote.text = quote
