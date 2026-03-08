extends Node3D

@export var MouthOpen = Material
@export var MouthShut = Material

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("Idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func Talk():
	$Armature/Skeleton3D/Cube.set_surface_override_material(2,MouthOpen)
func DontTalk():
	$Armature/Skeleton3D/Cube.set_surface_override_material(2,MouthShut)
