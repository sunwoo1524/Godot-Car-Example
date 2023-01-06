extends VehicleBody

var max_rpm = 500
var max_torque = 200

func _ready():
	pass

func _physics_process(delta):
	steering = lerp(steering, Input.get_axis("ui_right", "ui_left") * 0.6, 5 * delta)
	
	var acceleration = Input.get_axis("ui_down", "ui_up")
	var rpm = abs($WheelLB.get_rpm())
	$WheelLB.engine_force = acceleration * max_torque * (1 - rpm / max_rpm)
	
	rpm = abs($WheelRB.get_rpm())
	$WheelRB.engine_force = acceleration * max_torque * (1 - rpm / max_rpm)
