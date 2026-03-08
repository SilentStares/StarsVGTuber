extends Node
@export var Sensitivity = 59.2
const VU_COUNT = 30
const FREQ_MAX = 11050.0
const MIN_DB = 60
var Muted = false
var spectrum: AudioEffectSpectrumAnalyzerInstance



# _ready() is a function that's Called (aka activated( when the node enters the scene tree for the first time. aka when it spawns in or when the program is opened if it's already in the main scene/world
func _ready() -> void:
	$Control/AudioStreamRecord/Control/HBoxContainer/SpinBox.value = Sensitivity
	# the thing above makes the sensitivty setting adjustable with just a little spinbox in game!
	spectrum = AudioServer.get_bus_effect_instance(0, 0)
	#the thing above this is what finds the audio server you're using and which effect it's selecting from what I understand and saves it under the spectrum variable at the top there
#it's important for the lipsync


var windowmode = false
func _unhandled_input(event: InputEvent) -> void:
	# this script here handles making things bordered or not, this is so the transparency works at it's best!
		if Input.is_action_just_pressed("BorderedMode"):
			
			borderoff()
			
			
			
#borderoff here is the function that's called in that section right bove this under unhandled input (which is basically like, any hotkey or other input like mouse movement is controlled by that function)
func borderoff():

 
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS,windowmode)
	windowmode = !windowmode






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
	#if you're not sure what these hotkeys are or want to change them, go to project at the upper left
	#then click on project settings and go to input!
	#there you can change any settings you want!

	
	if $Control/AudioStreamRecord.playing:
		var maybeVolume: = spectrum.get_magnitude_for_frequency_range(0, 9999999).length()
		var energy = clamp(MIN_DB + linear_to_db(maybeVolume) / MIN_DB, 0.0, 100.0)
		print(energy)
		
		#the energy variable here just means how loud you are! If it's higher than 59.2, they talk!
		#if your mic isin't the same level of sensitivity mine is, you can just adjust it!
		#the area below is where you'll put your vtuber controls, the top section is for talking the bottom is for not talking!
		if energy >= Sensitivity:
			
			if Dimension == 1:
				pass
				#Insert your mouth open/talking sscript here, delete pass 
			if Dimension == 2:
				pass
				#Insert your mouth open/talking sscript here, delete pass 
			if Dimension == 3:
				pass
				#Insert your mouth open/talking sscript here, delete pass 
			if Dimension == 4:
				pass
				#Insert your mouth open/talking sscript here, delete pass 
				
			if Dimension == 5:
				pass
				#Insert your mouth open/talking sscript here, delete pass 
		#else here means "if energy ISN'T greater than or equaal to 59.2 up there!
		else:
			if Dimension == 1:
				pass
				#Insert your mouth shut/not talking sscript here, delete pass 
			if Dimension == 2:
				pass
				#Insert your mouth shut/not talking sscript here, delete pass 
			if Dimension == 3:
				pass
				#Insert your mouth shut/not talking sscript here, delete pass 
				
			if Dimension == 4:
				pass
				#Insert your mouth shut/not talking sscript here, delete pass 
			if Dimension == 5:
				pass
				#Insert your mouth shut/not talking sscript here, delete pass 

var Dimension = 3
func _on_d_pressed() -> void:
	Dimension = 1
func _on_3d_pressed() -> void:
	Dimension = 2
	
func _on_button25d_pressed() -> void:
	Dimension = 3
	
func _on_button_2_pressed() -> void:
	Dimension = 4
	

func _on_mr_h_pressed() -> void:
	Dimension = 5
	



func _on_button_3_pressed() -> void:
	
	Muted = !Muted
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), Muted)


func _on_spin_box_value_changed(value: float) -> void:
	Sensitivity = value
