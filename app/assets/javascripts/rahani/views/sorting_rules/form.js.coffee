Rahani.module 'Views.SortingRules', ->
  class @Form extends Backbone.Marionette.ItemView
    template: 'sorting_rules/form'


    ui:
      name: 'input[name=name]'
      contains: 'input[name=contains]'
      category: 'select[name=category]'
      review: 'select[name=review]'

    onRender: ->
      new Rahani.Helpers.FormErrors(@model, @$el)

      @options.categories.on 'all', =>
        @renderCategories()

      @ui.name.val(@model.escape('name'))
      @ui.contains.val(@model.escape('contains'))
      @ui.review.val(@model.escape('review')).change()
      @renderCategories()

    renderCategories: ->
      @ui.category.empty()
      _.each @options.categories.groupBy('type'), (categories, label) =>
        $optgroup = $("<optgroup label='#{label}'></optgroup>")
        _.each categories, (category) =>
          $option = $("<option value='#{category.get('id')}'>#{category.get('name')}</option>")
          $optgroup.append($option)
        @ui.category.append($optgroup)

      @ui.category.val(@model.escape('category_id'))

    events:
      'click button.save': 'save'
      'submit form': 'save'

    update: ->
      data =
        name: @ui.name.val()
        contains: @ui.contains.val()
        category_id: @ui.category.val()
        review: @ui.review.val()

      @model.set(data)

    save: ->
      @update()

      @model.save {},
        success: =>
          @trigger 'save', @model

      false