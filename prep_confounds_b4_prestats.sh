#!/bin/bash

usage()
{
cat << EOF
usage: $0 options

Prepare confound matrix by pasting standard motion parameters and motion outliers together

OPTIONS:
   -h           Show this message
   -S           List of ID numbers, used to label output
   -P   Motion parameters file (.par) generated by mcflirt      
   -o           Output directory
   
EOF
}

while getopts "hi:S:P:o:" OPTION
do
  case $OPTION in
    h)
      usage
      exit 1
      ;;
    S)
      SUBJ=$OPTARG
      ;;
    P)
      PARFILE=$OPTARG
      ;;
    o)
      OUTDIR=$OPTARG
      ;;
    ?)
      usage
      exit
      ;;
  esac
done

SUBJDIR=$OUTDIR/$SUBJ
OUTLIERS=$SUBJDIR/motion_outliers_${SUBJ}.txt

paste $OUTLIERS $PARFILE >> $SUBJDIR/confound_evs_${SUBJ}.txt