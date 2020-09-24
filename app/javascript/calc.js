window.addEventListener('load', function () {
  const item_price = document.getElementById("item-price");
  const add_tax_price = document.getElementById("add-tax-price");
  const sell_profit = document.getElementById("profit");

  item_price.addEventListener('input', function calc() {
    const num = parseInt(item_price.value, 10);
    let tax_price = Math.floor(num * (10 / 100))
    let total = Math.floor(num - (num * (10 / 100)))

      if (isNaN(num)){
        tax_price = 0
        total = 0
      }
      add_tax_price.innerHTML = tax_price
      sell_profit.innerHTML = total
  });
});