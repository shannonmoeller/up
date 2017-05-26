#!/usr/bin/env fish
#
# up.fish: Quickly traverse the current working path.
# [      Author      ] endowdly           
# [       Email      ] endowdly@gmail.com
# [   Date Created   ] 23 May, 2017
# [   Last Modified  ] 26 May, 2017
#
# fish fork from up.sh by Shannon Moeller <me@shannonmoeller.com>
#
# source to use: source /path/to/up/up.fish

function _updir 
  if test $argv[1] = '/' -o -z $argv[1] -o -z $argv[2]
    return
  end

  set --local p (dirname "$argv[1]")
  set --local a (basename "$p")
  set --local b (basename "$argv[2]")

  if test -z $a -o -z $b
    return
  end

  if string match -iq "$b*" $a
    echo $p
    return
  end

  _updir $p $argv[2]
  # Ooo, look at this clever recursion! 
end 

function _upnum
  if test -z $argv[1] -o -z $argv[2] 
    return
  end

  set --local p $argv[1]
  set --local i $argv[2]

  while test $i -ne 0 	
    set p (dirname $p)
    set i (math $i - 1)
  end

  echo $p
end

function up
  # up one 
  if not count $argv > /dev/null
    cd ..
    return 
  end

  # go back 
  if test $argv[1] = '-' -o -d $argv[1] 
    cd $argv[1]
    return
  end

  # check for num
  set --local regex '^[0-9]+$'

  if string match -rq $regex $argv[1]
    set d (_upnum $PWD $argv[1])     
  else
    set d (_updir $PWD $argv[1])
  end 

  if test -d $d
    cd $d
    return
  end

  echo -e "usage: up [dir|num|-]\npwd: $PWD"
end

function _up 
  #set --local p (ls ..)
  set --local p (string split / $PWD)

  for d in $p 
    echo $d
  end
end

complete -c up -fa "(_up)"
funcsave up
funcsave _updir
funcsave _upnum

# __END___

