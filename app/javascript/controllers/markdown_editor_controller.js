import { Controller } from "@hotwired/stimulus"
import SimpleMDE from "simplemde"

export default class extends Controller {
  connect() {
    this.initializeEditor()
  }

  initializeEditor() {
    if (!this.element.classList.contains("simplemde-enabled")) {
      // Initialize SimpleMDE on the textarea using the locally installed package
      new SimpleMDE({ 
        element: this.element,
        spellChecker: false,
        toolbar: [
          "bold", "italic", "heading", "|", 
          "quote", "unordered-list", "ordered-list", "|",
          "link", "image", "|", 
          "preview", "side-by-side", "fullscreen", "|",
          "guide"
        ]
      })
      
      // Mark as initialized to prevent duplicate editors
      this.element.classList.add("simplemde-enabled")
    }
  }
}
