#!/bin/bash
export BASE=$(pwd)

function dkupa {
  CD=$(pwd)
  cd $BASE
  docker-compose up
  exitcode=$?
  cd $CD
}

function dkdown {
  CD=$(pwd)
  cd $BASE
  docker-compose down
  exitcode=$?
  cd $CD
}

function dk {
  docker-compose run --rm app $@
}

function dktest {
  dk rspec -fd
}
