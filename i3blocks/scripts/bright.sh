state=$(brightnessctl g)
max=$(brightnessctl m)

output=$((state * 100 / max))

echo $output%
