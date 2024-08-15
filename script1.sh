for folder in ~/.config/*; do
    if [ -d "$folder" ]; then
        cp -r "$folder" .
    fi
done