import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

// Connects to data-controller="datepicker"
export default class extends Controller {

  static targets = ["startDate", "endDate"]

  connect() {
    this.startPicker = flatpickr(this.startDateTarget, {
      altInput: true,
      altFormat: "Y, F j",
      dateFormat: "Y-m-d",
      minDate: "today",
      onChange: this.updateEndDateMin.bind(this)
    })

    this.endPicker = flatpickr(this.endDateTarget, {
      altInput: true,
      altFormat: "Y, F j",
      dateFormat: "Y-m-d",
      minDate: "today"
    })
  }

  updateEndDateMin(selectedDates) {
    if (selectedDates.length > 0) {
      const startDate = new Date(selectedDates[0])
      const nextDay = new Date(startDate)
      nextDay.setDate(startDate.getDate() + 1) // ensure end date is AFTER start date
      this.endPicker.set("minDate", nextDay)
    }
  }
}
