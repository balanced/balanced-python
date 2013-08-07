${main.python_boilerplate()}
refund = balanced.Refund.find('${request['uri']}')
refund.description = '${payload['description']}'
refund.meta = {
% for k, v in payload['meta'].iteritems():
  '${k}': '${v}',
% endfor
}
refund.save()