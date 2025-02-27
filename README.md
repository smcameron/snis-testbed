# snis-testbed
Test bed for smcameron/space-nerds-in-space using docker to test various network configurations

Thu 27 Feb 2025 12:10:34 PM EST

Fair warning: I'm a rank amateur at docker and barely know what I'm doing, so take what's
here with a grain of salt.

# How to use this

1. clone this repo and space-nerds-in-space

```
	cd $HOME
	mkdir testdir
	cd testdir
	git clone git@github.com:smcameron/snis-testbed.git
	git clone git@github.com:smcameron/space-nerds-in-space
```

2. Build a docker container

```
	cd snis-testbed
	newgrp docker # make "docker" your real group id
	./buildcontainer $HOME/testdir/space-nerds-in-space
```

4. Start the container

```
	docker run -it space-nerds-in-space:latest bash
```

5. (inside the container) start snis_launcher

```
	bin/snis_launcher
```

6. Choose option 1 to update assets
7. Choose option 2 to start ssgl_server
8. Choose option 3 to start snis_multiverse
9. Choose option 4 to start snis_server

10. Switch to another window on the host machine (outside the container)

11. run "lsssgl -h ip-address-of-container", e.g.: "lsssgl -h 172.17.0.2"

You should see SNIS-MVERS and SNIS entries.

11. Run snis_client however you usually do and connect to the containerized
lobby process using the container's IP address on the network setup screen.

12. Stop snis client

13. exit the container

14. stop the container:

```
	docker ps -a # find the name of the container
	docker stop *name-of-container*
	docker rm *name-of-container* # optional
```

More to come ...
