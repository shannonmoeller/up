# `up`

Stop typing `../../..` endlessly. Use tab completion instead! Using `up` allows you to change your current directory to a parent of the current directory where the parent is specified by name or index.

## Install

Written in 100% shell script, `up.sh` registers itself and some completion functions via your `.bashrc` or `.zshrc` file.

### bash

```
curl --create-dirs -o ~/.config/up/up.sh https://raw.githubusercontent.com/shannonmoeller/up/master/up.sh
echo 'source ~/.config/up/up.sh' >> ~/.bashrc
```

### zsh

```
curl --create-dirs -o ~/.config/up/up.sh https://raw.githubusercontent.com/shannonmoeller/up/master/up.sh
echo 'source ~/.config/up/up.sh' >> ~/.zshrc
```

## Usage

```
$ up [dir|num|-]

    dir   full or partial name of any parent directory
    num   number of times you'd have to type `../`
    -     previous working directory
```

## Examples

### Up One Level

```
/home/chuck/foo/bar/baz/head/foot $ up
/home/chuck/foo/bar/baz/head $
```

### Up Multiple Levels

```
/home/chuck/foo/bar/baz/head/foot $ up 4
/home/chuck/foo $
```

### Up By Full Name

```
/home/chuck/foo/bar/baz/head/foot $ up bar
/home/chuck/foo/bar $
```

### Up By Partial Name

```
/home/chuck/foo/bar/baz/head/foot $ up ba
/home/chuck/foo/bar/baz $
```

### Tab Completion

```
/home/chuck/foo/bar/baz/head/foot $ up <TAB>
bar/    baz/    chuck/  foo/    head/   home/

/home/chuck/foo/bar/baz/head/foot $ up h<TAB>
head/   home/

/home/chuck/foo/bar/baz/head/foot $ up ho<TAB>
/home/chuck/foo/bar/baz/head/foot $ up home/
/home $
```

----

© Shannon Moeller <me@shannonmoeller.com> (shannonmoeller.com)

Licensed under [MIT](http://shannonmoeller.com/mit.txt)
