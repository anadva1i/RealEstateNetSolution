/* ----- Employee Dashboard Chart Js For Applications Statistics ----- */
function createConfig() {
    return {
        type: 'line',
        data: {
            labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
            datasets: [{
                label: 'Dataset',
                borderColor: window.chartColors.red,
                backgroundColor: window.chartColors.red,
                data: [10, 30, 46, 2, 8, 50, 0],
                fill: false,
            }]
        },
        options: {
            responsive: true,
            title: {
                display: true,
                text: 'Sample tooltip with border'
            },
            tooltips: {
                position: 'nearest',
                mode: 'index',
                intersect: false,
                yPadding: 10,
                xPadding: 10,
                caretSize: 8,
                backgroundColor: 'rgba(72, 241, 12, 1)',
                titleFontColor: window.chartColors.black,
                bodyFontColor: window.chartColors.black,
                borderColor: 'rgba(0,0,0,1)',
                borderWidth: 4
            },
        }
    };
}
window.onload = function() {
    //var c_container = document.querySelector('.c_container');
    var div = document.createElement('div');
    div.classList.add('chart-container');

    var canvas = document.createElement('canvas');
    div.appendChild(canvas);
    //c_container.appendChild(div);

    var ctx = canvas.getContext('2d');
    var config = createConfig();
    new Chart(ctx, config);
    AdvancedAmount();
};
var chart;

function DrawMyChart(advance_payment, principal_amount, rate) {
    if (chart) {
        chart.destroy();
    }

    // Circle Doughnut Chart
    var ctx = document.getElementById('myChart').getContext('2d');
    chart = new Chart(ctx, {
        // The type of chart we want to create
        type: 'doughnut',

        // The data for our dataset
        data: {
            labels: ['წინასწარი (₾)', 'ძირი (₾)', 'პროცენტი (₾)'],
            datasets: [{
                label: 'Loan Calculator',
                segmentShowStroke: true,
                segmentStrokeColor: "transparent",
                segmentStrokeWidth: 17,
                backgroundColor: ["#92d060", "#4585ff", "#fb8855"],
                data: [advance_payment, principal_amount, rate],
                responsive: true,
                showScale: true
            }]
        },
        // Configuration options go here
        options: {
            plugins: {
                datalabels: {
                    display: true,
                    backgroundColor: '#ccc',
                    borderRadius: 3,
                    font: {
                        color: 'red',
                        weight: 'bold',
                    }
                },
                doughnutlabel: {
                    labels: [{
                        text: total,
                        font: {
                            size: 18,
                            weight: 'bold'
                        }
                    }, {
                        text: 'total (₾)'
                    }]
                }
            }
        }
    });
}



var total = 0;
function PMT(interest, months, loan) {
    return interest * loan * Math.pow((1 + interest), months) / (1 - Math.pow((1 + interest), months));
}

function Calculate() {
    var interest = $("#formGroupCompound").val() / 12 / 100;
    var months = $("#formGroupYear").val() * 12 + +$("#formGroupMonth").val();
    var loan = $("#propertyPrice").text() - $("#formGroupGEL").val();
    var pmt = PMT(interest, months, -loan)
    total = pmt * months;
    total = total.toFixed(2);
    var advance_payment = $("#formGroupGEL").val();
    var principal_amount = $("#propertyPrice").text() - advance_payment;
    var sum = +advance_payment + +principal_amount;
    var rate = total - sum;
    rate = rate.toFixed(2);
    DrawMyChart(advance_payment, principal_amount, rate);
}

function AdvancedAmount() {
    var totalPrice = $("#propertyPrice").text();
    var rate = $("#formGroupRate").val();
    var advanced = totalPrice * rate / 100;
    $("#formGroupGEL").val(advanced.toFixed(2));
    Calculate();
}

function AdvancedRate() {
    var totalPrice = $("#propertyPrice").text();
    var advanced = $("#formGroupGEL").val();
    var rate = advanced * 100 / totalPrice;
    $("#formGroupRate").val(rate.toFixed(2));
    Calculate();
}