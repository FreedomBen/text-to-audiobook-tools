#!/usr/bin/env bash


# To list lexicons:
#   aws polly list-lexicons

# ScripturalLexicon (lexicon)
# Brian (voice id)

# aws polly synthesize-speech \
#   --engine neural \
#   --voice-id Brian \
#   --language-code en-GB \
#   --lexicon-names "ScripturalLexicon" \
#   --output-format mp3 \
#   --text-type "text" \
#   --text "Hello Moroni.  I see that you are well.  Terrific!"
#   # --speech-mark-types "sentence" ?
# 
# aws polly start-speech-synthesis-task
#   --engine neural \
#   --voice-id Brian \
#   --language-code en-GB \
#   --lexicon-names "ScripturalLexicon" \
#   --output-format mp3 \
#   --text-type "text" \
#   --output-s3-bucket-name "ohai" \
#   --output-s3-key-prefix "${filename}-" \
#   --text "Hello Moroni.  I see that you are well.  Terrific!"

for i in 0*.txt 1*.txt; do
  echo "Uploading Chapter:  ${i}"
  aws polly start-speech-synthesis-task \
    --engine neural \
    --voice-id Brian \
    --language-code en-GB \
    --lexicon-names "01scriptural" "02scriptural" "03scriptural" "04scriptural" \
    --output-format mp3 \
    --text-type "text" \
    --output-s3-bucket-name "polly-outputs-9c9c" \
    --output-s3-key-prefix "${i}-" \
    --text "file://${i}"
done

# To check the status
aws polly list-speech-synthesis-tasks  | jq .SynthesisTasks[].TaskStatus

echo 'TO check status:'
echo ''
echo '    aws polly list-speech-synthesis-tasks  | jq .SynthesisTasks[].TaskStatus'
