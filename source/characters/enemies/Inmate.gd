extends Enemy

func _ready():
	tex_dead = Global.tex_inmate1_dead

var projectiles = [
	Global.Bottle,
	Global.Brush,
	Global.Glass,
	Global.Knife,
	Global.MysteryBullet
]

func shoot():
	
	if shoot_timer.is_stopped() and reload_timer.is_stopped():
		var projectile = get_random_projectile().instance()
		play_anim("shoot")
		play_sfx("enemy_throw")
		get_parent().add_child(projectile)
		projectile.initialize(global_position, Global.Player.global_position)
		projectile.fire()
		shoot_timer.start()
		if clip_size == 0:
			reload_timer.start()
		else:
			clip_size -= 1

func get_random_projectile():
	randomize()
	return projectiles[randi() % projectiles.size()]
	