class_name SetPlatform extends Node2D

var typeList = []
var complete = false
var LONGSET = 3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func completeSet():
	clear_scene()
	typeList.clear()
	complete = true

func addToTypeList(type):
	typeList.append(type)
	checkSet()

func removeToTypeList(typeItem):
	if typeItem in typeList:
		typeList.erase(typeItem)
		
func clear_scene():
	var listItems = get_tree().get_nodes_in_group(str(typeList[0]))
	print(str(listItems))
	for item in listItems:
		item.queue_free()

func checkSet():
	if typeList.size() == LONGSET and typeList.count(typeList[0]) == typeList.size():
		completeSet()

func _process(delta: float) -> void:
	$Label.set_text(str(typeList))
	
