function price() {
  const price_input = document.getElementById("input-price");
  const add_tax_price = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit")

  price_input.addEventListener('input', putPrice)
  function putPrice() {
    const input_price = document.getElementById("input-price").value;
    const fee = input_price * 0.1;
    const pft = input_price - fee;
    add_tax_price.innerHTML = fee
    profit.innerHTML = pft
  }

}

window.addEventListener("load", price);