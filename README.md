# up.sh

## NAME

`up` - Traverses up the present working directory.

## SYNOPSIS

`up dir...`

`up num...`

## DESCRIPTION

Stop typing `../../..` endlessly. Use tab completion instead! Using `up` allows you to change your current directory to a parent of the current directory where the parent is specified by `dir` or `num`.

## OPTIONS

`dir` The name of a parent directory.

`num` The index of a parent directory (indexed in reverse order).

## EXAMPLES

Assume present working directory: "/home/chuck/foo/bar/head/foot/alpha/bravo/charlie".

`up`  Without any options, up is an alias of `cd ..`. Changes the directory to "/home/chuck/foo/bar/head/foot/alpha/bravo".

`up bar` Changes the directory to "/home/chuck/foo/bar".

`up 3` Changes the directory to "/home/chuck/foo/bar/head/foot".

`up <TAB>` Shows a list of the parent directories which can be tab-completed.

`up a<TAB>` Completes to "up alpha/".

`up 4<TAB>` Completes to "up head/".

`up ch<TAB><TAB>` Shows a list of possible completions: "charlie/ chuck/".

`up -` Returns to the previous working directory. Alias of `cd -`.

## INSTALLATION

The script registers completion functions into your shell environment so it should be sourced to use.

### Bash

```
    curl --create-dirs -o ~/.config/up/up.sh https://raw.githubusercontent.com/shannonmoeller/up/master/up.sh
    echo 'source ~/.config/up/up.sh' >> ~/.bashrc
```

### Zsh

```
    curl --create-dirs -o ~/.config/up/up.sh https://raw.githubusercontent.com/shannonmoeller/up/master/up.sh
    echo 'source ~/.config/up/up.sh' >> ~/.zshrc
```

## SEE ALSO

`cd`(1)

## AUTHOR

Written by Shannon Moeller <me@shannonmoeller.com>.
