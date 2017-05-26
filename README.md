# `up`

Stop typing `../../..` endlessly. Use tab completion instead! Using `up` allows you to change your current directory to a parent of the current directory where the parent is specified by name or index.

## Install

Written in 100% shell script, `up.sh` registers the `up` function and some completion functions via your `.bashrc` or `.zshrc` file.

Written in 100% shell script, `up.fish` registers the `up` function and some completeion functions via `funcsave`.

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

### fish

```
curl --create-dirs -o ~/.config/up/up.sh https://raw.githubusercontent.com/shannonmoeller/up/master/up.sh
source ~/.config/up/up.shc
```

## Usage

```
$ up [dir|num|-]

    dir   full or partial name of any parent directory
    num   number of times you'd have to type `../`
    -     previous working directory
```

## Examples

Up one level:

```
/home/chuck/foo/bar/baz/head/foot $ up
/home/chuck/foo/bar/baz/head $
```
curl --create-dirs -o ~/.config/up/up.sh https://raw.githubusercontent.com/shannonmoeller/up/master/up.sh
echo 'source ~/.config/up/up.sh' >> ~/.bashrc

Up multiple levels:

```
/home/chuck/foo/bar/baz/head/foot $ up 4
/home/chuck/foo $
```

Up by full name:

```
/home/chuck/foo/bar/baz/head/foot $ up bar
/home/chuck/foo/bar $
```

Up by partial name:

```
/home/chuck/foo/bar/baz/head/foot $ up ba
/home/chuck/foo/bar/baz $
```

Tab completion:

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
