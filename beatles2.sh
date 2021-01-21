#!/bin/bash


function longest_word_in_song {
    file=`cat "$1" | tail -n +2 | tr -cs 'A-Za-z' ' '`
    max=0
    for i in $file;
    do
        length=${#i}
        if (( length > max ))
        then
            max=$length
            word=$i
        fi
    done
}

function longest_word_in_catalog {
    #cd $1
    dir=`ls`
    size_1=0
    for song in $dir;
    do
        longest_word_in_song "$song"
        longestWord=${#word}
        if (( longestWord > size ))
        then
            size=$longestWord
            biggestWord=$word
            longestSongName=`cat $song | head -n +1`
        fi
    done
    echo -e "the longest word is: $biggestWord with $size letters in song \"$longestSongName\""
}

function longest_song_in_catalog {
    cd $1
    dir2=`ls`
    size_2=0
    for name in $dir2;
    do
        words_num=`cat $name | tail -n +2 | wc -w`
        if (( words_num > size_2 ))
        then
            size_2=$words_num
            longSong_name=`cat $name | head -n +1`
        fi
    done
    echo "the longest song is: \"$longSong_name\" with $size_2 words"
}

function shortest_song_in_catalog {
    dir3=`ls`
    size_3=1000
    for name2 in $dir3;
    do
        words_num2=`tail -n +2 "$name2" | wc -w`
        if (( words_num2 < size_3 ))
        then
            size_3=$words_num2
            short_song_name=`cat $name2 | head -n +1`
        fi
    done
    echo -e "the shortest song is : \"$short_song_name\" with $size_3 words"        
}

#main
if (( $# != 1 ))
then
    echo -e "Usage: "$0" <beatles.lyrics-path>"
else
    longest_song_in_catalog "$1"
    shortest_song_in_catalog "$1"
    longest_word_in_catalog "$1"
fi





