<?php
$data = $news->getNews();
if(gettype($data) == "array"){
    echo "<h3>Всего записей: ".count($data)."</h3>";
} else $errMsg = "Ошибка. Повторите чуть позже!";
foreach ($data as $row) {
    print "<div style='
    display: flex; 
    flex-direction: column; 
    width: 1000px; 
    max-height: 300px; 
    border: 2px solid black; 
    margin-bottom: 40px; 
    padding-left: 15px; 
    padding-bottom: 15px;'>";
    print "<h4 style='text-transform: uppercase; 
    font-size: 30px; 
    margin: 0; 
    padding-top: 15px'>".$row['title']."</h4>";
    print "<i>".$row['category']."</i>";
    print "<p>".$row['description']."</p>";
    print "<cite >".$row['source']."</cite>";
    print "<form method='get'>";
    print "<input name='msgId' type='hidden' value='$row[id]'>";
    print "<input type='submit' value='К статье' style='margin-top: 30px;'/>";
    print "</form>";
    print "</div>";
}