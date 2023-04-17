class DashboardPresenter
  def banks_count
    Bank.count
  end

  def providers_count
    Provider.count
  end
end
