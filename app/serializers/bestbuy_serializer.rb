class BestBuySerializer < ActiveModel::Serializer
  attributes :id,
             :sku,
             :name,
             :customerReviewAverage,
             :shortDescription,
             :salePrice,
             :image
end
