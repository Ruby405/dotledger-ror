DotLedger.module 'Views.Reports.IncomeAndExpenses', ->
  class @TableRow extends Backbone.Marionette.ItemView
    template: 'reports/income_and_expenses/table_row'

    tagName: 'tr'

    templateHelpers: ->
      searchLinkHref: =>
        searchParams = {
          date_from: @options.metadata.date_from
          date_to: @options.metadata.date_to
          category_id: @model.get('id')
        }

        "/search/#{JSURL.stringify(searchParams)}/page-1"
      spentAmount: =>
        if @model.get('spent') != '0.0'
          DotLedger.Helpers.Format.money(@model.get('spent'))
      receivedAmount: =>
        if @model.get('received') != '0.0'
          DotLedger.Helpers.Format.money(@model.get('received'))
