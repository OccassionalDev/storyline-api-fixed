json.character @character, partial: 'characters/partials/characterInfo', as: :character

json.canEdit can_edit_or_destroy?(@character)