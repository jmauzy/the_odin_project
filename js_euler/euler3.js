/* find the largest prime factor of 1000 */

var isPrime = function(input){
    if(input<=2){
	return(false);}
	for(var i=2; i<input; i++){
		if(input % i === 0){
			return(false);}}
	return(true);
}

var factorList = [];

var largestPrimeFactor = function(n){
	for(var i = 2; i<n; i++){
		if(n % i === 0){
            if(isPrime(i)===true){
			factorList.push(i);}}}
    return(factorList[factorList.length-1]);
}
    
largestPrimeFactor(12345);

			
	
		