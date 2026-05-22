extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

var blink = false
func _on_blink_timer_timeout() -> void:
	blink = !blink
	if blink == false:
		$metarig_001/Skeleton3D/Head2.set_blend_shape_value(1,0)
	
		
	if blink == true:
		$metarig_001/Skeleton3D/Head2.set_blend_shape_value(1,1)
	
	
	print(blink)
