#!/bin/bash

rm .*html

# cleanup: remove all .html files
NOTE_PATH='/home/liang/vimwiki/'
SITE_PATH='/home/liang/projects/runningdemo.com/'

# find $NOTE_PATH -name zett-\*.md -type f -exec pandoc -o {}.html {} \;
cd $NOTE_PATH
rm listing_temp.md
files=$(rg \
  --files-without-match 'private: 1|draft: 1' \
  -g '!diary/*' -g *zett-*.md -g '!index.md' \
  | sort -t2 -k2 -r \
)

# Create an empty file for the listing page.
echo > listing_temp.md

for md_file in $files
do

  titleRegx='s/[-|0-9]*\.md$//';
  title=$(echo $md_file | sed -E $titleRegx | sed 's/^zett-//' | sed 's/-/ /g')
  link=$(echo $md_file | sed 's/.md$/.html/');
  date=$(echo $md_file | grep -Eo '[0-9]{4}-[0-9]{2}-[0-9]{2}')
  echo - [$title]\($link\) \<time\>$date\<\/time\> >> listing_temp.md
  pandoc $md_file -f markdown -t html --template $SITE_PATH/src/_post.html -o ${md_file}.'html' -H $SITE_PATH/src/index.css 
done

pandoc listing_temp.md -f markdown -t html --template $SITE_PATH/src/_index.html -H $SITE_PATH/src/index.css -o index.md.html

# // rename .md.html to .html
find $NOTE_PATH -name '*.md.html' -execdir bash -c 'mv -i "$1" "${1//md.html/html}"' bash {} \;

# // move the .html files from vimwiki folder to this folder
find $NOTE_PATH -name '*.html' -exec mv -f {} $SITE_PATH \;
