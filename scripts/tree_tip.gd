extends DropZone

@onready var content = $Content
@onready var marker_2D = $Marker2D

func add_decoration(decoration:Draggable):
	for child in content.get_children():
		if child is Draggable:
			child.self_destruct()
	decoration.reparent(content)
	get_tree().create_tween().tween_property(
		decoration,
		"position",
		marker_2D.position,
		0.3
	).set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_CUBIC)
	pass
