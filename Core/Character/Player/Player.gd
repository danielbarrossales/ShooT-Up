extends KinematicBody2D

export var velocity = 1000
export var clipping_distance = 25
var target

var movement_target
var direction = Vector2(0, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	target = get_node("Target")
	movement_target = position
	# remove_child(target)
	pass # Replace with function body.

func _physics_process(_delta):
	var movement_distance = position.distance_to(movement_target)
	if(movement_distance > clipping_distance):
		move()
	else: 
		position = movement_target

func move():
	move_and_slide(direction * velocity)

func set_movement_target(target_position):
	movement_target = target_position
	direction = (movement_target - position).normalized()
	
func _input(event):
	if event is InputEventScreenTouch or event is InputEventScreenDrag:
		set_movement_target(event.position)

func stop_moving():
	position = movement_target
