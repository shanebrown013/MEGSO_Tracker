# frozen_string_literal: true

json.array!(@occupations, partial: 'occupations/occupation', as: :occupation)
