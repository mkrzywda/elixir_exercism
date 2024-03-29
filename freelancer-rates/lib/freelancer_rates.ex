defmodule FreelancerRates do
  @daily_rate 8.0
  def daily_rate(hourly_rate) do
    # Please implement the daily_rate/1 function
    hourly_rate * @daily_rate
  end

  def apply_discount(before_discount, discount) do
    # Please implement the apply_discount/2 function
    before_discount * (100 - discount) / 100 |> Float.round(5)
  end

  def monthly_rate(hourly_rate, discount) do
    # Please implement the monthly_rate/2 function
    rate = daily_rate(hourly_rate) * 22
    apply_discount(rate, discount) |> Float.ceil(0) |> trunc
  end

  def days_in_budget(budget, hourly_rate, discount) do
    # Please implement the days_in_budget/3 function
    price = daily_rate(hourly_rate) |> apply_discount(discount)
    budget / price |> Float.floor(1)
  end
end
