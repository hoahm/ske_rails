module ButtonHelper
  def fontawesome(name)
    "<i class=\"fa fa-#{name}\"></i>".html_safe
  end

  def display_tooltip(title, position = 'top')
    {
      'data-placement' => position,
      'data-toggle' => 'tooltip',
      'data-original-title' => title
    }
  end

  def new_resource_btn(model, path, title = nil)
    title ||= I18n.t('helpers.add_new_resource', model_name: model.model_name.human)

    link_to title, path, display_tooltip(title).merge(class: 'btn btn-warning')
  end

  def view_resource_btn(path)
    link_to fontawesome('search'), path, display_tooltip(t('helpers.view'))
  end

  def edit_resource_btn(path)
    link_to fontawesome('edit'), path, display_tooltip(t('helpers.edit'))
  end

  def destroy_resource_btn(path)
    link_to fontawesome('trash'), path,
            display_tooltip(t('helpers.delete')).merge(method: :delete,
                                                       data: { confirm: t('helpers.are_you_sure') })
  end
end
