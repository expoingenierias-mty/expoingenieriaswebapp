class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protected
  def abstract_keys()
    return [:problem, :methodology, :feasibility, :results, :impact, :project_id]
  end

  def project_detail_keys()
    return [:name, :description, :semestre_i, :social_impact, :client_type, :project_id, :category, :area, :strategicarea]
  end

  def social_impact_keys()
    return [:social_cause, :social_commitment, :integrity, :project_id]
  end

  def phase_keys()
    [:name, :start_date, :end_date, :edition_id]
  end

  def user_keys()
    return [:status, :first_name, :last_name, :userable_id, :userable_type, :edition_id, :institution_id]
  end

end
