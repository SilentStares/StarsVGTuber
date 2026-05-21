extends Skeleton3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".get_bone_name(5)
	print($".".get_bone_name(5))
	$".".set_bone_pose_scale(5,Vector3(2,2,2))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
