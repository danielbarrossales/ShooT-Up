extends KinematicBody2D

export var velocity = 700
var direction = Vector2(0, -1)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move_and_slide(direction * velocity)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
