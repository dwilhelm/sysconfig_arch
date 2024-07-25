#!/bin/sh

BASEDIR="etc"

for F in `find ${BASEDIR} -type f -path "${BASEDIR}/*" -not -name '*.orig'`
do
	echo "Checking $F"
	test -f /$F || echo "    Not found $F"
	diff --color -U0 /$F $F
done

