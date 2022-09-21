import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", {});
  // First we define two variables that are going to grab our inputs field. You can check the ids of the inputs with the Chrome inspector.
  const startDateInput = document.getElementById('booking_start_date');
  const endDateInput = document.getElementById('booking_end_date');

  // Check that the query selector id matches the one you put around your form.
  if (startDateInput) {
  const unavailableDates = JSON.parse(document.querySelector('#car-booking-dates').dataset.unavailable)
  console.log(unavailableDates)
  endDateInput.disabled = true

  flatpickr(startDateInput, {
  minDate: "today",
  disable: unavailableDates,
  dateFormat: "Y-m-d",
  });

  console.log('im in the file')

  startDateInput.addEventListener("change", (e) => {
  if (startDateInput != "") {
    endDateInput.disabled = false
  }
  flatpickr(endDateInput, {
    minDate: e.target.value,
    disable: unavailableDates,
    dateFormat: "Y-m-d"
    });
  })

  startDateInput.addEventListener("change", () => {
    if (endDateInput.value != "") {
      let pricePerDay = Number.parseInt(document.querySelector("#price_per_day").innerText)
      let days = (Date.parse(endDateInput.value) - Date.parse(startDateInput.value)) / (1000*60*60*24)
      if (days <= 0) {
        document.querySelector('#booking-infos').innerText = "End date must be after start date"
        document.querySelector('#submit-button').disabled = true
      } else if (dateOverlap(unavailableDates, startDateInput.value, endDateInput.value)){
        document.querySelector('#booking-infos').innerText = "These dates are not available"
        document.querySelector('#submit-button').disabled = true
      } else {
        document.querySelector('#booking-infos').innerText = `Booking from ${startDateInput.value} to ${endDateInput.value} - ${days} days - Total price: $${days*pricePerDay}`
        document.querySelector('#submit-button').disabled = false
      }
    }
  })
  endDateInput.addEventListener("change", () => {
    if (startDateInput.value != "") {
      let pricePerDay = Number.parseInt(document.querySelector("#price_per_day").innerText)
      let days = (Date.parse(endDateInput.value) - Date.parse(startDateInput.value)) / (1000*60*60*24)
      if (days <= 0) {
        document.querySelector('#booking-infos').innerText = "End date must be after start date"
        document.querySelector('#submit-button').disabled = true
      } else if (dateOverlap(unavailableDates, startDateInput.value, endDateInput.value)){
        document.querySelector('#booking-infos').innerText = "These dates are not available"
        document.querySelector('#submit-button').disabled = true
      } else {
        document.querySelector('#booking-infos').innerText = `Booking from ${startDateInput.value} to ${endDateInput.value} - ${days} days - Total price: $${days*pricePerDay}`
        document.querySelector('#submit-button').disabled = false
      }
    }
  })

  };

}


const dateOverlap = (unavailable, start, end) => {
  let overlap = false
  unavailable.forEach((range) => {
    if (dateBetween(start, end, range.from) || dateBetween(start, end, range.to)) {
      overlap = true
    }
  })
  return overlap
}

const dateBetween = (from, to, check) => {
  let fDate,lDate,cDate;
  fDate = Date.parse(from);
  lDate = Date.parse(to);
  cDate = Date.parse(check);
  if((cDate <= lDate && cDate >= fDate))  return true
  return false;
}

export { initFlatpickr };
