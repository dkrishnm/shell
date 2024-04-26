#clue 1 - The very odd and inedible ingredient in a cake recipe
password="Paper Rings"

# clue 2
showsdir="clues/shows/friends"
show_count=18
# Loop through each subdirectory
for show in "$showsdir"/*; do
        # Get the number of files in the show folder
        num_files=$(find "$show" -type f | wc -l)
        # Check if number of files equals 18
        if [ "$num_files" -eq "$show_count" ]; then
            echo "Show with 18 files found: $show"
            # fetch the filename
            filename=$(basename "$show" | cut -d'.' -f1)
            # Split the filename by underscores and get the season number
            season_num=$(echo "$filename" | awk -F '_' '{print $2}')
            password+="$season_num"
            echo "$password"
            break
        fi
done

# clue 3
directory="clues/shows/friends/season_6"
filename="ep_21.txt"
# Read the fifth word from the file
fifth_word=$(awk '{print $5}' "$directory/$filename")
password+="$fifth_word"
echo "$password"

# clue 4

directory="clues/movies/space_wars"
filename="fifth_movie.txt"
fifth_word=$(awk '{print $5}' "$directory/$filename")
password+="$fifth_word"
echo "$password"


#clue 5

directory="clues/albums/red"
search_text="4:00"

# Loop through files in the directory
for file in "$directory"/*; do
    if [ -f "$file" ]; then
        # Check if the file contains the search text
        if grep -q "$search_text" "$file"; then
            echo "Found '$search_text' in file: $file"
            # Get the first line of the file
            title=$(head -n 1 "$file")
            # Split the first line by ":"
            IFS=':' read -r -a parts <<< "$title"
            # Save the second part to a variable
            second_part="${parts[1]}"
            # Split the second part by space
            IFS=' ' read -r -a second_parts <<< "$second_part"
            # Get the second word
            second_word="${second_parts[1]}"
            password+="${second_word}"
        fi
    fi
done

#clue 6

directory="clues/movies/hanger_games"
filename="movie_4.txt"
fourth_word=$(awk '{print $4}' "$directory/$filename")
password+="$fourth_word"
echo "$password"



echo "What is the secret password? $password"



