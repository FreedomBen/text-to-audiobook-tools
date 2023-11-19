#!/usr/bin/env bash

#
# To run against multiple files:
#
#   for i in 0*.txt; do echo $i; done
#
#   for i in 0*.txt; do ../edits.sh "$i"; done
#

INPUT_FILE="${1:-example.txt}"

# Page numbers
sed -i -E -e 's/-?\[p\.\s?[0-9xvil]+\]//g' "${INPUT_FILE}"

## Find page numbers
#grep -E '\[p\. [0-9]+\]' "${INPUT_FILE}"
#
## Remove page numbers
#sed -i -E -e 's/\[p\. [0-9]+\]//g' "${INPUT_FILE}"



# Replace quotes
sed -i -E -e 's/[“”]/"/g' "${INPUT_FILE}"


# Find footnotes
#grep -E '("|\.|?|,)[0-9]{1,3}' "${INPUT_FILE}"


# These take care of the footnotes
# grep -E '"[0-9]{1,3}' "${INPUT_FILE}"
# grep -E '\.[0-9]{1,3}' "${INPUT_FILE}"
# grep -E '\?[0-9]{1,3}' "${INPUT_FILE}"
# grep -E '[a-zA-Z]\,[0-9]{1,3}' "${INPUT_FILE}"
# grep -E '\-?\[[0-9]{1,2}\]' "${INPUT_FILE}"
# grep -P '\s\(BM\s.*?\)' "${INPUT_FILE}"
# grep -E '\[sic\]' "${INPUT_FILE}"
# grep -E '[Aa]ntichristian' "${INPUT_FILE}"

sed -i -E -e 's/"[0-9]{1,3}/"/g' "${INPUT_FILE}"
sed -i -E -e 's/\.[0-9]{1,3}/./g' "${INPUT_FILE}"
sed -i -E -e 's/\?[0-9]{1,3}/?/g' "${INPUT_FILE}"
sed -i -E -e 's/([a-zA-Z])\,[0-9]{1,3}/\1,/g' "${INPUT_FILE}"
sed -i -E -e 's/\-?\[[0-9]{1,2}\]//g' "${INPUT_FILE}"
sed -i -E -e 's/\s\(BM\s.*?\)//g' "${INPUT_FILE}"
perl -p -i -e 's/\s\(BM\s.*?\)//g' "${INPUT_FILE}"
sed -i -E -e 's/\[sic\]//g' "${INPUT_FILE}"
sed -i -E -e 's/[Aa]ntichristian/anti-christian/g' "${INPUT_FILE}"


# more specifically for inside mind

### Remove scriptures and stuff in parenthesis
#            (D&C 26:1)  --- e made known what you shall do" (D&C 26:1).
#  example:  (vv. 7-8)   Ghost" (vv. 7-8). Em


# Added for John Doyle Lee by Juanita Brooks
sed -i -E -e '/next page >/d' "${INPUT_FILE}"
sed -i -E -e '/< previous page/d' "${INPUT_FILE}"

sed -i -E -e '/If you like this book, buy it/d' "${INPUT_FILE}"
sed -i -E -e '/^page_/d' "${INPUT_FILE}"
sed -i -E -e '/^Page /d' "${INPUT_FILE}"


# Added for new approaches to the book of mormon brent metcalf
# Remove thinks like (1985, 193-94)

perl -p -i -e 's/\s*\(\d{4},.{1,30}\)\././g' "${INPUT_FILE}"
perl -p -i -e 's/\s*\(\d{4},.{1,30}\)\?/?/g' "${INPUT_FILE}"
perl -p -i -e 's/\s*\(\d{4},.{1,30}\)\!/!/g' "${INPUT_FILE}"
perl -p -i -e 's/\s*\(\d{4},.{1,30}\),/,/g' "${INPUT_FILE}"
perl -p -i -e 's/\(\d{4},.{1,30}\)//g' "${INPUT_FILE}"

#perl -p -i -e 's/\(\d{4},[^)]{1,30}\)//g' "${INPUT_FILE}"

# Remove blocks ontaining cf., v., vv., 1800 to 2000
perl -p -i -e 's/\s*\([^()]{0,50}?cf\.[^()]{0,50}\)\././g' "${INPUT_FILE}"
perl -p -i -e 's/\s*\([^()]{0,50}?v\.[^()]{0,50}\)\././g' "${INPUT_FILE}"
perl -p -i -e 's/\s*\([^()]{0,50}?vv\.[^()]{0,50}\)\././g' "${INPUT_FILE}"
perl -p -i -e 's/\s*\([^()]{1,50}?[12][089]\d\d[^()]{1,50}\)\././g' "${INPUT_FILE}"

perl -p -i -e 's/\s*\([^()]{0,50}?cf\.[^()]{0,50}\)\?/?/g' "${INPUT_FILE}"
perl -p -i -e 's/\s*\([^()]{0,50}?v\.[^()]{0,50}\)\?/?/g' "${INPUT_FILE}"
perl -p -i -e 's/\s*\([^()]{0,50}?vv\.[^()]{0,50}\)\?/?/g' "${INPUT_FILE}"
perl -p -i -e 's/\s*\([^()]{1,50}?[12][089]\d\d[^()]{1,50}\)\?/?/g' "${INPUT_FILE}"

