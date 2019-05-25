console.log(window.location.pathname.slice(8, window.location.pathname.length));

var number = window.location.pathname.slice(8, window.location.pathname.length);
var url = "/doctor/json/" + number;
fetch(url)
    .then(response => {
        // console.log(response.json());
        return response.json();
        // response.text();
        // console.log(JSON.parse(response));
    })
    .then(data => {
        // console.log(JSON.parse(data)); // Prints result from `response.json()` in getRequest
        console.log(data);
        console.log(data.id);
        var node = document.createElement("h1");                 // Create a <li> node
var textnode = document.createTextNode(data.firstName);         // Create a text node
node.appendChild(textnode);                              // Append the text to <li>
document.getElementById("nume").appendChild(node);
    })
    .catch(error => console.error(error));