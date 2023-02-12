module MemosHelper
  def okane(money)
    number_to_currency(money, locale: 'jp')
  end
end
