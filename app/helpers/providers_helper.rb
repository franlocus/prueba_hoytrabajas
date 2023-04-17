module ProvidersHelper
  def bank_names_for_select(form)
    form.collection_select :bank_name,
                           Bank.all,
                           :name,
                           :name,
                           {},
                           { class: 'block shadow rounded-md border border-gray-200 outline-none px-3 py-2 mt-2 w-full' }
  end

  def attribute_or_empty_message_for(provider_attribute)
    provider_attribute.presence || t('empty_field')
  end
end
