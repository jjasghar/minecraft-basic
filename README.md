# minecraft-basic

This is a cookbook that installs the vanilla Minecraft server.

If you would like to use it you can run something like this:
`chef exec knife digital_ocean droplet create --server-name minecraft --image ubuntu-14-04-x64 --location sfo1 --size 4gb --ssh-keys <YOURSSHKEY> --bootstrap --run-list "recipe[minecraft-basic]"`
