class SortedTransactionSerializer < ActiveModel::Serializer
  attributes :id, :name, :transaction_id, :category_id, :account_id,
    :category_name, :review
end
