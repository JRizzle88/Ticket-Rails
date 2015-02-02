module ProjectsHelper

  def project_count_label
    if @projectcount > 1
      "projects"
    else
      "project"
    end
  end

end
