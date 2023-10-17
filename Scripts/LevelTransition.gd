extends CanvasLayer


func level_transition(target: PackedScene):
	$AnimationPlayer.play("FadeToBlack")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_packed(target)
	$AnimationPlayer.play_backwards("FadeToBlack")
