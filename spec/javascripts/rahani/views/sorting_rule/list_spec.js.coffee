describe "Rahani.Views.SortingRules.List", ->
  createView = ->
    collection = new Rahani.Collections.SortingRules(
      [
        {
          id: 1
          contains: 'Old Name'
          name: 'New Name'
          category_id: 1
          category_name: 'Some Category'
        }
        {
          id: 2
          contains: 'Old Other Name'
          name: 'New Other Name'
          category_id: 2
          category_name: 'Some Other Category'
        }
      ]
    )
    view = new Rahani.Views.SortingRules.List
      collection: collection
    view

  it "should be defined", ->
    expect(Rahani.Views.SortingRules.List).toBeDefined()

  it "should use the correct template", ->
    expect(Rahani.Views.SortingRules.List).toUseTemplate('sorting_rules/list')

  it "can be rendered", ->
    view = createView()
    expect(view.render).not.toThrow()

  it "renders the names", ->
    view = createView().render()
    expect(view.$el).toHaveText(/New Name/)
    expect(view.$el).toHaveText(/New Other Name/)

  it "renders the contains", ->
    view = createView().render()
    expect(view.$el).toHaveText(/Old Name/)
    expect(view.$el).toHaveText(/Old Other Name/)

  it "renders the category names", ->
    view = createView().render()
    expect(view.$el).toHaveText(/Some Category/)
    expect(view.$el).toHaveText(/Some Other Category/)

  it "renders the heading", ->
    view = createView().render()
    expect(view.$el).toContainText('Sorting Rules')
