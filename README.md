# minecraft-basic

This is a cookbook that installs the vanilla [Minecraft](http://minecraft.net) server.

I have written a post on how to use this cookbook and deploy it to Digital Ocean [here](http://jjasghar.github.io/blog/2015/08/23/lets-build-a-minecraft-server-with-chef/).

I took a lot of this setup from [minecraft.gamepedia.com](http://minecraft.gamepedia.com/Setting_up_a_server). There might be some things you'd like to tweak, so please take a look at the configuration options. If you would like to configure your Minecraft server, you need to either use override attributes, or edit the [attributes/default.rb](attrubutes/default.rb) and upload your cookbook to a Chef Server. A brief explanation for the different options are located in the [attributes/default.rb](attrubutes/default.rb).

## Setting Operator
Add an operator to `default['minecraft_basic']['ops']`

## Setting up daily backups

There is as script that gets dropped in the `/root/` directory called `backup_minecraft.sh`. It will copy out your world and then place a tarball in the `/root/$DATE-backup-minecraft.tar.gz`. You can copy that file off to any location you desire, then run `tar -xvzf $DATE-backup-minecraft.tar.gz` in your new `/usr/share/minecraft/world/` directory to **RESTORE** your backup. THIS IS DESTRUCTIVE PLEASE TAKE NOTE.

I took the liberty to add a daily [cronjob](https://en.wikipedia.org/wiki/Cron) at 0200am to create this backup file, and you can change it via `default['minecraft_basic']['backup_hour']` and `default['minecraft_basic']['backup_min']`.

## Contributing
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

## License and Authors
- Author:: JJ Asghar (jj@chef.io)

```text
Copyright 2015 JJ Asghar

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
