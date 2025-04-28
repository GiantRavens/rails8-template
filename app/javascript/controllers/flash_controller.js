import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["message"]

  connect() {
    this.setupAutoDismiss()
  }

  close(event) {
    const message = event.target.closest(".flash-message")
    if (message) {
      message.classList.add("opacity-0", "pointer-events-none")
      setTimeout(() => message.remove(), 500)
    }
  }

  setupAutoDismiss() {
    this.messageTargets.forEach(message => {
      // Only auto-dismiss if NOT an error/alert (i.e., not red)
      const isError = message.classList.contains("text-red-700") || 
                      message.classList.contains("border-red-500")
      
      if (!isError) {
        setTimeout(() => {
          message.classList.add("opacity-0", "pointer-events-none")
          setTimeout(() => message.remove(), 500)
        }, 2500)
      }
    })
  }
}
