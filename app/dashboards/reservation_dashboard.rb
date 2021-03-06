require "administrate/base_dashboard"

class ReservationDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    item: Field::BelongsTo,
    user: Field::BelongsTo,
    id: Field::Number,
    return_date: Field::DateTime,
    returned: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    accepted: Field::Boolean,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :item,
    :user,
    :id,
    :return_date,
    :returned,
    :accepted,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :item,
    :user,
    :id,
    :return_date,
    :returned,
    :accepted,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :item,
    :user,
    :return_date,
    :returned,
    :accepted,
  ].freeze

  # Overwrite this method to customize how reservations are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(item)
  #   "Reservation ##{item.name}"
  # end
end
