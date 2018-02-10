Rails.application.routes.draw do
  mount ProgressTasks::Engine => "/progress_tasks"
end
