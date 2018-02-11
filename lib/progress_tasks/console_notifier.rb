module ProgressTasks
  class ConsoleNotifier < ProgressTasks::Notifier
    def started!
      print_progress
    end
    
    def incremented!
      print_progress
    end

    def finished!
      puts "Completed!"
    end

    protected

    def print_progress
      printf("\r#{goal.label}: %d%", goal.progress_percentage)
    end
  end
end