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

2. Build a a couple docker images

```
	cd snis-testbed
	newgrp docker # make "docker" your real group id
	./buildimages $HOME/testdir/space-nerds-in-space dockerfiles/snis-server-multiverse-ssgl.dockerfile
	./buildimages $HOME/testdir/space-nerds-in-space dockerfiles/snis-server-mv-ssgl-with-assets
```

4. Choose a configuration and run it.

```
	$ ls -1 configs
	docker-shell-library
	multi-container-multi-network-snis
	multi-container-snis-server-ssgl-and-mv
	single-bare-snis-server
	single-host-ssgl-mv-and-servers
	$ configs/multi-container-snis-server-ssgl-and-mv setup

	This configuration creates a BRIDGED network 172.25.25.0/24,
	and starts 5 containers on that network:
	1 for ssgl_server
	1 for snis_multiverse (non-autowrangling-mode)
	3 for snis_server instances

	Setting up multi-container-snis-servers-and-ssgl
	Setting up bridge network 172.25.25.0/24 snis-net
	3b8becd9253a48dcbb1479b9208a4d50d29c8c0f10f84a82afd71fb4ccc65208
	Setting up ssgl-container
	cfdef89fe0e1ac4bca68a4653572abdbb7b15daf1d54b53f18457077bc4c521d
	Setting up snis-multiverse-container
	7e6fac89a3cdbaeb91bdeb0dfc6a0f18f4fbb0263a36445f6937c19ae8ed2465
	Setting up snis-server-default-container
	62d0ff15455e09eeefd37fdef19d91fd8c7d38290408944e503a953c0e8e8756
	Setting up snis-server-polaris-container
	50377a8898aac27eb8557e88490eb6ea24df2fbaecb66cddc6f906af4d05f6a9
	Setting up snis-server-karado-container
	505253c9e33ce1fe3db708e7c878028f37cd63639a415f7dc0ee38d54371bbc9


	Connect your local snis_client to lobby at 172.25.25.100

	$ lsssgl -h 172.25.25.100
	Filtering games of type '*' on host '172.25.25.100'
				    IP addr/port       Game Type         Instance/Map Server Nickname             Location   Protocol
	-----------------------------------------------------------------------------------------------------------------------------
	       172.25.25.101/172.25.25.101/57467     SNIS-MVERSE                    -               -                    -    SNIS062
		 172.25.25.10/172.25.25.10/45000            SNIS          0.0 0.0 0.0               -              DEFAULT    SNIS062
		 172.25.25.20/172.25.25.20/45000            SNIS        6.0 -4.5 -4.1               -              POLARIS    SNIS062
		 172.25.25.30/172.25.25.30/45000            SNIS        7.2 10.0 -3.3               -               KARADO    SNIS062
```

5. When done, tear down the configuration

```
	$ configs/multi-container-snis-server-ssgl-and-mv teardown

	This configuration creates a BRIDGED network 172.25.25.0/24,
	and starts 5 containers on that network:
	1 for ssgl_server
	1 for snis_multiverse (non-autowrangling-mode)
	3 for snis_server instances

	Tearing down multi-container-snis-servers-and-ssgl
	Stopping container snis-server-karado-container
	snis-server-karado-container
	Removing container snis-server-karado-container
	snis-server-karado-container
	Stopping container snis-server-polaris-container
	snis-server-polaris-container
	Removing container snis-server-polaris-container
	snis-server-polaris-container
	Stopping container snis-server-default-container
	snis-server-default-container
	Removing container snis-server-default-container
	snis-server-default-container
	Stopping container snis-multiverse-container
	snis-multiverse-container
	Removing container snis-multiverse-container
	snis-multiverse-container
	Stopping container ssgl-container
	ssgl-container
	Removing container ssgl-container
	ssgl-container
	Tearing down snis-net
	snis-net
```

More to come ...
