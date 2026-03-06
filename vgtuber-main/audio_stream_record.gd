extends AudioStreamPlayer2D
var effect
var recording

func _ready():
	# We get the index of the "Record" bus.
	var idx = AudioServer.get_bus_index("Record")
	# And use it to retrieve its first effect, which has been defined
	# as an "AudioEffectRecord" resource.
	effect = AudioServer.get_bus_effect(idx, 0)

func _on_record_pressed() -> void:
	if effect.is_recording_active():
		recording = effect.get_recording()
		
		effect.set_recording_active(false)
		
	else:

		
		effect.set_recording_active(true)

func _on_play_pressed() -> void:
	
	print(recording)
	print(recording.format)
	print(recording.mix_rate)
	print(recording.stereo)
	var data = recording.get_data()
	print(data.size())
	#$".".stream = recording
	$".".play()


func _on_save_pressed() -> void:
	var save_path = "The Recording"
	recording.save_to_wav(save_path)
