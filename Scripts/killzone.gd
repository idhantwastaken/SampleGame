extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body):
	Engine.time_scale = 0.5
	if body.has_method("die"):
		body.die()
	timer.start()

func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
