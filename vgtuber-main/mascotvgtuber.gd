extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func Talk():
	$metarig_001/Skeleton3D/Head2.set_blend_shape_value(0, 1)


func DontTalk():
	$metarig_001/Skeleton3D/Head2.set_blend_shape_value(0, 0)
