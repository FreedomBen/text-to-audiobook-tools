#!/usr/bin/env bash

# aws polly put-lexicon --name ScripturalLexicon --content file://scriptural_lexicon.xml

#aws polly put-lexicon --name ScripturalLexicon1 --content file://sl1.xml
#aws polly put-lexicon --name ScripturalLexicon2 --content file://sl2.xml

for f in scriptural_lexicon/0*.xml; do
  lexicon_name="$(echo "$f" | sed -e 's|scriptural_lexicon/||g' | sed -e 's|\.xml$||g')"
  echo "Uploading lexicon '${lexicon_name}' from file://'${f}'"
  aws polly put-lexicon --name "${lexicon_name}" --content "file://${f}"
done


#  01 000 to 200
#  02 200 to 400
#  03 400 to 600
#  04 600 to 800
#  05 800 to 1000
#  06 1000 to 1200
#  07 1200 to 1400
#  08 1400 to 1600
