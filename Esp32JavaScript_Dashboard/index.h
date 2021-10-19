const char MAIN_page[] PROGMEM = R"=====(
<!doctype html>
<html>

<head>
  <title>Dashboard Demo</title>
  <script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>  
  <style>
  canvas{
    -moz-user-select: none;
    -webkit-user-select: none;
    -ms-user-select: none;
  }


  /* Data Table Styling */
  #dataTable {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
  }

  #dataTable td, #dataTable th {
    border: 1px solid #ddd;
    padding: 8px;
  }

  #dataTable tr:nth-child(even){background-color: #f2f2f2;}

  #dataTable tr:hover {background-color: #ddd;}

  #dataTable th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #4CAF50;
    color: white;
  }
  </style>
</head>

<body>
    <div style="text-align:center;"><b>IoT Dashboard</b><br>Real Time IoT Dashboard</div>
    <div class="chart-container" position: relative; height:350px; width:100%">
        <canvas id="Chart" width="200" height="400"></canvas>
    </div>
<div>
  <table id="dataTable">
    <tr><th>Time</th><th>ADC Value</th></tr>
  </table>
</div>
<br>
<br>  

<script>
var values = [];
var timeStamp = [];
function showGraph()
{
    var ctx = document.getElementById("Chart").getContext('2d');
    var Chart2 = new Chart(ctx, {
        type: 'line',
        data: {
            labels: timeStamp,  //Bottom Labeling
            datasets: [{
                label: "Temperature 1",
                fill: false,  //Try with true
                backgroundColor: 'rgba( 243, 156, 18 , 1)', //Dot marker color
                borderColor: 'rgba( 243, 156, 18 , 1)', //Graph Line Color
                data: values,
            }],
        },
        options: {
            title: {
                    display: true,
                    text: "Temperature"
                },
            maintainAspectRatio: false,
            elements: {
            line: {
                    tension: 0.5 //Smoothening (Curved) of data lines
                }
            },
            scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero:true
                        }
                    }]
            }
        }
    });

}

setInterval(function() {
  // Call a function repetatively with 3 Second interval
  getData();
}, 3000); //3000mSeconds update rate
 
function getData() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
     //Push the data in array
      var time = new Date().toLocaleTimeString();
      var temperatureValue = this.responseText; 
      values.push(temperatureValue);
      timeStamp.push(time);
      showGraph();  //Update Graphs
     
      //Update Data Table
      var table = document.getElementById("dataTable");
      var row = table.insertRow(1); //Add after headings
      var cell1 = row.insertCell(0);
      var cell2 = row.insertCell(1);
      cell1.innerHTML = time;
      cell2.innerHTML = temperatureValue;
    }
  };
  xhttp.open("GET", "readTemperature", true);
  xhttp.send();
}
    
</script>
</body>

</html>

)=====";
