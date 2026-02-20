extends AudioStreamPlayer2D
class_name Sound

var sound_note_c = preload("res://asset/sound/note_C.wav")
var sound_note_d = preload("res://asset/sound/note_D.wav")
var sound_note_e = preload("res://asset/sound/note_E.wav")
var sound_note_f = preload("res://asset/sound/note_F.wav")
var sound_note_g = preload("res://asset/sound/note_G.wav")

func effect(sound: AudioStream) -> void:
	stream = sound
	play()

func note_c() -> void:
	effect(sound_note_c)
