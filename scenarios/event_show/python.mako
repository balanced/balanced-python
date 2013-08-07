% if mode == 'definition':

balanced.Event.find
% else:
import balanced

balanced.configure("8386409cfeea11e2b3ee026ba7c1aba6")


event = balanced.Event.find("/v1/events/EV83d04cdcfeea11e2abcb026ba7cd33d0")

% endif