% if mode == 'definition':
balanced.Credit.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-nngzAf2ARJV0AA4zzxdyVYJWRa0WLa5I')

credit = balanced.Credit.fetch('/credits/CR3H2YtoAbpQCQ4Ey3RTLxxc')
% endif