
. .venv/bin/activate

PROMPT="./prompts/fromfileprompt.txt"

cat $PROMPT | ./.venv/bin/invoke.py --from_file -

for (( i=1; i<${1:-2}; i++))
do
	new_img=$(cat ./outputs/invoke_log.md | tail -n 3 | head -n 1 | cut -d '(' -f2 | cut -d ')' -f1)

	#echo "new file is $new_img"

	echo "============================="

	convert ./outputs/$new_img -resize 512x512 ./outputs/$new_img

	new_prompt="!fix ./outputs/$new_img --outcrop top 64 right 64 bottom 64 left 64 --new_prompt \"snowy landscape, snow covered evergreen trees, lake, hills, cloudy, bob ross\""

	echo "$new_prompt" | ./.venv/bin/invoke.py --from_file -
done
