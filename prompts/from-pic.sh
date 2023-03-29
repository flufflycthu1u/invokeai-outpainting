
. .venv/bin/activate

source="./inputs/Solid_white.png"
P1="!switch sd-inpainting-1.5"
P2="--outcrop top 64 right 64 bottom 64 left 64 -z0 --new_prompt \"polar bear in a snowstorm\""

echo -e "${P1}\n!fix $source ${P2}" | ./.venv/bin/invoke.py --from_file -

images="$source"

for (( i=1; i<${1:-2}; i++))
do
	# handle previous image
	new_img=$(cat ./outputs/invoke_log.md | tail -n 3 | head -n 1 | cut -d '(' -f2 | cut -d ')' -f1)
	convert ./outputs/$new_img -resize 512x512 ./outputs/$new_img
	images="$images ./outputs/$new_img"

	# generate new prompt and execute it
	new_prompt="!fix ./outputs/$new_img $P2"
	echo "$new_prompt" | ./.venv/bin/invoke.py --from_file -
done

# handle final image
new_img=$(cat ./outputs/invoke_log.md | tail -n 3 | head -n 1 | cut -d '(' -f2 | cut -d ')' -f1)
convert ./outputs/$new_img -resize 512x512 ./outputs/$new_img
images="$images ./outputs/$new_img"

python3 gif.py $images
