module ApplicationHelper
  def boolean_options
    [['No', false], ['Sí', true]]
  end

  def major_options
    ["IRS", "ITC", "ITD"]
  end

  def display_boolean_value(value)
    value ? "Sí" : "No"
  end

  def get_current_editions
    editions_available = []
    current_date = Date.today
    Edition.all.each do |edition|
      if edition.start_date <= current_date && edition.end_date >= current_date
          editions_available.push(edition)
      end
    end
    return editions_available
  end

  def get_current_edition_id
    current_date = Date.today
    currentEdition = nil
    Edition.all.each do |ed| 
      if current_date > ed.start_date && current_date < ed.end_date
        currentEdition = ed
      end 
    end 
    if currentEdition == nil 
      return false
    else
      return currentEdition.id
    end
  end

  def get_current_edition_projects
    array = []
    current_edition_id = get_current_edition_id()

    committee_evaluations = CommitteeEvaluation.order('score + description + problem + methodology + feasibility + results + score + impact DESC')

    committee_evaluations.each do |committee_evaluation|
      project = committee_evaluation.project
      if (project.evaluated? && project.edition_id == current_edition_id)||project.accepted?||project.rejected?
        array.push(project)
      end
    end
    return array
  end

  def get_current_phases(edition)
    array = []
    current_date = Date.today
    currentEdition = nil

    edition.phases.each do |phase|
      if phase.start_date <= current_date && phase.end_date >= current_date
        array.push(phase) 
      end
    end
   
    return array.sort_by(&:id)

  end

  def get_current_phases_names(edition)
    array = []
    current_date = Date.today
    currentEdition = nil

    edition.phases.each do |phase|
      if phase.start_date <= current_date && phase.end_date >= current_date
        array.push(phase.name) 
      end
    end
   
    return array

  end


  def project_status_options
    [['Registrado', 'registered'], ['Aprobado', 'approved'], ['No aprobado', 'disapproved'],
     ['Evaluado', 'evaluated'], ['Aceptado', 'accepted'], ['Rechazado', 'rejected'],
     ['Declinado', 'declined'], ['Faltó', 'missed']]
  end
end
