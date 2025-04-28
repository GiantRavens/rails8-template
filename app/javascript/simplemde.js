import SimpleMDE from "simplemde";
import "simplemde/dist/simplemde.min.css";

document.addEventListener("turbo:load", () => {
  const textarea = document.getElementById("markdown-editor");
  if (textarea && !textarea.classList.contains("simplemde-enabled")) {
    new SimpleMDE({ element: textarea, spellChecker: false });
    textarea.classList.add("simplemde-enabled");
  }
});
