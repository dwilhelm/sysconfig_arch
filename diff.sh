#!/bin/sh

BASEDIR="etc"

for F in `find ${BASEDIR} -type f -path "${BASEDIR}/*" -not -name '*.orig'`
do
	echo "Checking $F"
	test -f /$F || echo "    Not found $F"
	git diff /$F $F
done

