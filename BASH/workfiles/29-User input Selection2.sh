#!/bin/bash
select option in "cat" "dog" "quit"

do
    case $option in
        cat) echo "Cats like to sleep";;
        dog) echo "Dogs like to play catch.";;
        quit) break;;
        *) echo " What's that dummy?";;
    esac
done
