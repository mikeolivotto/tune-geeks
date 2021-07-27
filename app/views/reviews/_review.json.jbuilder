json.extract! review, :id, :order_id, :rating, :review, :reviewer_id, :reviewee_id, :created_at, :updated_at
json.url review_url(review, format: :json)
