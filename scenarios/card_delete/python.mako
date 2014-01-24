% if mode == 'definition':
balanced.Card().unstore()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-nngzAf2ARJV0AA4zzxdyVYJWRa0WLa5I')

card = balanced.Card.fetch('/cards/CC3txpMUnPuUSV6vGdaibuL4')
card.unstore()
% endif