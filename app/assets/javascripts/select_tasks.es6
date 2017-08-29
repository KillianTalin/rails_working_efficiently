// const submit = document.querySelector("")

// submit.addEventListener("click", function(event) {

// });

window.addEventListener("load", function(event) {
  const projectName = document.querySelectorAll(".project-name");
  projectName.forEach (function(element) {
    element.addEventListener("click", function(event) {
      const taskList = $(`.task-list[data-mission="${element.dataset.mission}"]`);
      taskList.fadeToggle("fast");
    });
  });

  const task = $(".selected");
  task.each(function() {
    $(this).on("click", function(event) {
      $(this).parents("form").submit();
    });
  });
});



