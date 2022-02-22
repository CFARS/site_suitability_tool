#!/bin/bash

INFILE=Example/example_project.csv
CONFIG=Example/configuration_example_project.xlsx
OUTFILE=test/test_output.xlsx
TIOUTFILE=test/TI_10minuteAdjusted_test_output.csv

REMOVEFILES=0

source venv/bin/activate
pip install -e .
python3 TACT.py -in $INFILE -config $CONFIG -res $OUTFILE --timetestFlag
deactivate

if [ -f $OUTFILE ] && [ $REMOVEFILES -eq 1 ]; 
then
    rm $OUTFILE
else
    printf "ERROR: $OUTFILE not created! Exiting\n"
    exit 1
fi

if [ -f $TIOUTFILE ] && [ $REMOVEFILES -eq 1];
then
    rm $TIOUTFILE
else
    printf "ERROR: $TIOUTFILE not created! Exiting\n"
    exit 2
fi

if [ $REMOVEFILES -eq 1 ];
then
    printf "INFO: example_data_test passed!\n"
else
    printf "Files created, review to ensure all tests passed\n"
fi