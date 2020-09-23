window.addEventListener('load', function () {
  var item_price = document.getElementById("item-price");
  var add_tax_price = document.getElementById("add-tax-price");
  var sell_profit = document.getElementById("profit");

  item_price.addEventListener('input', function calc() {
    var num = parseInt(item_price.value, 10);
    var tax_price = Math.floor(num * (10 / 100))
    var total = Math.floor(num - (num * (10 / 100)))

      if (isNaN(num)){
        tax_price = 0
        total = 0
      }
      add_tax_price.innerHTML = tax_price
      sell_profit.innerHTML = total
  });
});