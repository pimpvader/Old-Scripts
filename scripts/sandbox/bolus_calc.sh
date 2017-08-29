#!/bin/bash
#Quick Bolus calculator
#Programmer: Jason Rohde
#DATE: 8-18-2014 
#PURPOSE: To calculate bolus amounts at mealtime

declare -i CARB
declare -i ICRATIO
declare -i BOLUS

CARB=$1
ICRATIO=9
BOLUS=$[ $CARB/$ICRATIO ]

echo "Bolus $BOLUS for $CARB grams of carbohydrates"

