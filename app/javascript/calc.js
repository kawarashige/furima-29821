window.addEventListener('load', function () {
  const item_price = document.getElementById("item-price");
  const add_tax_price = document.getElementById("add-tax-price");
  const sell_profit = document.getElementById("profit");

  item_price.addEventListener('input', function calc() {
    const num = parseInt(item_price.value, 10);
    const tax_price = Math.floor(num * (10 / 100))
    if ( num == null ) { 
      add_tax_price.innerHTML = 0
      sell_profit.innerHTML = 0
     }
    else {
      add_tax_price.innerHTML = tax_price
      sell_profit.innerHTML = num - tax_price
    }
  });
});