extends AudioStreamPlayer

const game_music = preload("res://Music/Background_Music/In the Deep Woods.wav")
var is_muted: bool = false
var current_scene = "MainMenu"

func play_music(music: AudioStream, volume = 0.0):
	if stream == music:
		return
	
	stream = music 
	volume_db = volume
	play()

func play_music_level():
	play_music(game_music)

func toggle_music_mute():
	if is_muted:
		volume_db = 0.0
	else:
		volume_db = -80.0 
	is_muted = !is_muted

func check_play_music():
	if current_scene != "MainMenu":
		stream_paused = false
	else:
		stream_paused = true
