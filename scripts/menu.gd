extends TextureButton

# warning-ignore:unused_signal
signal slideLeft
# warning-ignore:unused_signal
signal slideUp

var open = false
var card_sliding = false

# Give buttons pop animation
func pop(node):
	$Tween.interpolate_property(node, "rect_scale" , Vector2(1, 1), Vector2(1.1, 1.1), 0.2, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
	$Tween.interpolate_property(node, "rect_scale" , Vector2(1.1, 1.1), Vector2(1, 1), 0.2, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
	$Tween.start()
# --------------------------

func _on_Menu_pressed():
	pop(self)
	open = !open
	
	if open:
		$AnimationPlayer.play("ShowOptions")

	else:
		$AnimationPlayer.play("HideOptions")
		
func slide_card(animating_node, emitting_signal):
	if card_sliding == false:
		pop(animating_node)
		emit_signal(emitting_signal)
		card_sliding = true

func _on_SlideLeft_pressed():
	slide_card($SlideLeft, "slideLeft")

func _on_SlideUp_pressed():
	slide_card($SlideUp, "slideUp")
