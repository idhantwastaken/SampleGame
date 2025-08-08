extends Node2D

const speed = 60
var direction = 1

@onready var cast_right: RayCast2D = $CastRight
@onready var cast_left: RayCast2D = $CastLeft
@onready var sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if cast_right.is_colliding() :
		direction = -1
		sprite_2d.flip_h = true
	if cast_left.is_colliding():
		direction = 1
		sprite_2d.flip_h = false
	
	position.x += (direction * speed * delta)
