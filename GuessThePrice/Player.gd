extends CharacterBody3D

## Below is the codes to make the player move: 
## forward, back, left, right, fly higer, and fall down lower untill landing on the ground

# How fast the player moves in meters per second.
@export var speed = 1.5
# The downward acceleration when in the air, in meters per second squared.
@export var fall_acceleration = 75

# const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var target_velocity = Vector3.ZERO

func _physics_process(delta):
	# We create a local variable to store the input direction.
	var direction = Vector3.ZERO
	var rotation_speed = 100.0
	var rotation_dir = 0
	
	
	# We check for each move input and update the direction accordingly.
	if Input.is_action_pressed("move_right"):
		direction += transform.basis.x.normalized()
	if Input.is_action_pressed("move_left"):
		direction -= transform.basis.x.normalized()
		
	if Input.is_action_pressed("move_back"):
		# Notice how we are working with the vector's x and z axes.
		# In 3D, the XZ plane is the ground plane.
		direction += transform.basis.z.normalized()
	if Input.is_action_pressed("move_forward"):
		direction -= transform.basis.z.normalized()
		#direction.z -= 1# Add the gravity.
		# The letters "H" and "L" on the keyboard mean 
		# "flying up higher" and "landing lower until the ground is reached", respectively.
	if Input.is_action_pressed("move_high"):
		direction.y += 1
	if Input.is_action_pressed("move_low"):
		direction.y -= 1
		
	# If the player presses the forward key and the left key at the same time, this vector length will be approximately 1.4. 
	# But if they only press one key, its length will be 1. 
	# We want this vector to stay consistent in length, rather than moving faster on the diagonal. 
	# To do this, we need to call its normalize() method. We only normalize vectors if the length of the direction is greater than zero
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$Pivot.look_at(position + direction, Vector3.UP)
		
	# 执行旋转
	if rotation_dir != 0:
		rotate_y(rotation_dir * rotation_speed * delta)
		
	# 执行移动
	if direction != Vector3.ZERO:
		direction = direction.normalized() * speed
	

	# Ground Velocity
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed
	target_velocity.y = direction.y * speed

	# Vertical Velocity
	if not is_on_floor(): 
		# If in the air, fall towards the floor. Literally gravity
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)

	# Moving the Character
	velocity = target_velocity
	move_and_slide()



	
	
	# Detect the collision between the palyer and the electricity market building to start the game
	# Iterate through all collisions that occurred this frame
	
	# detect the collision	
	for i in range(get_slide_collision_count()):
		# We get one of the collisions with the player
		var collision = get_slide_collision(i)	
		
		# If the collision is with ground
		if collision.get_collider() == null:
			continue

		# If the collider is with the market building
		if collision.get_collider().is_in_group("market"):
			#var price_input_interface = get_node("/root/Main/PriceInputInterface")
			#var UI = get_node("/root/Main/UI")
			# Price panel is initislly unvisable, set manually in the "scene" 
			# price_input_interface.visible = false	
			# if Input.is_action_pressed("select") and is_in_building:
			# price_input_interface.visible = true
			#UI.visible = true
			var ui_panel = get_node("/root/Main/UI")  
			ui_panel.visible = true  # display UI
			
			




			
			
