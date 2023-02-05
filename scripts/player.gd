extends KinematicBody2D

export var speed := 700.0
var velocity: Vector2 = Vector2()
var last_rotation := 0.0

var sprite

func read_input():
	velocity = Vector2()
	var direction := Vector2()
	var update_rotation := false
	
	if Input.is_action_pressed("up"):
		velocity.y -= 1
		direction += Vector2(0, -1)
		update_rotation = true
	
	if Input.is_action_pressed("down"):
		velocity.y += 1
		direction += Vector2(0, 1)
		update_rotation = true
		
	if Input.is_action_pressed("left"):
		velocity.x -= 1
		direction += Vector2(-1, 0)
		update_rotation = true
		
	if Input.is_action_pressed("right"):
		velocity.x += 1
		direction += Vector2(1, 0)
		update_rotation = true
		
	
	velocity = velocity.normalized()
	velocity = move_and_slide(velocity*speed)
	
	var r :=  atan2(direction.y, direction.x)
	if update_rotation:
		last_rotation = r
	
	sprite.rotation = last_rotation
	

func _physics_process(_delta):
	read_input()

func _ready():
	sprite = get_node("Sprite")


