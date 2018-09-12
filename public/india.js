/* global axios */

console.log("Vishnu is a Computer Programmer");

var productTemplate = document.querySelector("#product-card");

console.log("helo", productTemplate);

var productContainer = document.querySelector(".row");

axios.get("http://localhost:3000/api/products").then(function(response) {
  var products = response.data;

  products.forEach(function(product) {
    console.log(product);
    var productClone = productTemplate.content.cloneNode(true);

    productClone.querySelector(".card-title").innerText = product.name;

    productClone.querySelector(".card-img-top").src =
      product.List_of_Images[0].url;

    productClone.querySelector(".ir").innerText = product.description;

    productClone.querySelector(".bo").innerText = product.price;

    productContainer.appendChild(productClone);
  });
});
