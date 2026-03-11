extends Node
@export var Sensitivity = 59.2

const VU_COUNT = 30
const FREQ_MAX = 11050.0
const MIN_DB = 60

@onready var Animator = $Star/metarig/Skeleton3D/Body/AnimationPlayer

var spectrum: AudioEffectSpectrumAnalyzerInstance



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Control/AudioStreamRecord/Control/HBoxContainer/SpinBox.value = Sensitivity
	
	
	spectrum = AudioServer.get_bus_effect_instance(0, 0)



var windowmode = false
func _unhandled_input(event: InputEvent) -> void:
		if Input.is_action_just_pressed("BorderedMode"):
			
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
	
	if Input.is_action_just_pressed("4"):
			$Bg.visible = !$Bg.visible
	
	if Input.is_action_just_pressed("GuiHide"):
		$Control/AudioStreamRecord/Control.visible = !$Control/AudioStreamRecord/Control.visible
	

	
	if $Control/AudioStreamRecord.playing:
		var maybeVolume: = spectrum.get_magnitude_for_frequency_range(0, 9999999).length()
		var energy = clamp(MIN_DB + linear_to_db(maybeVolume) / MIN_DB, 0.0, 100.0)
		print(energy)
		
		#the energy variable here just means how loud you are! If it's higher than 59.2, they talk!
		#if your mic isin't the same level of sensitivity mine is, you can just adjust it!
		
		if energy >= Sensitivity:
			
			if Dimension == 3:
				
				
				Animator.play("Talk")
			if Dimension == 2.5:
				$"star 2d".Talk()
			if Dimension == 2:
				$Control/AnimatedSprite2D.play("Talking")
			if Dimension == 4:
				$"Ciero Tube".play("Mouth Open")
				
			if Dimension == 5:
				$"Mr H".Talk()
		#else here means "if energy ISN'T greater than or equaal to 59.2 up there!
		else:
			if Dimension == 3:
				Animator.play("RESET")
			if Dimension == 2.5:
				$"star 2d".DontTalk()
			if Dimension == 2:
				$Control/AnimatedSprite2D.play("Not Talking")
				
			if Dimension == 4:
				$"Ciero Tube".play("Mouth Shut")
			if Dimension == 5:
				$"Mr H".DontTalk()
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
	$"Ciero Tube".visible = false
	$"Mr H".visible = false
func _on_3d_pressed() -> void:
	Dimension = 3
	$Control/AnimatedSprite2D.visible = false
	$Star.visible = true
	$"star 2d".visible = false
	$"Ciero Tube".visible = false
	$"Mr H".visible = false
func _on_button25d_pressed() -> void:
	Dimension = 2.5
	
	$Control/AnimatedSprite2D.visible = false
	$Star.visible = false
	$"star 2d".visible = true
	$"star 2d/AnimationPlayer".play("Sway")
	$"Ciero Tube".visible = false
	$"Mr H".visible = false
func _on_button_2_pressed() -> void:
	Dimension = 4
	$Control/AnimatedSprite2D.visible = false
	$Star.visible = false
	$"star 2d".visible = false
	$"Ciero Tube".visible = true
	$"Mr H".visible = false

func _on_mr_h_pressed() -> void:
	$"Mr H/AnimationPlayer".play("Idle")
	Dimension = 5
	$Control/AnimatedSprite2D.visible = false
	$Star.visible = false
	$"star 2d".visible = false
	$"Ciero Tube".visible = false
	$"Mr H".visible = true



func _on_button_3_pressed() -> void:
	
	Muted = !Muted
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), Muted)


func _on_spin_box_value_changed(value: float) -> void:
	Sensitivity = value
