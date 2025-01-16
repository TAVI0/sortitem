extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_children():
		print(child.name)
		print(child.get_groups())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
