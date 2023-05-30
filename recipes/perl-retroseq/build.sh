#!/bin/bash

# Move the Perl modules to the appropriate 
# export PERL5LIB=/$PREFIX/bin/:$PERL5LIB
cp -r ./RetroSeq/ $PREFIX/
cp ./bin/retroseq.pl $PREFIX/bin/retroseq.pl

# Set executable permissions for the code.pl file
chmod +x $PREFIX/bin/retroseq.pl
