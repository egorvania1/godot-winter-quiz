extends HBoxContainer

@onready var audioStreamPlayer : AudioStreamPlayer = $AudioStreamPlayer
@onready var soundProgressBar = $SoundProgressBar
@onready var playButton = $PlayButton

var curPosition = 0.0
var startPosition = 0.0
var endPosition = 100.0
var audioPath

var isDragged: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	audioStreamPlayer.stream = AudioStreamOggVorbis.load_from_file(audioPath)
	endPosition = audioStreamPlayer.stream.get_length()
	print(endPosition)
	soundProgressBar.max_value = endPosition

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if audioStreamPlayer.playing && !isDragged:
		curPosition = audioStreamPlayer.get_playback_position()
		soundProgressBar.value = curPosition

func _play() -> void:
	audioStreamPlayer.play(curPosition)

func _pause() -> void:
	audioStreamPlayer.stop()
	
func _seek(seekPos: float) -> void:
	audioStreamPlayer.seek(seekPos)

func _on_play_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		_play()
	else:
		_pause()


func _on_sound_progress_bar_drag_ended(value_changed: bool) -> void:
	isDragged = false
	curPosition = soundProgressBar.value
	_seek(curPosition)


func _on_sound_progress_bar_drag_started() -> void:
	isDragged = true
