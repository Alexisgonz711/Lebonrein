const changeTabs = () => {
  const tabOrders = document.getElementById("tab-orders");
  const tabSales = document.getElementById("tab-sales");

  if (tabOrders) {
    tabOrders.addEventListener('click', (event) => {
      document.getElementById("tab-orders").classList.add('tab-active');
      document.getElementById("tab-sales").classList.remove('tab-active');
      document.getElementById("tab-content-orders").classList.add('active');
      document.getElementById("tab-content-sales").classList.remove('active');
    });
  }

  if (tabSales) {
    tabSales.addEventListener('click', (event) => {
      document.getElementById("tab-orders").classList.remove('tab-active');
      document.getElementById("tab-sales").classList.add('tab-active');
      document.getElementById("tab-content-orders").classList.remove('active');
      document.getElementById("tab-content-sales").classList.add('active');
    });
  }
}

export { changeTabs }