perl -p -i -e 's/\s*\([^()]{0,50}?cf\.[^()]{0,50}\)\!/!/g' "${INPUT_FILE}"
perl -p -i -e 's/\s*\([^()]{0,50}?v\.[^()]{0,50}\)\!/!/g' "${INPUT_FILE}"
perl -p -i -e 's/\s*\([^()]{0,50}?vv\.[^()]{0,50}\)\!/!/g' "${INPUT_FILE}"
perl -p -i -e 's/\s*\([^()]{1,50}?[12][089][^()]\d\d{1,50}\)\!/!/g' "${INPUT_FILE}"

perl -p -i -e 's/\s*\([^()]{0,50}?cf\.[^()]{0,50}\)\,/,/g' "${INPUT_FILE}"
perl -p -i -e 's/\s*\([^()]{0,50}?v\.[^()]{0,50}\)\,/,/g' "${INPUT_FILE}"
perl -p -i -e 's/\s*\([^()]{0,50}?vv\.[^()]{0,50}\)\,/,/g' "${INPUT_FILE}"
#perl -p -i -e 's/\s*\(.{0,50}?[12][089]\d\d{1,50}\)\,/,/g' "${INPUT_FILE}"
perl -p -i -e 's/\s*\([^()]{1,50}?[12][089]\d\d[^()]{1,50}\)\,/,/g' "${INPUT_FILE}"

# To remove all years in parens like (1985) use this:
#perl -p -i -e 's/\s*\([^()]{0,50}?[12][089]\d\d[^()]{0,50}\)\,/,/g' "${INPUT_FILE}"
#perl -p -i -e 's/\s*\([^()]{0,50}?[12][089]\d\d[^()]{0,50}\)\././g' "${INPUT_FILE}"
#perl -p -i -e 's/\s*\([^()]{0,50}?[12][089]\d\d[^()]{0,50}\)\?/?/g' "${INPUT_FILE}"
#perl -p -i -e 's/\s*\([^()]{0,50}?[12][089][^()]\d\d{0,50}\)\!/!/g' "${INPUT_FILE}"
#perl -p -i -e 's/\([^()]{0,50}[12][089]\d\d{0,50}\)//g' "${INPUT_FILE}"

perl -p -i -e 's/\([^()]{0,50}?cf\.{0,50}\)//g' "${INPUT_FILE}"
perl -p -i -e 's/\([^()]{0,50}?v\.{0,50}\)//g' "${INPUT_FILE}"
perl -p -i -e 's/\([^()]{0,50}?vv\.{0,50}\)//g' "${INPUT_FILE}"
perl -p -i -e 's/\([^()]{1,50}[12][089]\d\d{1,50}\)//g' "${INPUT_FILE}"


perl -p -i -e 's/James J\. Strang/James J Strang/g' "${INPUT_FILE}"
perl -p -i -e 's/J\. J\. Strang/J J Strang/g' "${INPUT_FILE}"
perl -p -i -e 's/J\. Reuben Clark/J Reuben Clark/g' "${INPUT_FILE}"
perl -p -i -e 's/J\. Smith/J Smith/g' "${INPUT_FILE}"
perl -p -i -e 's/John W\. Welch/John W Welch/g' "${INPUT_FILE}"
perl -p -i -e 's/E\. T\. A\. Hoffmann/E T A Hoffmann/g' "${INPUT_FILE}"
perl -p -i -e 's/W\. P\. Harris/W P Harris/g' "${INPUT_FILE}"
perl -p -i -e 's/Mr\. Smith/Mister Smith/g' "${INPUT_FILE}"
perl -p -i -e 's/Dr\. Willard/Doctor Willard/g' "${INPUT_FILE}"
perl -p -i -e 's/Joseph Jr\./Joseph Junior/g' "${INPUT_FILE}"
perl -p -i -e 's/Sr\./Senior/g' "${INPUT_FILE}"
perl -p -i -e 's/Jr\./Junior/g' "${INPUT_FILE}"



# (fig. 56) - (figs. 27-28).
perl -p -i -e 's/\(fig.\s[0-9]{1,3}\)//g' "${INPUT_FILE}"
perl -p -i -e 's/\(figs.\s[0-9]{1,3}-[0-9]{1,3}\)//g' "${INPUT_FILE}"

# Footnotes in brackets:  [11]
perl -p -i -e 's/\[[0-9]+?\]//g' "${INPUT_FILE}"

# Footnotes
#sed -E -e 's/(\.|")[0-9]{1,3}/"/g' "${INPUT_FILE}"

# number refs in parens:  (2) (37-40)
perl -p -i -e 's/\([0-9]{1,3}\)//g' "${INPUT_FILE}"
perl -p -i -e 's/\([0-9]{1,3}-[0-9]{1,3}\)//g' "${INPUT_FILE}"



# # TODO: This is to get correct pronunciation.  Must be manually reviewed
# perl -p -i -e 's/\slead\s/ led /g' "${INPUT_FILE}"
# perl -p -i -e 's/\sread\s/ red /g' "${INPUT_FILE}"
# perl -p -i -e 's/\slive\s/ liv /g' "${INPUT_FILE}"
# perl -p -i -e 's/\slives\s/ livs /g' "${INPUT_FILE}"
# perl -p -i -e 's/\sproduce\s/ pro deuce /g' "${INPUT_FILE}"


#
# put space around dashes
