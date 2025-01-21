class_name Plataform extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	modulate = Color(Color.AZURE, 0.7)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$ColorRect.visible = !self.is_in_group('blocked')
	$idItem.set_text(str(get_groups()))
