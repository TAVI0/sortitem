extends Node2D

@onready var drawers = $Drawers

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in drawers.get_children():
		if child is Drawer:
			child.connect("successfully_dropped", _on_successfully_dropped)
	pass

func _on_successfully_dropped(decoration: Draggable, area: Area2D):
	if area is DropZone:
		area.add_decoration(decoration)
		
		
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
