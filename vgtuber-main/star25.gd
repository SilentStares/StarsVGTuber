extends Node3D

@export var eyesopen = Material
@export var EyesShut = Material

@export var MouthOpen = Material
@export var MouthShut = Material
@export var PonchoOn = Material
@export var PonchoOff = Material
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer2.play("Armature|Sway")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("1"):
		blink()
	if Input.is_action_just_pressed("2"):
		EyesOpen()
		
	
	if Input.is_action_just_pressed("ChangeClothing1"):
	
		if IsPonchoOn == true:
			FuncPonchoOff()
		elif IsPonchoOn == false:
			FuncPonchoOn()
	pass
var EyesOpenvar = true
var IsPonchoOn = true

func FuncPonchoOn():
	IsPonchoOn = true
	
	$"Armature/Skeleton3D/cool wings".set_surface_override_material(0,PonchoOn)
	
func FuncPonchoOff():
	IsPonchoOn = false
	
	$"Armature/Skeleton3D/cool wings".set_surface_override_material(0,PonchoOff)
	

	
func EyesOpen():
	EyesOpenvar = true
	
	$"Armature/Skeleton3D/cool wings".set_surface_override_material(1,eyesopen)
func blink():
	EyesOpenvar = false
	$"Armature/Skeleton3D/cool wings".set_surface_override_material(1,EyesShut)
func Talk():
	$"Armature/Skeleton3D/cool wings".set_surface_override_material(2,MouthOpen)
func DontTalk():
	$"Armature/Skeleton3D/cool wings".set_surface_override_material(2,MouthShut)

func _on_timer_timeout() -> void:
	if EyesOpenvar == true:
		$Timer.wait_time = 3
		blink()
	else:
		$Timer.wait_time = .2
		EyesOpen()
	
