extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -330.0
var died = false
@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var death: Label = $Death
@onready var jump: AudioStreamPlayer2D = $Jump
@onready var scorelabel: Label = $Score
var coin = 0
@onready var walking: AudioStreamPlayer2D = $walking
@onready var timer: Timer = $Timer

func score():
	coin += 1
	scorelabel.text = "Coins: " + str(coin)
	
func remcoin(a):
	coin -= a
	scorelabel.text = "Coins: " + str(coin)

func die():
	died = true
	anim_sprite.play("death")
	death.text = "You Died!"

func _physics_process(delta: float) -> void:
	if !died:
		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta

		# Handle jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
			jump.play()

		# Get the input direction
		var direction := Input.get_axis("move_l", "move_r")

		if direction > 0:
			anim_sprite.flip_h = false
		elif direction < 0: anim_sprite.flip_h = true
		
		#Animate
		if is_on_floor():
			if direction == 0: anim_sprite.play("Idle")
			else:
				anim_sprite.play("run")
		else: anim_sprite.play("jump")
		
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		move_and_slide()
