//NEEDS: log time, glucose and boluse to csv.

var cFactor = 32;
var iCRatio = 6;
alert("This is a very simple bolus calculator it will do food bolus and correction bolus. The food bolus will take your correction into the calculation. NOTE I have not yet included a calculation for insulin on board (IOB)");
alert("I have not yet included a calculation for insulin on board!!");

function bolusFood() {
	bolusFood = carb/iCRatio;
	return bolusFood;
}

function bolusCorrection() {
	bolusCorrection = (bloodGlucose - 108)/cFactor;
	return bolusCorrection;
}
var typeOfBolus = prompt("Correction or meal?").toLowerCase();

if (typeOfBolus === "correction") {
	var bloodGlucose = prompt("What is your current blood glucose");
	var correction = bolusCorrection(bloodGlucose, cFactor);
	   if (correction > 0 ) {
	   alert(correction + " Units of insulin");
	   }
	   else if (correction <= 0) {
	   alert("0 Units of insulin");
	   }
}
if (typeOfBolus == "meal") {	
	var bloodGlucose = prompt("What is your current blood glucose");
	var carb = prompt("how many carbs are you eating?");
	var food = bolusFood(carb, iCRatio);
	var correction = bolusCorrection(bloodGlucose, cFactor);
           if (correction > 0) {
	   alert(correction + food + " Units of insulin");
	   }
	   else if (correction <= 0) {
	   alert(0 + food + " Units of insulin");
           }
}

