${main.python_boilerplate()}
buyer = balanced.Marketplace.my_marketplace.create_buyer(
% for k, v in payload.iteritems():
    ${k}='${v}',
% endfor
)