extends Camera3D

# 定义旋转速度
var rotation_speed = 1.0

# 用于存储旋转量
# var rotation_degrees = Vector3()

func _ready():
	# 初始化摄像机旋转
	rotation_degrees = rotation

func _process(delta):
	# 获取玩家的键盘输入
	if Input.is_action_pressed("move_left"):
		rotation_degrees.y += rotation_speed * delta
	if Input.is_action_pressed("move_right"):
		rotation_degrees.y -= rotation_speed * delta
	#if Input.is_action_pressed("move_forward"):
	#	rotation_degrees.z += rotation_speed * delta
	#if Input.is_action_pressed("move_back"):
	#	rotation_degrees.z -= rotation_speed * delta

	# 限制上下旋转角度，防止翻转
	rotation_degrees.x = clamp(rotation_degrees.x, -90, 90)

	# 应用旋转
	rotation_degrees = rotation_degrees
	# 设置摄像机的全局旋转
	global_rotation_degrees = rotation_degrees
