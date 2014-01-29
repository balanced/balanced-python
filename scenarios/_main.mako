<%!
  import string
  def reindent(s, numSpaces):
    s = string.split(s, '\n')
    s = [(numSpaces * ' ') + string.lstrip(line) for line in s]
    s = string.join(s, '\n')
    return s
%>

<%def name="recursive_expand(dikt, delimiter='\\')">
<%
    if not dikt:
        raise StopIteration
    
    keys = sorted(dikt.keys(), key=lambda x: isinstance(dikt[x], dict))
    try:
        last = keys[-1]
    except IndexError:
        last = keys[0]
    
    lines = []
    for k in keys:
        if isinstance(dikt[k], dict):
            for subk, v, slash in recursive_expand(dikt[k], delimiter):
                lines.append(('{0}[{1}]'.format(k, subk), v, slash))
        else:
            lines.append((k, dikt[k], '' if k is last else delimiter))
    return lines
%>
</%def>


<%def name="python_boilerplate()" filter="trim">
import balanced

%if api_location:
balanced.configure('${api_key}', root_url='${api_location}')
%else:
balanced.configure('${api_key}')
%endif
</%def>



<%def name="payload_expand(payload)" filter="trim">
  <%
    formatted_payload = ''
    delimiter = ",\n"
    keys = payload.keys()
    try:
        last = keys[-1]
    except IndexError:
        last = keys[0]

    for k, v, slash in recursive_expand(payload):
        if isinstance(v, basestring):
            formatted_payload += "{0}='{1}'".format(k,v)
        else:
            formatted_payload += "{0}={1}".format(k,v)
        formatted_payload += '' if k is last else delimiter
  %>
  ${reindent(formatted_payload, 2)}
</%def>
