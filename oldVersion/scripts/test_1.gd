extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$numScore.set_text(str(GLOBAL.SCORE))
	$is_dragging.set_text(str(GLOBAL.is_dragging))
