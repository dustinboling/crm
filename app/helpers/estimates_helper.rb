module EstimatesHelper

  def fetch_estimate_number
    if Estimate.last.nil?
      estimate_number = 1
    else
      estimate_number = Estimate.last.id+1
    end
  end

end
