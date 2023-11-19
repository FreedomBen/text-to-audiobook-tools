# text-to-audiobook-tools

This repo contains a handful of scripts I've written for personal use to aid in converting ebooks into audiobooks.  Because they are for personal use, they down have CLIs and have some hardcoded things like S3 bucket names and stuff.  It's probably not super useful for you, but I've put them here in case it is.

Currently this uses AWS Polly, but soon I'd like to use Piper as well and maybe Mimic 3

If the books you are creating are LDS/Mormon books, you would _definitely_ find the scriptural lexicon useful.  You can use that to get Polly to pronounce the Mormon names correctly.  See `update-polly-lexicon.sh` and `scriptural_lexicon/*.xml`
