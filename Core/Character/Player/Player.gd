extends KinematicBody2D

export var velocity = 1000
export var clipping_distance = 25
export var bullet_down_time = 0.2
var bullet_scene

var movement_target
var direction = Vector2(0, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	movement_target = position
	bullet_scene = load("res://Core/Combat/Bullet/Bullet.tscn")
	get_node("BulletTimer").start()
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


func _on_BulletTimer_timeout():
	fire_bullet() # Replace with function body.

func fire_bullet():
	var new_bullet = bullet_scene.instance()
	new_bullet.position = position
	get_parent().add_child(new_bullet)
