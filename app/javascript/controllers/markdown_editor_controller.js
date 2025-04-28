import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.initializeEditor()
  }

  initializeEditor() {
    if (!this.element.classList.contains("simplemde-enabled")) {
      // Load SimpleMDE from the global scope (loaded via CDN)
      if (typeof SimpleMDE !== 'undefined') {
        // Initialize SimpleMDE on the textarea
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
      } else {
        console.error("SimpleMDE is not loaded. Make sure the CDN script is included.")
      }
    }
  }
}
