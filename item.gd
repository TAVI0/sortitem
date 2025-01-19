class_name Item extends Node2D

var draggable = false
var is_inside_dropable = false
var body_ref
var offset:  Vector2
var initialPos: Vector2
var id
var type: int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var setTypes = get_parent() as SetTypes
	if setTypes:
		type =  setTypes.typeItem
	id = 'itemId'+str(GLOBAL.item_id)
	add_to_group(id)
	GLOBAL.item_id+=1
	
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Label.set_text(str(get_groups()))
	if  draggable:
		if Input.is_action_just_pressed("click"):
			initialPos = global_position
			offset = get_global_mouse_position() - global_position
			GLOBAL.is_dragging = true
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position() - offset
		elif Input.is_action_just_released("click"):
			GLOBAL.is_dragging = false
			var tween = get_tree().create_tween()
			if is_inside_dropable:
				tween.tween_property(self,"position", body_ref.position,0.2).set_ease(Tween.EASE_OUT)
			else:
				tween.tween_property(self,"global_position", initialPos,0.2).set_ease(Tween.EASE_OUT)



func _on_area_2d_body_entered(body: Plataform) -> void:
	if body.is_in_group('dropable') and !body.is_in_group('blocked'):
		body.add_to_group('blocked')
		body.add_to_group(id)
		var setPlatform = body.get_parent() as SetPlatform
		if setPlatform:
			setPlatform.addToTypeList(type)
		is_inside_dropable = true
		body.modulate = Color(Color.BROWN, 1)
		body_ref = body
		

func _on_area_2d_body_exited(body: Plataform) -> void:
	if body.is_in_group(id) and body.is_in_group('dropable'):
		body.remove_from_group(id)
		body.remove_from_group('blocked')
		var setPlatform = body.get_parent() as SetPlatform
		if setPlatform:
			setPlatform.removeToTypeList(type)
		is_inside_dropable = false
		body.modulate = Color(Color.CRIMSON, 0.7)

func _on_area_2d_mouse_entered() -> void:
	if not GLOBAL.is_dragging:
		draggable = true
		scale = Vector2(1.05, 1.05)

func _on_area_2d_mouse_exited() -> void:
	if not GLOBAL.is_dragging:
		draggable = false
		scale = Vector2(1, 1)
