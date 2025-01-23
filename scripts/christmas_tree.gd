extends DropZone

@onready var content = $Content

func add_decoration(decoration:Draggable):
	decoration.reparent(content)
	pass
