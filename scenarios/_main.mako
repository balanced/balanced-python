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
balanced.config.root_uri = ${api_location}'
%endif
balanced.configure('${api_key}')
</%def>



<%def name="payload_expand(payload)" filter="trim">
  <%
    foo = ''
    for k, v, slash in recursive_expand(payload):
        if isinstance(v, basestring):
            foo += "{0}='{1}'\n".format(k,v)
        else:
            foo += "{0}={1}\n".format(k,v)
  %>
  ${reindent(foo, 2)}
</%def>

