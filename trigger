#!/bin/bash

rnd_dir='random_trigger_files'
[[ -d $rnd_dir ]] || mkdir $rnd_dir

rnd="$( dd if=/dev/random | base64 | head -c 16 | sed 's/[^a-zA-Z0-9]//g' )"

touch "$rnd_dir/$rnd" &&\
git add . &&\
git commit -m "wip - triggering a build with a random file $rnd" &&\
git push
