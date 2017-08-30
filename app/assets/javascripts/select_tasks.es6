window.addEventListener("load", function(event) {
  const projectName = document.querySelectorAll(".project-name");
  projectName.forEach (function(element) {
    element.addEventListener("click", function(event) {
      const chevron = element.querySelector(".chevron");
      chevron.classList.toggle("rotate");
      const taskList = $(`.task-list[data-mission="${element.dataset.mission}"]`);
      taskList.fadeToggle("fast");
    });
  });
});

$(document).on("ifToggled", ".icheckbox_square-green", function(event) {
  $(this).parents("form").submit();
});
