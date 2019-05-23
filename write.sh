#!/bin/bash

SCRATCH_DIR=~/.scratch

SCRATCH_PREV_DIR=`pwd`
SCRIPT_DIR=`dirname $0`
TEMPLATE_DIR=$SCRIPT_DIR/templates

cd $SCRATCH_DIR

if [[ "$#" -eq 1 ]]; then
  DATE="$1"
else
  DATE="`date +"%Y-%m-%d"`"
fi

FILENAME="$DATE.md"

# New line after `echo` is needed
ENTRY=`mktemp`
echo -e "\n## `date +'%I:%M%p'`" > $ENTRY

if [ -f $FILENAME ]; then
  vim +"normal G" +"r $ENTRY" +"normal G" $FILENAME && cd $SCRATCH_PREV_DIR
else
  vim +"r $TEMPLATE_DIR/notes.md" +"normal G" +"r $ENTRY" +"normal G" $FILENAME && cd $SCRATCH_PREV_DIR

fi
