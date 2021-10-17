const char MAIN_page[] PROGMEM = R"=====(
<!doctype html>
<html>
<head> </head>

<body>
    <div style="text-align:center;"><b>JavaScript Basics</b><br>Timer Demo</div>
    <div style="text-align:center;"><H1>Temperature <p id="temp"> </p> </H1></div>
<br>
<br>  

<script>
var values = [];
var timeStamp = [];

//On Page load show graphs
window.onload = function() {
  console.log(new Date().toLocaleTimeString());
};

setInterval(function() {
  // Call a function repetatively with 5 Second interval
  getData();
}, 3000); //5000mSeconds update rate
 
function getData() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
     
      var time = new Date().toLocaleTimeString();
      var ADCValue = this.responseText; 
      values.push(ADCValue);
      timeStamp.push(time);
      document.getElementById("temp").innerHTML = ADCValue
    }
  };
  xhttp.open("GET", "readADC", true); 
  xhttp.send();
}
    
</script>
</body>

</html>

)=====";
