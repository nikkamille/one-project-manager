module TasksHelper
    def user_id_field(task)
        if task.user.nil?
          select_tag "task[user_id]", options_from_collection_for_select(User.all, :id, :username)
        else
          label_tag "task[user_username]", task.user_username
        end
    end
end
