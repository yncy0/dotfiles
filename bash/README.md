

 ____            _     
| __ )  __ _ ___| |__  
|  _ \ / _` / __| '_ \ 
| |_) | (_| \__ \ | | |
|____/ \__,_|___/_| |_|


# Bash

The default bash, contains ```$ENV``` variables.

> I just can't remove it, it might be crucial to my ```setup.sh```

## Configuration

```
└── .bashrc
```

- ```.bashrc``` is where the main configuration was.


## Switching Shell

If you want to use ```bash``` simply run either of these commands:

```
chsh -s usr/bin/bash
```

or

```
chsh -s bin/bash
```

Verifiy the shell you use by running:
```
echo $SHELL
```

## Symbolic Link

To link these files into you ```~/.bashrc``` file, simply:

```
rm .bashrc & stow bash
```
