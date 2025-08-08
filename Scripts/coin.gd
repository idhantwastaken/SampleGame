extends Area2D

@onready var manager: Node = %Manager
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("score"): body.score()
	animation_player.play("pickup")
