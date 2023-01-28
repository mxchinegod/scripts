#!/bin/bash
PURPLE="\e[35m"
ENDCOLOR="\e[0m"

# It's a function that's going to print out the text in purple.
purple () {
    echo -e $(printf "${PURPLE}$1${ENDCOLOR}")
}

# spinner 1
spin()
{
  spinner="/|\\-/|\\-"
  while :
  do
    for i in `seq 0 7`
    do
      echo -n "${spinner:$i:1}"
      echo -en "\010"
      sleep 0.1
    done
  done
}

purple "🏁 Spinner 1: "
spin &
pid1=$!
sleep 5
kill $pid1

# spinner 2
spin2()
{
  spinner="|/-\\"
  while :
  do
    for i in `seq 0 3`
    do
      echo -n "${spinner:$i:1}"
      echo -en "\010"
      sleep 0.1
    done
  done
}

purple "🏁 Spinner 2: "
spin2 &
pid2=$!
sleep 5
kill $pid2

# spinner 3
spin3()
{
  spinner="⠋⠙⠹⠸⠼⠴⠦⠧"
  while :
  do
    for i in `seq 0 7`
    do
      echo -n "${spinner:$i:1}"
      echo -en "\010"
      sleep 0.1
    done
  done
}

purple "🏁 Spinner 3: "
spin3 &
pid3=$!
sleep 5
kill $pid3

# spinner 4
spin4()
{
  spinner="⠁⠂⠄⠂"
  while :
  do
    for i in `seq 0 3`
    do
      echo -n "${spinner:$i:1}"
      echo -en "\010"
      sleep 0.1
    done
  done
}

purple "🏁 Spinner 4: "
spin4 &
pid4=$!
sleep 5
kill $pid4

# spinner 5
spin5()
{
  spinner="⠋⠙⠚⠞⠖⠦⠴⠲⠳⠓"
  while :
  do
    for i in `seq 0 9`
    do
      echo -n "${spinner:$i:1}"
      echo -en "\010"
      sleep 0.1
    done
  done
}

purple "🏁 Spinner 5: "
spin5 &
pid5=$!
sleep 5
kill $pid5
