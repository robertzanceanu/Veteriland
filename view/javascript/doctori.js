var number = window.location.pathname.slice(9, window.location.pathname.length);
var url1 = "/doctori/doctori/" + number;
console.log(url1);
fetch(url1)
    .then(response => { return response.json() })
    .then(data => {
        // console.log(data);
        // document.getElementById('container-fluid').innerHTML=""
        console.log(Object.keys(data).length);
        // console.log(data[0]);
        // console.log(data[1]);
        // console.log(data[0].ownerEmail);

        var output = "";
        for (var i = 0; i < Object.keys(data).length; i++) {
            console.log(data[i].ownerEmail);
            // var node = document.createElement("");
            output +="<div class = 'table-row'><div class='text'>"+data[i].lastName+"</div><div class='text'>"+data[i].firstName+"</div><div class='text'>"+data[i].typeAnimal+"</div><div class='text'>"+data[i].phoneNumber+"</div></div>";
            // div.appendChild(content);
            // div.appendChild(node);
        }
        document.getElementById('container-fluid').innerHTML= "<div class='table-row header'><div class='text'>Nume doctor</div><div class='text'>Prenume doctor</div><div class='text'>Specializare</div><div class='text'>Numar de telefon</div></div>"+output;
 })