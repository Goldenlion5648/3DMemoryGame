extends Node3D


const red_material = preload("res://materials/red_material.tres")
const blue_material = preload("res://materials/blue_material.tres")
const single_cube = preload("res://objects/single_cube.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	create_collection()
	pass # Replace with function body.

func create_collection(child_count = 3):
#TODO: spawn more children
	var cube_positions:  = []
	for x in range(2):
		for z in range(2):
			cube_positions.append(Vector3i(x, 0, z))
		
	for i in range(child_count):
		var new_cube = single_cube.instantiate()
		new_cube.position = cube_positions[i]
		self.add_child(new_cube)
	
	for child in self.get_children():
		child.material = red_material
		
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.rotate_y(.015)
	pass
