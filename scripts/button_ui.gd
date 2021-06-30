extends Control

const MARGIN = 16

# The card's ceter position
var card_center = Vector2()
# -------------------------

func _ready():
	# Assign to card's initial position
	 card_center = $GodotCard.rect_position
	# ---------------------------------
	
# Slide card based on given direction
func slide(direction):
	if direction == "left":
		$Tween.interpolate_property($GodotCard, "rect_position", card_center, Vector2((0 - $GodotCard.rect_size.x) - MARGIN, card_center.y), 1,Tween.EASE_IN_OUT)
	else:
		$Tween.interpolate_property($GodotCard, "rect_position", card_center, Vector2(card_center.x, (0 - $GodotCard.rect_size.x) - MARGIN), 1,Tween.EASE_IN_OUT)
	
	$Tween.start()
# -----------------------------------

# Signals emited by directional buttons
func _on_Menu_slideLeft():
	slide("left")

func _on_Menu_slideUp():
	slide("up")
# -------------------------------------
	
func _on_Tween_tween_completed(_object, _key):
	$Respawn.start()

func _on_Respawn_timeout():
	$AnimationPlayer.play("Respawn")

func _on_AnimationPlayer_animation_finished(_anim_name):
	$Menu.card_sliding = false
