extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()
var DialogNode = load("res://Scenes/DialogBox.tscn")

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed
	
	if Input.is_action_just_pressed("interact"):
		var d = DialogNode.instance()
		d.rect_position = Vector2(152,332)
		get_parent().add_child(d)
		get_tree().paused = true

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
