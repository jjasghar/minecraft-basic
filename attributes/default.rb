# The release you want to install of minecraft
default['minecraft_basic']['version'] = '1.9'

# The max memory for Java
default['minecraft_basic']['max_memory'] = '1024'

# The max memory for Java
default['minecraft_basic']['min_memory'] = '512'

#
# The following section is for the ops.json, put the username in with commas between
#
default['minecraft_basic']['ops'] = ''

#
# The following section is for the server.properties you should look at: http://minecraft.gamepedia.com/Server.properties
#

# Determines the radius of the spawn protection. Setting this to 0 will not disable spawn protection. 0 will protect the single block at the spawn point. 1 will protect a 3x3 area centered on the spawn point. 2 will protect 5x5, 3 will protect 7x7, etc.
default['minecraft_basic']['spawn_protection'] = '16'

# The maximum number of milliseconds a single tick may take before the server watchdog stops the server with the message
default['minecraft_basic']['max_tick_time'] = '60000'

# The settings used to customize world generation.
default['minecraft_basic']['generator_settings'] = ''

# Allows players to travel to the Nether.
default['minecraft_basic']['allow_nether'] = true

# Force players to join in the default game mode.
default['minecraft_basic']['force_gamemode'] = false

# Defines the mode of gameplay.
# 0 - Survival
# 1 - Creative
# 2 - Adventure
# 3 - Spectator
default['minecraft_basic']['gamemode'] = '0'

# Enables GameSpy4 protocol server listener.
default['minecraft_basic']['enable_query'] = false

# If non-zero, players are kicked from the server if they are idle for more than that many minutes.
default['minecraft_basic']['player_idle_timeout'] = '0'

# Defines the difficulty (such as damage dealt by mobs and the way hunger and poison affects players) of the server.
# 0 - Peaceful 1 - Easy 2 - Normal 3 - Hard
default['minecraft_basic']['difficulty'] = '1'

# Determines if monsters will be spawned.
default['minecraft_basic']['spawn_monsters'] = true

# Sets permission level for ops.
# 1 - Ops can bypass spawn protection.
# 2 - Ops can use /clear, /difficulty, /effect, /gamemode, /gamerule, /give, and /tp, and can edit command blocks.
# 3 - Ops can use /ban, /deop, /kick, and /op.
# 4 - Ops can use /stop.
default['minecraft_basic']['op_permission_level'] = '4'

# Optional SHA-1 digest of the resource pack, in lowercase hexadecimal. It's recommended to specify this. This is not yet used to verify the integrity of the resource pack, but improves the effectiveness and reliability of caching.
default['minecraft_basic']['resource_pack_hash'] = ''

# Allows server to announce when a player gets an achievement.
default['minecraft_basic']['announce_player_achievements'] = true

# Enable PvP on the server. Players shooting themselves with arrows will only receive damage if PvP is enabled.
default['minecraft_basic']['pvp'] = true

# Sets whether the server sends snoop data regularly to http://snoop.minecraft.net.
default['minecraft_basic']['snooper_enabled'] = true

# Determines the type of map that is generated.
# DEFAULT - Standard world with hills, valleys, water, etc.
# FLAT - A flat world with no features, meant for building.
# LARGEBIOMES - Same as default but all biomes are larger.
# AMPLIFIED - Same as default but world-generation height limit is increased.
# CUSTOMIZED - Same as default unless generator-settings is set to a preset.
default['minecraft_basic']['level_type'] = 'DEFAULT'

# If set to true, players will be permanently banned if they die.
default['minecraft_basic']['hardcore'] = false

# Enables command blocks
default['minecraft_basic']['enable_command_block'] = false

# The maximum number of players that can play on the server at the same time.
default['minecraft_basic']['max_players'] = '20'

# By default it allows packets that are n-1 bytes big to go normally, but a packet that n bytes or more will be compressed down. So, lower number means more compression but compressing small amounts of bytes might actually end up with a larger result than what went in.
default['minecraft_basic']['network_compression_threshold'] = '256'

# This sets the maximum possible size in blocks, expressed as a radius, that the world border can obtain.
default['minecraft_basic']['max_world_size'] = '29999984'

# Changes the port the server is hosting (listening) on
default['minecraft_basic']['server_port'] = '25565'

# Set this if you want the server to bind to a particular IP. It is strongly recommended that you leave server-ip blank!
default['minecraft_basic']['server_ip'] = ''

# Determines if villagers will be spawned.
default['minecraft_basic']['spawn_npcs'] = true

# Allows users to use flight on your server while in Survival mode, if they have a mod that provides flight installed.
default['minecraft_basic']['allow_flight'] = false

# The "level-name" value will be used as the world name and its folder name. You may also copy your saved game folder here, and change the name to the same as that folder's to load it instead.
default['minecraft_basic']['level_name'] = 'world'

# Sets the amount of world data the server sends the client, measured in chunks in each direction of the player (radius, not diameter).
default['minecraft_basic']['view_distance'] = '10'

# Optional URI to a resource pack. The player may choose to use it.
default['minecraft_basic']['resource_pack'] = ''

# Determines if animals will be able to spawn.
default['minecraft_basic']['spawn_animals'] = true

# Enables a whitelist on the server.
default['minecraft_basic']['white_list'] = false

# Defines whether structures (such as villages) will be generated.
default['minecraft_basic']['generate_structures'] = true

# Server checks connecting players against minecraft's account database. Only set this to false if your server is not connected to the Internet. Hackers with fake accounts can connect if this is set to false! If minecraft.net is down or inaccessible, no players will be able to connect if this is set to true. Setting this variable to off purposely is called "cracking" a server, and servers that are presently with online mode off are called "cracked" servers, allowing players with unlicensed copies of Minecraft to join.
default['minecraft_basic']['online_mode'] = true

# The maximum height in which building is allowed. Terrain may still naturally generate above a low height limit.
default['minecraft_basic']['max_build_height'] = '256'

# Add a seed for your world, as in Singleplayer.
default['minecraft_basic']['level_seed'] = ''

# Linux server performance improvements: optimized packet sending/receiving on Linux
default['minecraft_basic']['use_native_transport'] = true

# This is the message that is displayed in the server list of the client, below the name.
default['minecraft_basic']['motd'] = 'A Chef built Minecraft Server'

# Enables remote access to the server console.
default['minecraft_basic']['enable_rcon'] = false

#
# end of the server.properties configuration
#
