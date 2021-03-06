#!/bin/sh

set -eu

rm -f index.md

BASE_DIR=$( git rev-parse --show-toplevel )
REPOSITORY_NAME=$( basename "$BASE_DIR" )
NAMESPACE=$( basename $( dirname "$BASE_DIR" ) )

MD_TABLE_TITLE='| Libraries | Practice | '
MD_TABLE_ALIGNER='|---|---|'
MD_TABLE_CONTENT=$(
    find libraries/ -type f | sort -h | while read -r l; do
        link="https://$NAMESPACE.github.io/$REPOSITORY_NAME/$l"
        echo "| [$link]($link) | [Play now](https://play.touchtypie.com?book_library_ids=$link) |";
    done
)

cat - >> index.md <<EOF
$MD_TABLE_TITLE
$MD_TABLE_ALIGNER
$MD_TABLE_CONTENT


EOF

MD_TABLE_TITLE='| Collections| Practice | '
MD_TABLE_ALIGNER='|---|---|'
MD_TABLE_CONTENT=$(
    find collections/ -type f | sort -h | while read -r l; do
        link="https://$NAMESPACE.github.io/$REPOSITORY_NAME/$l"
        echo "| [$link]($link) | [Play now](https://play.touchtypie.com?book_collection_ids=$link) |";
    done
)

cat - >> index.md <<EOF
$MD_TABLE_TITLE
$MD_TABLE_ALIGNER
$MD_TABLE_CONTENT


EOF


MD_TABLE_TITLE='| Books | Practice | '
MD_TABLE_ALIGNER='|---|---|'
MD_TABLE_CONTENT=$(
    find books/ -type f | sort -h | while read -r l; do
        link="https://$NAMESPACE.github.io/$REPOSITORY_NAME/$l"
        echo "| [$link]($link) | [Play now](https://play.touchtypie.com?playmode=repeatone&book_ids=$link) |";
    done
)

cat - >> index.md <<EOF
$MD_TABLE_TITLE
$MD_TABLE_ALIGNER
$MD_TABLE_CONTENT


EOF
