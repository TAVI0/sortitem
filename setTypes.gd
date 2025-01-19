class_name SetTypes  extends Node2D

@export var typeItem = 0
var delete

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group(str(typeItem))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if delete:
		print("llego")
		GLOBAL.SCORE += 100
		visible=false
		delete = false
		GLOBAL.is_dragging=false
		queue_free()
