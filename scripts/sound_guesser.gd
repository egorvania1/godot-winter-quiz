extends "res://scripts/generic_guesser.gd"

var soundPath
@onready var audioPlayer = $AudioStreamPlayer
@onready var soundProgressBar = $Question/HBoxContainer/SoundProgressBar
@onready var playButton = $Question/HBoxContainer/Play

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	audioPlayer.stream = AudioStreamOggVorbis.load_from_file(soundPath)
	playButton.toggled.connect(_on_play_toggled)
	soundProgressBar.value = audioPlayer.

func _on_play_toggled(toggled_on: bool) -> void:
	print("hi")
