<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h4>ex1)하루지날때 마다 계속 스택 쌓이게 만들지... 근데 api 손보는게 상당히 까다로워 보임 (미정)</h4>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <div id="chart_div"></div>
      

<script>
google.charts.load('current', {packages: ['corechart', 'line']});
google.charts.setOnLoadCallback(drawLineColors);

function drawLineColors() {
      var data = new google.visualization.DataTable();
      data.addColumn('number', 'X');
      data.addColumn('number', 'Dogs');
      

      data.addRows([
        [0, 0],    [1, 10],   [2, 23],  [3, 17],   [4, 18],  [5, 9],
        [6, 11],   [7, 27],  [8, 33],  [9, 40],  [10, 32], [11, 35],
              ]);

      var options = {
        hAxis: {
          title: '기간'
        },
        vAxis: {
          title: '매출'
        },
        colors: ['#a52714']
      };

      var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
      chart.draw(data, options);
    }
</script>