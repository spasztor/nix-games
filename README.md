# Readme   

#### Introduction
The purpose of this readme is to provide documentation for services, locations and whatever else that is useful for the server nix-minecraft.

No information regarding connecting to the vminstance will be found in this readme. Contact us for that kind of information.

---
#### Packages being used:
- minecraft_server.1.8.9.jar
- mumble-server
- openjdk-8-jre
- rdiff-backup
- screen
- systemd

---
#### Users
Format: `[login]:[password]`
- bukkit:bukkit

---
#### Services
The general workflow is to run any interface players will interact with as a service through a user dedicated to that service. Thus all services can be accessed with `services [command] [option]`.

###### The current services that are on the server are as follows:
- [mumble-server](#mumble-server)
- [minecraft](#minecraft)

Below you can find the services and their individual guides.  

##### mumble-server
- For installation [this guide](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-mumble-server-murmur-on-ubuntu-14-04) was followed.
- To start or stop mumble use services command: `services mumble-server [command]`.
- Configuration file located at: `/etc/mumble-server.ini`.
- To edit server channels, permisions, etc. login as: superuser; H4mmerTIM3
- Password to server for public access is Mazsi
- At the present no logging capabilities exist. This could be done by starting mumble-server though a screen window (like [tmux](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=0ahUKEwjC9KLPhNrJAhUS22MKHQkXCJAQFggdMAA&url=https%3A%2F%2Ftmux.github.io%2F&usg=AFQjCNHueh3Gwyi6FitKz3hvm6YkYWMyGQ&sig2=mudV022G17xDeDYPiIeNTQ)) that would allow one to load mumble-server onto the screen. Their may also be logging capabilities within tmux which records the console to a log every so often.
- May potentially integrate a [php](http://sourceforge.net/projects/phpmumbleadmin/) admin module and switch to [ice](http://wiki.mumble.info/wiki/Ice) as the method to manage the mumble-server instead of the default.

#### minecraft
- For Installation we are going to do something like [this](https://wiki.archlinux.org/index.php/Minecraft) just for ubntu instead of arch-linux. We are currently working on the scripts in `nix-games/scripts/systemd/`.
- We will be using [spigot](https://www.spigotmc.org/) over [bukkit](https://bukkit.org/) because bukkit is [worthless](https://www.reddit.com/r/OutOfTheLoop/comments/2fxhz1/what_happened_with_mojang_and_bukkit/) at this point.