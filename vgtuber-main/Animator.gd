extends Node


const VU_COUNT = 30
const FREQ_MAX = 11050.0
const MIN_DB = 60

@onready var Animator = $Star/metarig/Skeleton3D/Body/AnimationPlayer

var spectrum: AudioEffectSpectrumAnalyzerInstance



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	
	spectrum = AudioServer.get_bus_effect_instance(0, 0)



var windowmode = false
func _unhandled_input(event: InputEvent) -> void:
		if Input.is_action_just_pressed("FullScreen"):
			
			borderoff()
func borderoff():

			
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS,windowmode)
	windowmode = !windowmode
			
			
			
var Muted = false
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Mute"):
		Muted = !Muted
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), Muted)
	if Input.is_action_just_pressed("3"):
		$CSGBox3D.visible = !$CSGBox3D.visible
		

	
	if Input.is_action_just_pressed("GuiHide"):
		$Control/AudioStreamRecord/Control.visible = !$Control/AudioStreamRecord/Control.visible
	

	
	if $Control/AudioStreamRecord.playing:
		var maybeVolume: = spectrum.get_magnitude_for_frequency_range(0, 9999999).length()
		var energy = clamp(MIN_DB + linear_to_db(maybeVolume) / MIN_DB, 0.0, 100.0)
		print(energy)
		
		
		if energy >= 59.2:
			
			if Dimension == 3:
				Animator.play("Talk")
			if Dimension == 2.5:
				$"star 2d".Talk()
			if Dimension == 2:
				$Control/AnimatedSprite2D.play("Talking")
			if Dimension == 4:
				$AnimatedSprite2D.play("Mouth Open")
		else:
			if Dimension == 3:
				Animator.play("RESET")
			if Dimension == 2.5:
				$"star 2d".DontTalk()
			if Dimension == 2:
				$Control/AnimatedSprite2D.play("Not Talking")
				
			if Dimension == 4:
				$AnimatedSprite2D.play("Mouth Shut")
		#var prev_hz = 0
		#var data = []
		#for i in range(1, VU_COUNT + 1):
			#var hz = i * FREQ_MAX / VU_COUNT
			#var f: Vector2 = spectrum.get_magnitude_for_frequency_range(prev_hz, hz)
			#var energy = clamp(MIN_DB + linear_to_db(f.length()) / MIN_DB, 0.0, 1.0)
			#data.append(energy)
			#prev_hz = hz
		

var Dimension = 3
func _on_d_pressed() -> void:
	Dimension = 2
	$Control/AnimatedSprite2D/AnimationPlayer.play("Sway")
	$Control/AnimatedSprite2D.visible = true
	$Star.visible = false
	$"star 2d".visible = false
	$AnimatedSprite2D.visible = false

func _on_3d_pressed() -> void:
	Dimension = 3
	$Control/AnimatedSprite2D.visible = false
	$Star.visible = true
	$"star 2d".visible = false
	$AnimatedSprite2D.visible = false

func _on_button25d_pressed() -> void:
	Dimension = 2.5
	$Control/AnimatedSprite2D.visible = false
	$Star.visible = false
	$"star 2d".visible = true
	$"star 2d/AnimationPlayer".play("Sway")
	$AnimatedSprite2D.visible = false

func _on_button_2_pressed() -> void:
	Dimension = 4
	$Control/AnimatedSprite2D.visible = false
	$Star.visible = false
	$"star 2d".visible = false
	$AnimatedSprite2D.visible = true




func _on_button_3_pressed() -> void:
	
	Muted = !Muted
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), Muted)
