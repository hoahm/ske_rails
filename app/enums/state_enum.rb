module StateEnum
  extend Enumerize

  DEACTIVE = 0
  ACTIVE = 1

  enumerize :state,
    in: {
      active: ACTIVE,
      deactive: DEACTIVE
    },
    scope: true,
    default: :active
end
